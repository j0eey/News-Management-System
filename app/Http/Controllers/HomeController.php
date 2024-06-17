<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        return view('layouts-web.home');
    }
    
    public function footballPage()
    {
        return view('categories.football');
    }

    public function euro2024Page()
    {
        return view('categories.euro24');
    }
}
