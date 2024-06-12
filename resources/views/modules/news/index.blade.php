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
            @foreach($news as $item)
            <tr>
                <td><a href="{{ route('news.show', $item->id) }}">{{ $item->title }}</a></td>
                <td><a href="{{ route('news.show', $item->id) }}">{!! Str::limit(strip_tags($item->description), 50) !!}</a></td>
                <td>
                    @if($item->main_image_id)
                        @php $mainImage = $item->getMedia('images')->where('id', $item->main_image_id)->first(); @endphp
                        @if($mainImage)
                            <img src="{{ $mainImage->getUrl() }}" alt="{{ $item->title }}" width="100">
                        @else
                            <span>Main Image Not Found</span>
                        @endif
                    @elseif($item->getFirstMedia('images'))
                        <img src="{{ $item->getFirstMedia('images')->getUrl() }}" alt="{{ $item->title }}" width="100">
                    @else
                        <span>No Image Found</span>
                    @endif
                </td>
                <td>{{ $item->custom_date }}</td>
                <td>{{ $item->category->title }}</td>
                <td>{{ implode(', ', $item->tags->pluck('title')->toArray() ?? []) }}</td>
                <td>
                    <a href="{{ route('news.edit', $item->id) }}" class="btn btn-warning" data-permission="edit_news">Edit</a>
                    <form action="{{ route('news.destroy', $item->id) }}" method="POST" style="display:inline;">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger" data-permission="delete_news">Delete</button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>

    {{ $news->links('pagination::bootstrap-4') }}
</div>

@push('scripts')
<script src="{{ url('js/permissions.js') }}"></script>
<script>
    $(document).ready(function () {
        $('#searchInput').on('keyup', function () {
            var query = $(this).val();

            $.ajax({
                url: "{{ route('news.search') }}",
                type: "GET",
                data: {
                _token:"{{ csrf_token() }}",
                    query: query
                },
                success: function (data) {
                    $('#newsTableBody').html(data);
                },
                error: function (xhr, status, error) {
                    console.error("Error occurred during search request:", error);
                }
            });
        });
    });
</script>
@endpush
