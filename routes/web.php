<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});


Route::group(['prefix' => 'admin'], function () {
    //Route::get('contacts/checkin','Voyager\ContactController@checkin')->name('contacts.checkin');

    Route::get('checkin/{name?}','Voyager\ContactController@create_checkin')->name('checkin.form');
    Route::post('checkin/store','Voyager\ContactController@store_checkin')->name('checkin.store');

    Route::get('pre_checkin','Voyager\ContactController@pre_checkin')->name('checkin.pre');
    Route::post('pre_checkin/verify','Voyager\ContactController@checkin_verify')->name('checkin.verif');

    

    Route::get('elder/delete/{id}', 'Voyager\ElderController@search')->name('elder.delete');

    Route::get('elder/addSejour', 'Voyager\ElderController@addSejour')->name('elder.addSejour');
    Route::get('elder/editSejour', 'Voyager\ElderController@editSejour')->name('elder.editSejour');

    Voyager::routes();

    Route::get('elders',['uses' => 'Voyager\ElderController@index',  'as' => 'voyager.elders.index']);

   // Route::get('checkin', 'Voyager\ContactController@checkin');


});


Route::get('/clear-cache', function() {
    Artisan::call('cache:clear');
    return "Cache is cleared";
});
