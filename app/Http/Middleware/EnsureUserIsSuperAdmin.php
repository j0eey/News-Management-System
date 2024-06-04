<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EnsureUserIsSuperAdmin
{
    public function handle(Request $request, Closure $next)
    {
        // Retrieve the authenticated user with roles eager loaded
        $user = Auth::user()->load('roles');

        // Check if the user is authenticated and is a super admin
        if ($user && $user->is_super_admin == 1) {
            return $next($request);
        }

        return redirect('/dashboard')->with('error', 'You do not have permission to access this page.');
    }
}

