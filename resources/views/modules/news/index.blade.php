@extends("layouts.layout")

@push('styles')
<link href="{{ url('css/news/index.css') }}" rel="stylesheet">
@endpush

@section("title", "News")

@include("layouts.header")
@include("layouts.sidebar")

<div class="container">
    <button type="button" class="btn btn-primary mt-3" id="addNewsButton" data-permission="create_news" disabled onclick="window.location.href='{{ route('news.create') }}'">Add News</button>
    <div class="row mt-3">
        <div class="col-md-6">
            <form id="searchForm" action="{{ route('news.search') }}" method="GET">
                <div class="input-group">
                    <input type="text" name="query" id="searchInput" class="form-control" placeholder="Search..." value="{{ request()->input('query') }}">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-primary">Search</button>
                    </div>
                </div>
            </form>
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
    <div id="pagination-links">
    {{ $news->links('pagination::bootstrap-4') }}
    </div>
</div>

@push('scripts')
<script src="{{ url('js/permissions.js') }}"></script>
<script src="{{ url('js/news/search.js') }}"></script>
@endpush
