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

    public function tennisPage()
    {
        return view('categories.tennis');
    }

    public function paris2024Page()
    {
        return view('categories.paris24');
    }

    public function basketballPage()
    {
        return view('categories.basketball');
    }

    public function volleyballPage()
    {
        return view('categories.volleyball');
    }

    public function f1Page()
    {
        return view('categories.f1');
    }

    public function handballPage()
    {
        return view('categories.handball');
    }

    public function rugbyPage()
    {
        return view('categories.rugby');
    }
}
