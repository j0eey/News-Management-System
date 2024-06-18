<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield("title", "Admin Panel")</title>
    <link href="{{ url('css/bootstrap.min.css') }}" rel="stylesheet">
    @stack('styles')

  </head>
  <body>
    @yield('body')
    <script src="{{ url('js/ckeditor.js') }}"></script>
    <script src="{{ url('js/jquery-3.6.0.min.js') }}"></script>
    <script src="{{ url('js/bootstrap.min.js') }}"></script>
    <script src="{{ url('js/bootstrap.bundle.min.js') }}"></script>
    <!-- <script src="{{ url('js/disable-element.js') }}"></script> -->
    @stack('scripts')
  </body>
</html> 