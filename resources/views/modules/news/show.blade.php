@extends("layouts.layout")
@push('styles')
<link href="{{ url('css/news/show.css') }}" rel="stylesheet">
@endpush

@section("title", "News")

@include("layouts.header")
@include("layouts.sidebar")



<div class="container">
    <h1>{{ $news->title }}</h1>
    <p>Posted by {{ $news->user->name ?? 'Admin' }} on {{ $news->custom_date }}</p>

    @if($news->main_image_id)
    <div class="row">
        <div class="col-12">
            <img src="{{ $news->getMedia('images')->where('id', $news->main_image_id)->first()->getUrl() }}" alt="{{ $news->title }}" class="img-fluid mb-2">
        </div>
    </div>
    @endif

    <div>
        <p>{!! $news->description !!}</p>
    </div>

    <div class="row">
        @foreach($news->getMedia('images') as $media)
            @if($media->id != $news->main_image_id)
            <div class="col-md-4">
                <img src="{{ $media->getUrl() }}" alt="{{ $news->title }}" class="img-fluid mb-2">
            </div>
            @endif
        @endforeach
    </div>

    <div>
        <strong>Category:</strong> {{ $news->category->title }}
    </div>
    <div><strong>Tags:</strong> {{ implode(', ', $news->tags->pluck('title')->toArray() ?? []) }}</div>
</div>
