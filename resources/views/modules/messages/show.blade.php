@extends("layouts.layout")

@push('styles')
<link href="{{ url('css/messages/index.css') }}" rel="stylesheet">
@endpush

@section("title", "Messages Details")

@include("layouts.header")
@include("layouts.sidebar")

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="form-group">
                        <label>Name:</label>
                        <p>{{ $message->name }}</p>
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        <p>{{ $message->email }}</p>
                    </div>
                    <div class="form-group">
                        <label>Subject:</label>
                        <p>{{ $message->subject }}</p>
                    </div>
                    <div class="form-group">
                        <label>Message:</label>
                        <p>{{ $message->message }}</p>
                    </div>
                    <div class="form-group">
                        <label>Date:</label>
                        <p>{{ $message->created_at->format('Y-m-d H:i:s') }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>