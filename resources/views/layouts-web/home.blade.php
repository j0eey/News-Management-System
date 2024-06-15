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

<div class="container-fluid bg-dark py-3 mb-3">
    <div class="container">
        <div class="row align-items-center bg-dark">
            <div class="col-12">
                <div class="d-flex justify-content-between">
                    <div class="bg-primary text-dark text-center font-weight-medium py-2" style="width: 170px;">Breaking News</div>
                    <div id="announcements-carousel" class="owl-carousel tranding-carousel position-relative d-inline-flex align-items-center ml-3"
                            style="width: calc(100% - 170px); padding-right: 90px;">
                        <!-- Announcements will be dynamically inserted here -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



@push('scripts')
<script src="{{ url('js/web/api-script.js') }}"></script>
@endpush  

