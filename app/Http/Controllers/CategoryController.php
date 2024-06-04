<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::all();
        return view('modules.categories.index', compact('categories'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
        ]);

        Category::create($request->only('title', 'description'));
        return response()->json(['success' => true]);
    }

    public function update(Request $request, $id)
    {
        $category = Category::findOrFail($id);

        if ($category->news()->count() > 0) {
            return redirect()->route('categories.index')->with('error', 'Category cannot be edited because it is associated with news articles.');
        }

        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
        ]);

        $category->update($request->only('title', 'description'));
        return redirect()->route('categories.index')->with('success', 'Category updated successfully');
    }



    public function destroy($id)
    {
        $category = Category::findOrFail($id);

        if ($category->news()->count() > 0) {
            return redirect()->route('categories.index')->with('error', 'Category cannot be deleted because it is associated with news articles.');
        }

        $category->delete();
        return redirect()->route('categories.index')->with('success', 'Category deleted successfully');
    }

}
