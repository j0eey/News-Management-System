@extends("layouts-web.layout")

@section("title", "Results")

@include("layouts-web.header")

<div class="container-fluid mt-5 pt-3">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <h4 class="m-0 text-uppercase font-weight-bold">Search Results</h4>
                        </div>
                    </div>
                    @foreach ($news as $article)
                    <div class="col-lg-6">
                        <div class="position-relative mb-3">
                            <img class="img-fluid w-100" src="{{ $article['image_url'] ?? 'img/default.jpg' }}" style="object-fit: cover;">
                            <div class="bg-white border border-top-0 p-4">
                                <div class="mb-2">
                                    <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2">{{ $article['category'] }}</a>
                                    <a class="text-body"><small>{{ $article['custom_date'] }}</small></a>
                                </div>
                                <a class="h4 d-block mb-3 text-secondary text-uppercase font-weight-bold" href="{{ $article['link'] }}">{{ $article['title'] }}</a>
                                <p class="m-0">{{ $article['description'] }}</p>
                            </div>
                        </div>
                    </div>
                    @endforeach
                    <div class="col-12">
                        {{ $news->appends(request()->query())->links('pagination::bootstrap-4') }}
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

@include("layouts-web.footer")


