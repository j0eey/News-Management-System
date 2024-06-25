@push('styles')
<link href="{{ url('css/header.css') }}" rel="stylesheet">
@endpush

<header class="header">
    <div class="header-content">
        <h1 class="title">@yield('title')</h1>
        <div class="profile-picture" onclick="toggleDropdown()">
            <img src="{{ Auth::user()->profile_picture ? url('storage/app/public/' . Auth::user()->profile_picture) : asset('images/profile.png') }}" alt="Admin Profile Picture">
            <div class="dropdown-menu" id="profileDropdown">
                <a href="{{ route('profile.show') }}" class="dropdown-item">Profile</a>
                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                    @csrf
                </form>
                <a href="#" class="dropdown-item" onclick="document.getElementById('logout-form').submit();">Log Out</a>
            </div>
        </div>
    </div>
</header>

@yield('body')

<script src="{{ asset('js/header.js') }}"></script>
