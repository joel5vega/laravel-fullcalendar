<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
///Laravel8
use Laravel\Passport\Http\Controllers\AccessTokenController;
////////////////////////////////
// Autenticacion
// PRUEBA
// Route::prefix('/data')->group(function(){
//     Route::post('/ingreso','api\v1\LoginController@login');
// });
//
Route::post('login', [AccessTokenController::class, 'issueToken'])
    ->middleware(['api-login', 'throttle']);
/////////////////////////////////////
// DATOS
Route::get('datos/','DatoController@getEstadistica');
// ->middleware('auth:api');
//API index
Route::get('index', 'DatoController@apiIndex');
//////////////////////////////////////////////////////
// Ambientes
Route::get('ambientes', 'AmbienteController@index');
Route::post('ambientes', 'AmbienteController@store');
Route::get('ambientes/{id}', 'AmbienteController@show');
Route::put('ambientes/{id}', 'AmbienteController@update');
Route::delete('ambientes/{id}', 'AmbienteController@destroy');
//////////////////////////////////////////////////////
// Materias
Route::get('materias', 'MateriaController@index');
Route::get('materias/{id}', 'MateriaController@show');
Route::get('materias/semestre/{semestre}', 'MateriaController@getSemestre');
Route::post('materias/', 'MateriaController@store');
Route::put('materias/{id}', 'MateriaController@update');
Route::delete('materias/{id}', 'MateriaController@destroy');
//////////////////////////////////////////////////////
//Clases
Route::get('clases', 'ClaseController@index');
Route::get('clases/{id}', 'ClaseController@show');
Route::get('clases/semestre/{semestre}', 'ClaseController@getClasesSemestre');
Route::get('clases/ambiente/{ambiente}', 'ClaseController@getClasesAmbiente');
Route::get('clases/responsable/{responsable}', 'ClaseController@getClasesResponsable');
// crear //daremos acceso a docentes
Route::post('clases/', 'ClaseController@crearClase');
//-
Route::post('clases/habilitar/{id}', 'ClaseController@habilitar');
Route::put('clases/{id}', 'ClaseController@editar');
Route::delete('clases/{id}', 'ClaseController@destroy');
//obtener las clases en el momento actual
Route::get('now', 'ClaseController@getClasesNow');
//////////////////////////////////////////////////////
// Periodos
Route::post('periodos/', 'PeriodoController@store');
//-
Route::put('periodos/{id}', 'PeriodoController@update');
Route::delete('periodos/{id}', 'PeriodoController@destroy');
//////////////////////////////////////////////////////
//Responsables
Route::get('responsables', 'ResponsableController@index');
Route::get('responsables/{id}', 'ResponsableController@show');
Route::delete('responsables/{id}', 'ResponsableController@destroy');
Route::put('responsables/{id}','ResponsableController@update');
Route::post('responsables/','ResponsableController@store');
Route::get('responsables/horas/{id}','ResponsableController@getHoras');
//////////////////////////////////////////////////////
// USER
Route::get('users', 'UserController@index');
Route::get('users/{id}', 'UserController@show');
Route::put('users/{id}', 'UserController@update');
Route::post('users', 'UserController@register');
Route::post('users/habilitar/{id}', 'UserController@habilitar');
Route::delete('users/{id}', 'UserController@destroy');
/////////////////////////////////////////////////////////
// PENSUM
Route::post('pensums','PensumController@store');
Route::put('pensums/{id}','PensumController@update');
Route::delete('pensums/{id}','PensumController@destroy');
// MENCION
Route::post('menciones','MencionController@store');
Route::put('menciones/{id}','MencionController@update');
// Route::delete('menciones/{id}','MencionController@destroy');
///////////////////////
Route::get('/redirect', function () {
    $query = http_build_query([
        'client_id' => 'client-id',
        'redirect_uri' => 'http://example.com/callback',
        'response_type' => 'code',
        'scope' => 'place-orders check-status',
    ]);

    return redirect('http://passport-app.com/oauth/authorize?'.$query);
});