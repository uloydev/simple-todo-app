<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::namespace('Api')->group( function () {
    Route::post('login', 'AuthController@login');
    Route::post('register', 'AuthController@register');

    Route::middleware('auth:api')->group( function () {
        Route::get('todos/finished', 'TodoController@getFinished');
        Route::post('todos/{todo}/finish', 'TodoController@setFinished');
        Route::resource('todos', 'TodoController')->except(['create', 'edit']);
    });
});
