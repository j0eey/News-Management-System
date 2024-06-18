@extends("layouts.layout")

@push('styles')
<link href="{{ url('css/messages/index.css') }}" rel="stylesheet">
@endpush

@section("title", "Messages")

@include("layouts.header")
@include("layouts.sidebar")

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped table-responsive-md mt-3">
                <thead class="thead-dark">
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Subject</th>
                        <th>Message</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($messages as $message)
                    <tr>
                        <td>{{ $message->name }}</td>
                        <td>{{ $message->email }}</td>
                        <td>{{ $message->subject }}</td>
                        <td>{{ str_word_count($message->message) > 12 ? implode(' ', array_slice(explode(' ', $message->message), 0, 12)) . '...' : $message->message }}</td>
                        <td>{{ $message->created_at->format('Y-m-d H:i:s') }}</td>
                        <td><a href="{{ route('modules.messages.show', $message->id) }}" id="read-message-{{ $message->id }}" class="btn btn-info btn-sm permissions-btn">Read Message</a></td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
