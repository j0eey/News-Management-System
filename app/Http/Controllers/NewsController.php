<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\News;
use App\Models\Category;
use App\Models\Tag;
use App\Models\User;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class NewsController extends Controller
{
    public function index()
    {
        $news = News::with('tags')
                    ->orderBy('created_at', 'desc') // Ensure descending order
                    ->paginate(15);
        return view('modules.news.index', compact('news'));
    }

    public function create()
    {
        $categories = Category::all();
        $tags = Tag::all();
        return view('modules.news.create', compact('categories', 'tags'));
    }

    public function store(Request $request)
    {
        // Ensure user is authenticated
        if (!auth()->check()) {
            return redirect()->back()->with('error', 'User not authenticated');
        }

        // Log authenticated user ID
        Log::info('Authenticated user ID:', ['user_id' => auth()->id()]);

        try {
            $request->validate([
                'title' => 'required',
                'description' => 'required',
                'custom_date' => 'required|date',
                'category_id' => 'required',
                'tags' => 'nullable|array',
                'images.*' => 'nullable|image',
                'main_image_index' => 'nullable|integer',
            ]);

            $data = $request->except(['images', 'tags', 'main_image_index']);
            $data['user_id'] = auth()->id();

            $news = News::create($data);

            if ($request->has('tags')) {
                $news->tags()->attach($request->input('tags'));
            }

            $mainImageId = null;
            if ($request->hasFile('images')) {
                foreach ($request->file('images') as $index => $image) {
                    $media = $news->addMedia($image)->toMediaCollection('images');
                    if ($index == $request->input('main_image_index')) {
                        $mainImageId = $media->id;
                    }
                }
            }

            $news->main_image_id = $mainImageId;
            $news->save();

            return redirect()->route('news.index')->with('success', 'News created successfully');
        } catch (\Exception $e) {
            Log::error('Error creating news', ['exception' => $e->getMessage()]);
            return redirect()->back()->with('error', 'Error creating news');
        }
    }

    public function edit(News $news)
    {
        $categories = Category::all();
        $tags = Tag::all();
        $allTags = Tag::all();
        $selectedTags = $news->tags ? $news->tags->pluck('id')->toArray() : [];

        return view('modules.news.edit', compact('news', 'categories', 'tags', 'allTags', 'selectedTags'));
    }

    public function update(Request $request, News $news)
    {
        try {

            $request->validate([
                'title' => 'required',
                'description' => 'required',
                'custom_date' => 'required|date',
                'category_id' => 'required',
                'tags' => 'nullable|array',
                'images.*' => 'nullable|image',
                'main_image' => 'nullable|image',
            ]);

            $data = $request->except(['images', 'tags']);

            $news->update($data);

            if ($request->has('tags')) {
                $news->tags()->sync($request->input('tags'));
            } else {
                $news->tags()->detach();
            }

            // Check if a main image is set
            if ($request->hasFile('main_image')) {

                // Clear existing main image
                $news->clearMediaCollection('images');

                // Add new main image
                $mainImage = $news->addMedia($request->file('main_image'))->toMediaCollection('images');

                // Set main_image_id to the ID of the new main image
                $news->main_image_id = $mainImage->id;
            }

            // Set main_image_id when an existing image is set as main image
            if ($request->has('main_image_id')) {
                $news->main_image_id = $request->input('main_image_id');
            }

            // Add additional images
            if ($request->hasFile('images')) {
                foreach ($request->file('images') as $image) {
                    $media = $news->addMedia($image)->toMediaCollection('images');
                }
            }

            // Save changes
            $news->save();

            return redirect()->route('news.index')->with('success', 'News updated successfully');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Error updating news');
        }
    }

    public function uploadImages(Request $request, News $news)
    {
        $request->validate([
            'images.*' => 'nullable|image',
        ]);

        try {
            if ($request->hasFile('images')) {
                foreach ($request->file('images') as $image) {
                    $news->addMedia($image)->toMediaCollection('images');
                }
            }
            return response()->json(['success' => true]);
        } catch (\Exception $e) {
            Log::error('Error uploading images', ['exception' => $e->getMessage()]);
            return response()->json(['success' => false, 'message' => 'Error uploading images'], 500);
        }
    }

    public function destroy(News $news)
    {
        if ($news->image) {
            \Storage::delete('public/' . $news->image);
        }
        $news->delete();

        return redirect()->route('news.index')->with('success', 'News deleted successfully');
    }

    public function deleteMedia(Request $request)
    {
        $mediaId = $request->input('media_id');

        // Log the received media ID
        Log::info('Deleting media with ID: ' . $mediaId);

        // Find the media by ID
        $media = Media::findOrFail($mediaId);

        // Log the media details
        Log::info('Media details: ' . json_encode($media));

        // Get the file name
        $fileName = $media->file_name;

        // Log the file name
        Log::info('File name to be deleted: ' . $fileName);

        try {
            // Delete the associated file from the storage
            Storage::disk($media->disk)->delete($media->getPath());

            // Log the deletion success
            Log::info('File deleted successfully: ' . $fileName);
        } catch (\Exception $e) {
            // Log the error message
            Log::error('Error deleting file: ' . $e->getMessage());

            // Return an error response
            return response()->json([
                'success' => false,
                'message' => 'Failed to delete the image.'
            ], 500);
        }

        // Delete the media record
        $media->delete();

        // Log the media record deletion
        Log::info('Media record deleted successfully: ' . $mediaId);

        // Return a success response with the file name
        return response()->json([
            'success' => true,
            'file_name' => $fileName
        ]);
    }

    public function show(News $news)
    {
        $news->load('tags', 'category', 'media', 'user');
        return view('modules.news.show', compact('news'));
    }

    public function search(Request $request)
    {
        $query = $request->input('query');

        $news = News::where('title', 'LIKE', "%{$query}%")
                    ->orWhere('description', 'LIKE', "%{$query}%")
                    ->orWhereHas('category', function ($q) use ($query) {
                        $q->where('title', 'LIKE', "%{$query}%");
                    })
                    ->orWhereHas('tags', function ($q) use ($query) {
                        $q->where('title', 'LIKE', "%{$query}%");
                    })
                    ->with('category', 'tags', 'media')
                    ->orderBy('created_at', 'desc') // Ensure consistent ordering
                    ->paginate(15);

        $paginationHtml = $news->appends(['query' => $query])->links('pagination::bootstrap-4')->toHtml();

        return response()->json([
            'html' => view('modules.news.partials.news_table_body', compact('news'))->render(),
            'pagination' => $paginationHtml,
        ]);
    }


    public function latestNews()
    {
        $news = News::with(['category', 'mainImage', 'tags', 'user'])
            ->orderBy('created_at', 'desc')
            ->get()
            ->map(function ($item) {
                return [
                    'title' => $item->title,
                    'description' => $item->description,
                    'category' => $item->category ? $item->category->title : 'Uncategorized',
                    'custom_date' => $item->custom_date->format('M d, Y'),
                    'image_url' => $item->mainImageUrl,
                    'link' => route('layouts-web.home', $item->id),
                    'tags' => $item->tags->pluck('title')->toArray(),
                ];
            });

        return response()->json($news);
    }

    public function getSingleNews($id)
    {
        $news = News::with(['category', 'mainImage', 'tags', 'user'])->findOrFail($id);

        // Get author details
        $authorName = $news->user ? $news->user->name : 'Unknown';
        $authorImage = $news->user ? $news->user->profile_picture : null;

        return response()->json([
            'title' => $news->title,
            'description' => $news->description,
            'category' => $news->category ? $news->category->title : 'Uncategorized',
            'custom_date' => $news->created_at->format('M d, Y H:i'),
            'image_url' => $news->mainImageUrl,
            'tags' => $news->tags->pluck('title')->toArray(),
            'author' => $authorName,
            'author_image_url' => $authorImage,
        ]);
    }

    public function searchResults(Request $request)
    {
        $query = $request->input('query');

        // Perform the search query
        $news = News::with(['category', 'mainImage', 'tags', 'user'])
                    ->where(function ($q) use ($query) {
                        $q->where('title', 'LIKE', "%{$query}%")
                        ->orWhere('description', 'LIKE', "%{$query}%")
                        ->orWhereHas('category', function ($q) use ($query) {
                            $q->where('title', 'LIKE', "%{$query}%");
                        })
                        ->orWhereHas('tags', function ($q) use ($query) {
                            $q->where('title', 'LIKE', "%{$query}%");
                        });
                    })
                    ->orderBy('created_at', 'desc')
                    ->paginate(6);


        $news->getCollection()->transform(function ($item) {
            return [
                'title' => $item->title,
                'description' => Str::words(strip_tags($item->description), 20, '...'),
                'category' => $item->category ? $item->category->title : 'Uncategorized',
                'custom_date' => $item->custom_date->format('M d, Y'),
                'image_url' => $item->mainImageUrl,
                'link' => route('layouts-web.home', $item->id),
                'tags' => $item->tags->pluck('title')->toArray(),
            ];
        });


        return view('layouts-web.results', compact('news'));
    }

}
