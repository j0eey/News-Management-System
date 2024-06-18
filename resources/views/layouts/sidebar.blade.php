@push('styles')
<link href="{{ url('css/sidebar.css') }}" rel="stylesheet">
@endpush

<div class="sidebar">
    <div class="logo">
        <img src="{{ url('images/sync-logo.png') }}" alt="Logo">
    </div>
    <div>
        <a href="{{ route('news.index') }}" class="sidebar-link">
            <img src="{{ url('images/newspaper.png') }}" alt="News Logo">
            News
        </a>
    </div>
    <div>
        <a href="{{ route('tags.index') }}" class="sidebar-link">
            <img src="{{ url('images/price-tag.png') }}" alt="Tags Logo">
            Tags
        </a>
    </div>
    <div>
        <a href="{{ route('categories.index') }}" class="sidebar-link">
            <img src="{{ url('images/categories.png') }}" alt="Categories Logo">
            Categories
        </a>
    </div>
    <div>
    <a href="{{ route('modules.messages.index') }}" class="sidebar-link">
        <img src="{{ url('images/email.png') }}" alt="Messages Logo">
        Messages
    </a>
    </div>
    <div>
    <a href="{{ route('admin.members.index') }}" class="sidebar-link">
        <img src="{{ url('images/user.png') }}" alt="User Logo">
        Admin Management
    </a>
    </div>
</div>
