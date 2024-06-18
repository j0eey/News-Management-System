@extends("layouts.layout")

@push('styles')
<link href="{{ url('css/admin/index.css') }}" rel="stylesheet">
@endpush

@section("title", "Admin Management")

@include("layouts.header")
@include("layouts.sidebar")

<div class="container mt-4">
    <a href="{{ route('admin.members.create') }}" class="btn btn-primary mb-3">Add New User</a>
    
    @if($members->count())
        <table class="table table-striped table-responsive-md mt-3">
            <thead class="thead-dark">
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Last Login</th>
                    <th>Joined Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach($members as $member)
                <tr class="member-row" data-member-id="{{ $member->id }}" data-member-name="{{ $member->name }}">
                    <td>{{ $member->name }}</td>
                    <td>{{ $member->email }}</td>
                    <td>{{ $member->roles->pluck('name')->implode(', ') }}</td>
                    <td>{{ $member->last_login_date ? \Carbon\Carbon::parse($member->last_login_date)->format('d-m-Y H:i:s') : 'Never' }}</td>
                    <td>{{ $member->created_at->format('d-m-Y, h:i A') }}</td>
                    <td>
                        <a href="{{ route('admin.members.edit', $member->id) }}" class="btn btn-warning btn-sm">Edit</a>
                        <button class="btn btn-info btn-sm permissions-btn" data-toggle="modal" data-target="#permissionsModal" data-member-id="{{ $member->id }}" data-member-name="{{ $member->name }}">Permissions</button>
                        <form action="{{ route('admin.members.destroy', $member->id) }}" method="POST" style="display:inline;">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this member?')">Delete</button>
                        </form>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
        {{ $members->links('pagination::bootstrap-4') }}
    @else
        <p>No members available.</p>
    @endif
</div>

<!-- Permissions Modal -->
<div class="modal fade" id="permissionsModal" tabindex="-1" role="dialog" aria-labelledby="permissionsModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="permissionsModalLabel">Permissions for <span id="permissionsMemberName"></span></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <img src="{{ url('images/close-button.png') }}" alt="Close">
                </button>
            </div>
            <div class="modal-body">
                <form id="permissionsForm">
                    @csrf
                    <input type="hidden" name="member_id" id="permissionsMemberId">
                    <div class="form-group">
                        <label for="permissions">Permissions:</label>
                        <div id="permissionsList">
                            <!-- Permissions checkboxes will be dynamically loaded here -->
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="savePermissionsBtn">Save Permissions</button>
            </div>
        </div>
    </div>
</div>

@push('scripts')
<script src="{{ url('js/admin_permissions.js') }}"></script>
<script>
    var savePermissionsRoute = "{{ route('admin.members.savePermissions') }}";
    var permissionsRoute = "{{ route('admin.members.permissions', ['member' => ':memberId']) }}";
</script>
@endpush