<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\NewsController;
use App\Http\Controllers\TagsController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\AdminMemberController;
use App\Http\Controllers\ProfileController;
use App\Http\Middleware\EnsureUserIsSuperAdmin;
use App\Http\Middleware\Authenticate;


Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login')->middleware('guest');
Route::post('/login', [AuthController::class, 'login'])->name('login');
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');
Route::middleware([Authenticate::class])->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

});

Route::resource('news', NewsController::class);
Route::resource('tags', TagsController::class);
Route::resource('categories', CategoryController::class);
Route::delete('/media/{media}', [NewsController::class, 'deleteMedia'])->name('media.destroy');
Route::middleware(['auth'])->group(function () {
    Route::resource('news', NewsController::class);
});

Route::post('/news/{news}/upload-images', [NewsController::class, 'uploadImages'])->name('news.uploadImages');

Route::middleware([EnsureUserIsSuperAdmin::class])->prefix('admin')->group(function () {
    Route::get('/members', [AdminMemberController::class, 'index'])->name('admin.members.index');
    Route::get('/members/create', [AdminMemberController::class, 'create'])->name('admin.members.create');
    Route::post('/members', [AdminMemberController::class, 'store'])->name('admin.members.store');
    Route::get('/members/{member}/edit', [AdminMemberController::class, 'edit'])->name('admin.members.edit');
    Route::put('/members/{member}', [AdminMemberController::class, 'update'])->name('admin.members.update');
    Route::delete('/members/{member}', [AdminMemberController::class, 'destroy'])->name('admin.members.destroy');
    Route::get('/members/{member}/permissions', [AdminMemberController::class, 'getPermissions'])->name('admin.members.permissions');
    Route::post('/save-permissions', [AdminMemberController::class, 'savePermissions'])->name('admin.members.savePermissions');
});

Route::get('/user-permissions', [AdminMemberController::class, 'getUserPermissions'])->name('user.permissions');

Route::get('/profile', [ProfileController::class, 'show'])->name('profile.show');
Route::post('/profile', [ProfileController::class, 'update'])->name('profile.update');