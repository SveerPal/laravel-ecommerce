<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::view('/', 'site.pages.homepage');

Route::get('/category/{slug}', 'Site\CategoryController@show')->name('category.show');


Auth::routes();
require 'admin.php';


/*Route::get('/', function () {
    return view('welcome');
});*/


