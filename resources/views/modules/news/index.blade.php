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
            <form action="{{ route('news.search') }}" method="GET">
                <input type="text" name="query" id="searchInput" class="form-control" placeholder="Search..." value="{{ request()->input('query') }}">
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
    {{ $news->appends(request()->except('page'))->links('pagination::bootstrap-4') }}
</div>

@push('scripts')
<script src="{{ url('js/permissions.js') }}"></script>
<script src="{{ url('js/news/search.js') }}"></script>
@endpush
