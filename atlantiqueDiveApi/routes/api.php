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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// User routes
Route::post('/login', 'UserController@login');
Route::post('/register', 'UserController@register');
Route::post('/updateProfile', 'UserController@update');
//Route::get('/me', 'UserController@me');

// DiveSite route
Route::post('/divesite', 'DiveSitesController@add');
Route::get('/divesites', 'DiveSitesController@getAllDiveSites');

Route::post('/notice', 'DiveSitesController@addNotice');
Route::get('/notice', 'DiveSitesController@getNotice');

Route::post('/presence', 'DiveSitesController@addPresence');
Route::get('/presence', 'DiveSitesController@getPresence');

// Admin route

// for user
Route::get('/admin/users', 'AdminController@listUsers');
Route::get('/admin/user', 'AdminController@getUser');
Route::post('/admin/updateProfile', 'AdminController@updateProfile');
Route::delete('/admin/user', 'AdminController@deleteUser');

// for proposals
Route::get('/admin/proposals', 'AdminController@listProposals');
Route::post('/admin/acceptProposal', 'AdminController@acceptProposal');
Route::delete('/admin/refuseProposal', 'AdminController@refuseProposal');




