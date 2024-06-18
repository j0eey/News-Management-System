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
use App\Http\Controllers\HomeController;
use App\Http\Middleware\EnsureUserIsSuperAdmin;
use App\Http\Middleware\Authenticate;

Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login.show')->middleware('guest');
Route::post('/login', [AuthController::class, 'login'])->name('login.submit');
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

Route::middleware([Authenticate::class])->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
});

Route::resource('tags', TagsController::class);
Route::resource('categories', CategoryController::class);
Route::delete('/media/{media}', [NewsController::class, 'deleteMedia'])->name('media.destroy');

Route::get('/news/search', [NewsController::class, 'search'])->name('news.search');
Route::resource('news', NewsController::class);
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

Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('/api/latest-news', [NewsController::class, 'latestNews']);
Route::get('/football', [HomeController::class, 'footballPage'])->name('football');
Route::get('/euro2024', [HomeController::class, 'euro2024Page'])->name('euro24');
Route::get('/tennis', [HomeController::class, 'tennisPage'])->name('tennis');
Route::get('/paris2024', [HomeController::class, 'paris2024Page'])->name('paris2024');
Route::get('/basketball', [HomeController::class, 'basketballPage'])->name('basketball');
Route::get('/volleyball', [HomeController::class, 'volleyballPage'])->name('volleyball');
Route::get('/f1', [HomeController::class, 'f1Page'])->name('f1');
Route::get('/handball', [HomeController::class, 'handballPage'])->name('handball');
Route::get('/rugby', [HomeController::class, 'rugbyPage'])->name('rugby');

Route::get('public/news/{id}', [HomeController::class, 'showNewsPage'])->name('layouts-web.home');
Route::get('/api/news/{id}', [NewsController::class, 'getSingleNews']);
