@extends("layouts-web.layout")

@section("title", "Sports News")

@include("layouts-web.header")

<!-- Main News Slider Start -->
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
<!-- Main News Slider End -->

<!-- Breaking News Start -->
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
<!-- Breaking News End -->

<!-- Featured News Slider Start -->
<div class="container-fluid pt-5 mb-3">
    <div class="container">
        <div class="section-title">
            <h4 class="m-0 text-uppercase font-weight-bold">Featured News</h4>
        </div>
        <div class="owl-carousel news-carousel carousel-item-4 position-relative" id="featured-news-carousel">
            <!-- Featured news will be dynamically added here -->
        </div>
    </div>
</div>
<!-- Featured News Slider End -->

<!-- News With Sidebar Start -->
<div class="container-fluid">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <h4 class="m-0 text-uppercase font-weight-bold">Latest News</h4>
                            <a class="text-secondary font-weight-medium text-decoration-none" href="">View All</a>
                        </div>
                    </div>
                    <!-- Latest News will be dynamically added here -->
                    <div class="col-12" id="latest-news">
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <!-- Social Follow Start -->
                <div class="mb-3">
                    <div class="section-title mb-0">
                        <h4 class="m-0 text-uppercase font-weight-bold">Follow Us</h4>
                    </div>
                    <div class="bg-white border border-top-0 p-3">
                        <a href="" class="d-block w-100 text-white text-decoration-none mb-3" style="background: #39569E;">
                            <i class="fab fa-facebook-f text-center py-4 mr-3" style="width: 65px; background: rgba(0, 0, 0, .2);"></i>
                            <span class="font-weight-medium">SportsNews</span>
                        </a>
                        <a href="" class="d-block w-100 text-white text-decoration-none mb-3" style="background: #171717;">
                            <i class="fab fa-x-twitter text-center py-4 mr-3" style="width: 65px; background: rgba(0, 0, 0, .2);"></i>
                            <span class="font-weight-medium">SportsNews</span>
                        </a>
                        <a href="" class="d-block w-100 text-white text-decoration-none mb-3" style="background: #C8359D;">
                            <i class="fab fa-instagram text-center py-4 mr-3" style="width: 65px; background: rgba(0, 0, 0, .2);"></i>
                            <span class="font-weight-medium">SportsNews</span>
                        </a>
                    </div>
                </div>
                <!-- Social Follow End -->

                <!-- Trending News Start -->
                <div class="mb-3">
                    <div class="section-title mb-0">
                        <h4 class="m-0 text-uppercase font-weight-bold">Trending News</h4>
                    </div>
                    <div class="bg-white border border-top-0 p-3" id="trending-news">
                        <!-- Trending news items will be dynamically added here -->
                    </div>
                </div>
                <!-- Trending News End -->

                <!-- Tags Start -->
                <div class="mb-3">
                    <div class="section-title mb-0">
                        <h4 class="m-0 text-uppercase font-weight-bold">Categories</h4>
                    </div>
                    <div class="bg-white border border-top-0 p-3">
                        <div class="d-flex flex-wrap m-n1">
                            <a href="football" class="btn btn-sm btn-outline-secondary m-1">Football</a>
                            <a href="tennis" class="btn btn-sm btn-outline-secondary m-1">Tennis</a>
                            <a href="basketball" class="btn btn-sm btn-outline-secondary m-1">Basketball</a>
                            <a href="volleyball" class="btn btn-sm btn-outline-secondary m-1">Volleyball</a>
                            <a href="f1" class="btn btn-sm btn-outline-secondary m-1">F1</a>
                            <a href="handball" class="btn btn-sm btn-outline-secondary m-1">Handball</a>
                            <a href="rugby" class="btn btn-sm btn-outline-secondary m-1">Rugby</a>
                            <a href="euro2024" class="btn btn-sm btn-outline-secondary m-1">Euro 2024</a>
                            <a href="paris2024" class="btn btn-sm btn-outline-secondary m-1">Paris 2024</a>
                            <a href="" class="btn btn-sm btn-outline-secondary m-1">Copa America 2024</a>
                        </div>
                    </div>
                </div>
                <!-- Tags End -->
            </div>
        </div>
    </div>
</div>
<!-- News With Sidebar End -->

@include("layouts-web.footer")

@push('scripts')
<script src="{{ url('js/web/api-script.js') }}"></script>
@endpush  

