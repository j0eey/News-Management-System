@extends("layouts.layout")

@push('styles')
<link href="{{ url('css/dashboard.css') }}" rel="stylesheet">
@endpush


@section("title", "Dashboard")

@include("layouts.header")
@include("layouts.sidebar")


<div class="container">
        @if (session('error'))
            <div class="alert alert-danger">
                {{ session('error') }}
            </div>
        @endif
</div>

