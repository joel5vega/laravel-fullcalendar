<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\View;


use App\Ambiente;
use stdClass;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
        //Schema::defaultStringLength(191);
        //para compartir con todas las vistas
        // $semestres=[
        //     {"id":1,"nombre":"Primer Semestre"},
        //     {"id":2,"nombre":"Segundo Semestre"}
        // ]
        // $data['eventos']=evento::all();
        // $datos['eventos']=evento::query()->select(['daysOfWeek','startTime'])->get();
        //print_r($datos);
        /*
        //print_r($datos);
        
        $semestres[1]="Primer Semestre";
        $semestres[2]="Segundo Semestre";
        $semestres[3]="Tercer Semestre";
        $semestres[4]="Cuarto Semestre";
        $semestres[5]="Quinto Semestre";
        $semestres[6]="Sexto Semestre";
        $semestres[7]="Septimo Semestre";
        $semestres[8]="Octavo Semestre";
        $semestres[9]="Noveno Semestre";
        $semestres[10]="Decimo Semestre";
        $semestres[1]="1";
        $semestres[2]="2";
        $semestres[3]="3";
        $semestres[4]="4";
        $semestres[5]="5";
        $semestres[6]="6";
        $semestres[7]="7";
        $semestres[8]="8";
        $semestres[9]="9";
        $semestres[10]="Decimo Semestre";
        $mencion[0]="general";
        $mencion[1]="Telecomunicaciones";
        $mencion[2]="Control";
        $mencion[3]="Sistemas";

        $ambientes['aulas']=Ambiente::all();
        $aulas['aulas']=Ambiente::query()->select(['id','nombre'])->get();
        // print_r($aulas);

        //debo completar
        View::share('semestres',$semestres);
        View::share('aulas',$aulas['aulas']);
        */
    }
}
