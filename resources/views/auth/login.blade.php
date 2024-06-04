@extends('layouts.layout')
@section('title', 'Login')

@push('styles')
<link href="{{ url('css/login.css') }}" rel="stylesheet">
@endpush

@section('body')
<div class="logo">
    <img src="{{ url('images/sync-logo.png') }}" alt="Company Logo" class="logo_img">
    <h3 class="logo-text">News Management System</h3>
</div>
<div class="login-box">
    <form method="POST" action="{{ route('login') }}">
        @csrf
        <h2>Sign In</h2>
        <div class="input-container">
            <input type="email" name="email" placeholder="Email" required>  
        </div>
        <div class="input-container">
            <input type="password" name="password" placeholder="Password" required>
        </div>
        <button id="login_btn" type="submit">Sign In</button>

        @if ($errors->any())
            <div class="alert alert-dangerr">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
    </form>
</div>
@endsection
