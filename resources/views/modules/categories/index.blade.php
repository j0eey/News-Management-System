@extends("layouts.layout")
@section("title", "Categories")
@extends("layouts.header")
@extends("layouts.sidebar")

@push('styles')
<link href="{{ url('css/category/index.css') }}" rel="stylesheet">
@endpush

<div class="container">
    @if(session('error'))
        <div class="alert alert-danger">{{ session('error') }}</div>
    @endif
    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <button class="btn btn-primary" data-toggle="modal" data-target="#categoryModal" id="addCategoryButton">Add New Category</button>
    <table class="table mt-3">
        <thead>
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody id="categoryTableBody">
            @foreach($categories as $category)
                <tr id="category-{{ $category->id }}">
                    <td>{{ $category->title }}</td>
                    <td>{{ $category->description }}</td>
                    <td>
                        <button class="btn btn-warning editCategoryButton" data-id="{{ $category->id }}" data-title="{{ $category->title }}" data-description="{{ $category->description }}" data-toggle="modal" data-target="#categoryModal">Edit</button>
                        <form action="{{ route('categories.destroy', $category->id) }}" method="POST" style="display:inline;" class="deleteCategoryForm">
                            @csrf
                            @method('DELETE')
                            <button type="button" class="btn btn-danger deleteCategoryButton">Delete</button>
                        </form>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>

<div class="modal fade" id="categoryModal" tabindex="-1" role="dialog" aria-labelledby="categoryModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="categoryModalLabel">Add New Category</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <img src="{{ url('images/close-button.png') }}" alt="Close">
                </button>
            </div>
            <div class="modal-body">
                <form id="categoryForm" action="{{ route('categories.store') }}" method="POST">
                    @csrf
                    <input type="hidden" id="categoryId" name="id">
                    <div class="form-group">
                        <label for="title">Category Title</label>
                        <input type="text" class="form-control" id="title" name="title" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Category Description</label>
                        <textarea class="form-control" id="description" name="description" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary" id="saveButton">Add Category</button>
                </form>
            </div>
        </div>
    </div>
</div>

@push('scripts')
<script src="{{ url('js/jquery-3.5.1.min.js') }}"></script>
<script src="{{ url('js/bootstrap.min.js') }}"></script>
<script src="{{ url('js/index-category.js') }}"></script>
@endpush
