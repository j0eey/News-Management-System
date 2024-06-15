<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>@yield("title", "Home")</title>
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="{{ asset('css/web/css2.css') }}" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
        <!-- Libraries Stylesheet -->
        <link href="{{ asset('css/web/owl.carousel.min.css') }}" rel="stylesheet">
        <link href="{{ asset('css/web/owl.theme.default.min.css') }}" rel="stylesheet">
        <!-- Customized Stylesheet -->
        <link href="{{ asset('css/web/style.css') }}" rel="stylesheet">
        
        @stack('styles')
        
        
    </head>
    <body>
        <script src="{{ asset('js/web/main.js') }}"></script>
        <script src="{{ asset('js/jquery-3.6.0.min.js') }}"></script>
        <script src="{{ asset('js/web/bootstrap.bundle.min.js') }}"></script>
        <script src="{{ asset('js/web/owl.carousel.min.js') }}"></script>>
        
        
        @stack('scripts')
    </body>

</html>
