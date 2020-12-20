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
// Route::post('tasks', 'TaskController@store');
// Route::put('tasks/{task}', 'TaskController@markAsCompleted');
//Ambientes
// Route::get('/ambiente', 'AmbienteController@apiIndex');
// Route::get('/ambiente/{id}', 'AmbienteController@show');
// Route::post('/ambiente', 'AmbienteController@store');
// Route::post('/ambiente/{id}/answers', 'AmbienteController@answer');
// Route::delete('/ambiente/{id}', 'AmbienteController@delete');
// Route::delete('/ambiente/{id}/answers', 'AmbienteController@resetAnswers');

//Route::resource('/ambiente','AmbienteController');
// Route::get('periodos','')
/*
Route::post('login','Auth\LoginController@login');
Route::post('crear','ClaseController@crearClase');
Route::post('materias/eliminar/{id}','MateriaController@destroy');
Route::get('materias','MateriaController@getMaterias');

// Responsables

// Route::get('responsables/lista', 'ArticleController@index');
// Route::get('responsables/lista/{article}', 'ArticleController@show');
Route::post('responsables/lista', 'ResponsableController@store');
Route::put('responsables/lista/{article}', 'ResponsableController@update');
Route::delete('responsables/lista/{article}', 'ResponsableController@destroy');

*/
