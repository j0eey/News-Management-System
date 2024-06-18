@extends("layouts.layout")
@push('styles')
<link href="{{ url('css/tag/index.css') }}" rel="stylesheet">
@endpush
@section("title", "Tags")
@extends("layouts.header")
@extends("layouts.sidebar")

<div class="container">
    <button class="btn btn-primary" data-toggle="modal" data-target="#tagModal" id="addTagButton" data-permission="create_tags" disabled>Add New Tag</button>
    <table class="table mt-3">
        <thead>
            <tr>
                <th>Title</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @foreach($tags as $tag)
            <tr>
                <td>{{ $tag->title }}</td>
                <td>
                    <button class="btn btn-warning editTagButton" data-id="{{ $tag->id }}" data-title="{{ $tag->title }}" data-toggle="modal" data-target="#tagModal" data-permission="edit_tags" disabled>Edit</button>
                    <form action="{{ route('tags.destroy', $tag->id) }}" method="POST" style="display:inline;" class="deleteTagForm">
                        @csrf
                        @method('DELETE')
                        <button type="button" class="btn btn-danger deleteTagButton" data-permission="delete_tags" disabled>Delete</button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>

<div class="modal fade" id="tagModal" tabindex="-1" role="dialog" aria-labelledby="tagModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="tagModalLabel">Add New Tag</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <img src="{{ url('images/close-button.png') }}" alt="Close">
        </button>
      </div>
      <div class="modal-body">
        <form id="tagForm" action="{{ route('tags.store') }}" method="POST">
            @csrf
            <input type="hidden" id="tagId" name="id">
            <div class="form-group">
                <label for="title">Tag Title</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>
            <button type="submit" class="btn btn-primary" id="saveButton">Add Tag</button>
        </form>
      </div>
    </div>
  </div>
</div>

@push('scripts')
<script src="{{ url('js/jquery-3.5.1.min.js') }}"></script>
<script src="{{ url('js/bootstrap.min.js') }}"></script>
<script src="{{ url('js/index-tags.js') }}"></script>
<script src="{{ url('js/permissions.js') }}"></script>
@endpush
