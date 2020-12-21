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
/*
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
*/
//API index
Route::get('index', 'DatoController@apiIndex');
// Ambientes
Route::get('ambientes', 'AmbienteController@index');
Route::post('ambientes', 'AmbienteController@store');
Route::get('ambientes/{id}', 'AmbienteController@show');
Route::put('ambientes/', 'AmbienteController@update');
Route::delete('ambientes/{id}', 'AmbienteController@destroy');
// Materias
Route::get('materias', 'MateriaController@index');
Route::post('materias', 'MateriaController@store');
Route::get('materias/{id}', 'MateriaController@show');
Route::put('materias/', 'MateriaController@update');
Route::delete('materias/{id}', 'MateriaController@destroy');
//Clases
Route::get('clases', 'ClaseController@index');
Route::get('clases/semestre/{semestre}','ClaseController@getClasesEnSemestre');