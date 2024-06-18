<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Contact;


class MessageController extends Controller
{
    public function index()
    {
        $messages = Contact::latest()->paginate(10);
        return view('modules.messages.index', compact('messages'));
    }

    public function show($id)
    {
        $message = Contact::findOrFail($id);
        return view('modules.messages.show', compact('message'));
    }
}
