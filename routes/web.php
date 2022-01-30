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
/*
Route::view('/{path?}', 'app');
/* Enrutado original a welcome.blade 
Route::get('/', function () {
    return view('welcome');
});

// Route::resource('ambiente', 'AmbienteController');

Route::get('/', 'ClaseController@index')->middleware('auth');


// Auth::routes(['register' => false, 'reset' => false, 'verify' => false]);


//para rececpcionar eventos
Route::get('showSemestres/{semestre}', 'EventosController@showSemestres');
Route::get('showAulas/{aula}', 'EventosController@showAulas');

//obtener datos para api
Route::get('datos/', 'DatoController@getDatos');
Route::get('search/{dato}', 'DatoController@getSearch');
//Devuelve las clases dadas ciertas condiciones
Route::get('semestres/{semestre}', 'DatoController@getClasesEnSemestre');
Route::get('ambientes/{ambiente}', 'DatoController@getClasesEnAmbiente');
Route::get('responsables/{responsable}', 'DatoController@getClasesEnResponsable');
//obtener las clases en el momento actual
Route::get('now', 'DatoController@getClasesNow');

Route::get('index/materias/', 'DatoController@getMaterias');
Route::get('index', 'DatoController@apiIndex');
Route::get('index/materias/{semestre}', 'DatoController@getMaterias');
//Devuelve todos los ambientes
Route::get('index/ambientes', 'DatoController@getAmbientes');
//Devuelve los responsables
Route::get('index/responsables', 'DatoController@getResponsables');


Route::get('aulas', 'EventosController@getAula');


// Route::resource('eventos', 'EventosController')->middleware('auth');
Route::resource('clases', 'ClaseController');
// ->middleware('auth');

// crud responsable
Route::resource('/responsable/lista', 'ResponsableController');

Route::get('/semestre', 'MateriaController@getSemestre');
// Route::resource('materia', 'MateriaController');
// Route::resource('semestre','ApiEventos');
Route::get('/home', 'HomeController@index')->name('home');

// Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');



Route::get('/home', 'HomeController@index')->name('home');
*/