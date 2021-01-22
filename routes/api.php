<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
///Laravel8
use Laravel\Passport\Http\Controllers\AccessTokenController;
////////////////////////////////
// Autenticacion
Route::post('register', 'UserController@register');
Route::post('login', [AccessTokenController::class, 'issueToken'])
    ->middleware(['api-login', 'throttle']);
////login con rol

Route::post('rol/{id}', 'ApiLoginController@authenticated');

/////////////////////////////////////
//API index
Route::get('index', 'DatoController@apiIndex');
// Route::get('index', [DatoController::class, 'apiIndex']);
//////////////////////////////////////////////////////
// Ambientes
Route::get('ambientes', 'AmbienteController@index');
Route::post('ambientes', 'AmbienteController@store');
Route::get('ambientes/{id}', 'AmbienteController@show');
Route::put('ambientes/', 'AmbienteController@update');
Route::delete('ambientes/{id}', 'AmbienteController@destroy');
//////////////////////////////////////////////////////
// Materias
Route::get('materias', 'MateriaController@index');
Route::post('materias', 'MateriaController@store');
Route::get('materias/{id}', 'MateriaController@show');
Route::put('materias/', 'MateriaController@update');
Route::delete('materias/{id}', 'MateriaController@destroy');
Route::get('materias/semestre/{semestre}', 'MateriaController@getSemestre');
//////////////////////////////////////////////////////
//Clases
Route::get('clases', 'ClaseController@index');
Route::get('clases/semestre/{semestre}', 'ClaseController@getClasesSemestre');
Route::get('clases/ambiente/{ambiente}', 'ClaseController@getClasesAmbiente');
Route::get('clases/responsable/{responsable}', 'ClaseController@getClasesResponsable');
// crear
//daremos acceso a docentes
Route::post('clases/', 'ClaseController@crearClase');

//obtener las clases en el momento actual
Route::get('now', 'ClaseController@getClasesNow');
//////////////////////////////////////////////////////
//Responsables
Route::get('responsables', 'ResponsableController@index');

//////////////////////////////////////////////////////
//Rutas exclusivas de administradores
Route::get('users', 'UserController@index');
Route::get('users/{id}', 'UserController@show');
