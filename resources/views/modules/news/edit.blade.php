@extends("layouts.layout")

@push('styles')
<link href="{{ url('css/news/edit.css') }}" rel="stylesheet">
@endpush

@section("title", "Edit News")

@include("layouts.header")
@include("layouts.sidebar")

<div class="container">
    <form id="news-edit-form" action="{{ route('news.update', $news->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <ul class="nav nav-tabs" id="newsTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="information-tab" data-toggle="tab" href="#information" role="tab" aria-controls="information" aria-selected="true">Information</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="media-tab" data-toggle="tab" href="#media" role="tab" aria-controls="media" aria-selected="false">Media</a>
            </li>
        </ul>
        <div class="tab-content" id="newsTabContent">
            <div class="tab-pane fade show active" id="information" role="tabpanel" aria-labelledby="information-tab">
                <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" name="title" class="form-control" value="{{ $news->title }}" required>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea name="description" id="description" class="form-control" required>{!! $news->description !!}</textarea>
                </div>
                <div class="form-group">
                    <label for="custom_date">Updated Date</label>
                    <input type="date" name="custom_date" class="form-control" value="{{ $news->custom_date->format('Y-m-d') }}" required>
                </div>
                <div class="form-group">
                    <label for="category">Category</label>
                    <select name="category_id" class="form-control" required>
                        @foreach($categories as $category)
                        <option value="{{ $category->id }}" @if($category->id == $news->category_id) selected @endif>{{ $category->title }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label for="tags">Tags</label>
                    @foreach($allTags as $tag)
                    <div class="form-check">
                        <input type="checkbox" name="tags[]" value="{{ $tag->id }}" class="form-check-input" @if(in_array($tag->id, $selectedTags)) checked @endif>
                        <label class="form-check-label">{{ $tag->title }}</label>
                    </div>
                    @endforeach
                </div>
                <button type="submit" class="btn btn-primary mt-3">Update News</button>
            </div>
            <div class="tab-pane fade" id="media" role="tabpanel" aria-labelledby="media-tab">
                <div class="form-group">
                    <label for="images">Images</label>
                    <div id="image-upload-container">
                        @foreach($news->getMedia('images') as $media)
                            <div class="image-upload-wrapper mb-2">
                                <img src="{{ $media->getUrl() }}" alt="{{ $news->title }}" width="100">
                                <button type="button" class="btn btn-secondary set-main-image @if($media->id == $news->main_image_id) btn-primary @endif" data-media-id="{{ $media->id }}">Main</button>
                                <button type="button" class="btn btn-danger btn-sm mt-2 delete-image" data-media-id="{{ $media->id }}">Delete</button>
                            </div>
                        @endforeach
                    </div>
                    <button type="button" id="add-more-images" class="btn btn-secondary mt-2">Add More</button>
                    <button type="button" id="save-images" class="btn btn-primary mt-2" disabled>Save Images</button>
                    <input type="hidden" id="main-image-id" name="main_image_id" value="{{ $news->main_image_id }}">
                </div>
            </div>
        </div>
    </form>
</div>

@push('scripts')
<script src="{{ url('js/news/create.js') }}"></script>
<script src="{{ url('js/news/edit-media.js') }}"></script>
<script src="{{ url('js/jquery-3.5.1.min.js') }}"></script>
<script src="{{ url('js/bootstrap.min.js') }}"></script>
<script>
    window.deleteMediaUrl = "{{ url('media') }}";
    window.saveImagesUrl = "{{ route('news.uploadImages', $news->id) }}";
</script>
@endpush
