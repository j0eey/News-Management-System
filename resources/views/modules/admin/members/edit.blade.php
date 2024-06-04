@extends("layouts.layout")

@push('styles')
<link href="{{ url('css/admin/edit.css') }}" rel="stylesheet">
@endpush

@section("title", "Edit User")

@include("layouts.header")
@include("layouts.sidebar")


<div class="container">
    
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('admin.members.update', $member->id) }}" method="POST">
        @csrf
        @method('PUT')

        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="name" value="{{ old('name', $member->name) }}" required>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="{{ old('email', $member->email) }}" required>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password">
            <small>Leave blank to keep the current password</small>
        </div>

        <div class="form-group">
            <label for="role">Role</label>
            <select class="form-control" id="role" name="role" required>
                @foreach ($roles as $role)
                    <option value="{{ $role->name }}" 
                        {{ old('role', optional($member->roles->first())->name) == $role->name ? 'selected' : '' }}>
                        {{ $role->name }}
                    </option>
                @endforeach
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Update Member</button>
    </form>
</div>

@push('scripts')
<script src="{{ url('js/jquery-3.5.1.min.js') }}"></script>
<script src="{{ url('js/bootstrap.min.js') }}"></script>
@endpush
