@extends("layouts-web.layout")

@section("title", "Contact Us")

@include("layouts-web.header")

<!-- News With Sidebar Start -->
<div class="container-fluid mt-5 pt-3">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="section-title mb-0">
                    <h4 class="m-0 text-uppercase font-weight-bold">Contact Us For Any Inquiries                    </h4>
                </div>
                <div class="bg-white border border-top-0 p-4 mb-3">
                    <div class="mb-4">
                        <div class="mb-3">
                            <div class="d-flex align-items-center mb-2">
                                <i class="fa fa-map-marker-alt text-primary mr-2"></i>
                                <h6 class="font-weight-bold mb-0">Our Office</h6>
                            </div>
                            <p class="m-0">Souk Street 111, Jbeil, Lebanon</p>
                        </div>
                        <div class="mb-3">
                            <div class="d-flex align-items-center mb-2">
                                <i class="fa fa-envelope-open text-primary mr-2"></i>
                                <h6 class="font-weight-bold mb-0">Email Us</h6>
                            </div>
                            <p class="m-0">info.sportsnews.com@gmail.com</p>
                        </div>
                        <div class="mb-3">
                            <div class="d-flex align-items-center mb-2">
                                <i class="fa fa-phone-alt text-primary mr-2"></i>
                                <h6 class="font-weight-bold mb-0">Call Us</h6>
                            </div>
                            <p class="m-0">+961 3 359751</p>
                        </div>
                    </div>
                    <h6 class="text-uppercase font-weight-bold mb-3">Contact Us</h6>
                    <form id="contact-form">
                        <div class="form-row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control p-4" placeholder="Your Name" name="name" required="required"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="email" class="form-control p-4" placeholder="Your Email" name="email" required="required"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control p-4" placeholder="Subject" name="subject" required="required"/>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" rows="4" placeholder="Message" name="message" required="required"></textarea>
                        </div>
                        <div>
                            <button class="btn btn-primary font-weight-semi-bold px-4" style="height: 50px;" type="submit">Send Message</button>
                        </div>
                    </form>
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
<!-- News With Sidebar End -->


@include("layouts-web.footer")

@push('scripts')
<script src="{{ url('js/web/api-contact.js') }}"></script>
@endpush