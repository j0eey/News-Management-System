@extends("layouts.layout")

@push('styles')
<link href="{{ url('css/news/create.css') }}" rel="stylesheet">
@endpush

@section("title", "Add News")

@include("layouts.header")
@include("layouts.sidebar")

<div class="container">
    <form id="news-form" action="{{ route('news.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
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
                    <input type="text" name="title" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea name="description" id="description" class="form-control"></textarea>
                </div>
                <div class="form-group">
                    <label for="custom_date">Publish Date</label>
                    <input type="date" name="custom_date" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="category">Category</label>
                    <select name="category_id" class="form-control" required>
                        @foreach($categories as $category)
                        <option value="{{ $category->id }}">{{ $category->title }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label for="tags">Tags</label>
                    @foreach($tags as $tag)
                    <div class="form-check">
                        <input type="checkbox" name="tags[]" value="{{ $tag->id }}" class="form-check-input">
                        <label class="form-check-label">{{ $tag->title }}</label>
                    </div>
                    @endforeach
                </div>
                <button type="submit" class="btn btn-primary mt-3">Add News</button>
            </div>
            <div class="tab-pane fade" id="media" role="tabpanel" aria-labelledby="media-tab">
                <div class="form-group">
                    <label for="images">Images</label>
                    <div id="image-upload-container">
                        <div class="image-upload-wrapper mb-2">
                            <input type="file" name="images[]" class="form-control mt-2 new-image-input" accept="image/*">
                            <button type="button" class="btn btn-secondary set-main-image">Set as Main</button>
                        </div>
                    </div>
                    <button type="button" id="add-more-images" class="btn btn-secondary">Add More</button>
                    <input type="hidden" id="main-image-index" name="main_image_index">
                </div>
            </div>
        </div>
    </form>
</div>

@push('scripts')
<script src="{{ url('js/ckeditor.js') }}"></script>
<script src="{{ url('js/news/create.js') }}"></script>
<script src="{{ url('js/news/create-media.js') }}"></script>
<script src="{{ url('js/jquery-3.5.1.min.js') }}"></script>
<script src="{{ url('js/bootstrap.min.js') }}"></script>


@endpush
