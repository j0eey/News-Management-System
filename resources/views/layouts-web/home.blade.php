@extends("layouts-web.layout")

@section("title", "Sports News")

@include("layouts-web.header")

<div class="container-fluid" id="news-container">
    <div class="row">
        <div class="col-lg-7 px-0">
            <div class="owl-carousel main-carousel position-relative" id="main-carousel">
                <!-- News items will be dynamically added here -->
            </div>
        </div>
        <div class="col-lg-5 px-0">
            <div class="row mx-0" id="secondary-news">
                <!-- Secondary news items will be dynamically added here -->
            </div>
        </div>
    </div>
</div>



@push('scripts')
<script src="{{ url('js/web/api-script.js') }}"></script>
@endpush  

