<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckPermission
{
    public function handle(Request $request, Closure $next, ...$permissions)
    {
        // Get the authenticated user
        $user = Auth::user();
        
        // Check if the user is logged in and has the required permission
        if ($user && $user->hasAnyPermission($permissions)) {
            return $next($request);
        }
        
        // If the user doesn't have the required permission, return unauthorized response
        return response()->json(['error' => 'Unauthorized'], 403);
    }
}