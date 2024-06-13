@extends("layouts.layout")

@push('styles')
<link href="{{ url('css/news/index.css') }}" rel="stylesheet">
@endpush

@section("title", "News")

@include("layouts.header")
@include("layouts.sidebar")

<div class="container">
    <a href="{{ route('news.create') }}" class="btn btn-primary mt-3" data-permission="create_news">Add News</a>
    <div class="row mt-3">
        <div class="col-md-6">
            <input type="text" id="searchInput" class="form-control" placeholder="Search...">
        </div>
    </div>
    <table class="table mt-3">
        <thead>
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Image</th>
                <th>Date</th>
                <th>Category</th>
                <th>Tags</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody id="newsTableBody">
            @include('modules.news.partials.news_table_body', ['news' => $news])
        </tbody>
    </table>
    {{ $news->appends(['sort' => 'asc'])->links('pagination::bootstrap-4') }}
</div>

@push('scripts')
<script src="{{ url('js/permissions.js') }}"></script>
<script src="{{ url('js/news/search.js') }}"></script>
@endpush
