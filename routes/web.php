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

// Route::get('/', function () {
//     // return view('welcome');
//     return view('eventos/index');
// });
Route::get('/','ClaseController@index')->middleware('auth');


Auth::routes(['register'=>false,'reset'=>false,'verify'=>false]);
//para rececpcionar eventos
Route::get('showSemestres/{semestre}','EventosController@showSemestres');
Route::get('showAulas/{aula}','EventosController@showAulas');

//obtener datos para api
Route::get('datos/','DatoController@getDatos');
Route::get('search/{dato}','DatoController@getSearch');
Route::get('semestres/{semestre}','DatoController@getClasesEnSemestre');
Route::get('ambientes/{ambiente}','DatoController@getClasesEnAmbiente');
Route::get('index/materias/','DatoController@getMaterias');
Route::get('index','DatoController@apiIndex');
Route::get('index/materias/{semestre}','DatoController@getMaterias');
Route::get('index/ambientes','DatoController@getAmbientes');
Route::get('index/responsables','DatoController@getResponsables');


Route::get('aulas','EventosController@getAula');


Route::resource('eventos','EventosController')->middleware('auth');
Route::resource('clases','ClaseController');
// ->middleware('auth');
Route::resource('ambiente', 'AmbienteController');

Route::get('/semestre','MateriaController@getSemestre');
// Route::resource('materia', 'MateriaController');
// Route::resource('semestre','ApiEventos');
Route::get('/home', 'HomeController@index')->name('home');

