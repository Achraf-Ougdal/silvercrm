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

    Route::get('elders/addSejour/{id}', 'Voyager\Elder_room_Controller@indexAddSejour')->name('elder.addSejour');
    Route::post('elders/addSejour/store', 'Voyager\Elder_room_Controller@addSejour')->name('addSejour');
    Route::get('elders/editSejour/{id}', 'Voyager\Elder_room_Controller@indexEditSejour')->name('elder.editSejour');
    Route::post('elders/editSejour/store', 'Voyager\Elder_room_Controller@editSejour')->name('editSejour');
    Route::get('elders/deleteSejour/{id}', 'Voyager\Elder_room_Controller@deleteSejour')->name('deleteSejour');
    Route::get('residences/add/grille-tarif/{id}', 'Voyager\ResidenceController@indexAddGrille')->name('indexAddGrille');
    Route::get('residences/edit/grille-tarif/{id}', 'Voyager\ResidenceController@indexEditGrille')->name('indexEditGrille');
    Route::post('residences/addGrille', 'Voyager\ResidenceController@addGrille')->name('addGrille');
    Route::get('residences/viewGrille/{id}', 'Voyager\ResidenceController@viewGrille')->name('viewGrille');
    Route::get('residences/searchGrille', 'Voyager\ResidenceController@searchGrille')->name('grilleSearch');
    Route::post('residences/editGrille', 'Voyager\ResidenceController@editGrille')->name('editGrille');

    Voyager::routes();

    Route::get('elders',['uses' => 'Voyager\ElderController@index',  'as' => 'voyager.elders.index']);
    Route::get('elders/{id}',['uses' => 'Voyager\ElderController@show',  'as' => 'voyager.elders.show']);
    Route::get('residences/{id}',['uses' => 'Voyager\ResidenceController@show',  'as' => 'voyager.residences.show']);

   // Route::get('checkin', 'Voyager\ContactController@checkin');


});


Route::get('/clear-cache', function() {
    Artisan::call('cache:clear');
    return "Cache is cleared";
});
