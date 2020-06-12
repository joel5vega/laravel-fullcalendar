<?php

namespace App\Http\Controllers;

use App\Clase;
use App\Dato;

use Illuminate\Http\Request;

class ClaseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {


        $ambiente = $request->query('ambiente');
        $semestre = $request->query('semestre');

        if (isset($ambiente)) {
            if ($ambiente == 'undefined') {
                $data['eventos'] = Clase::all();
                // $data['eventos'] =Clase::query()->where('ambiente_id', '=', 1)->get();
                return response()->json($data['eventos']);
            } else

                $data['eventos'] = Clase::query()->where('ambiente_id', '=', $ambiente)->get();
            return response()->json($data['eventos']);
        }
        //para ver si llego el semestre
        elseif (isset($semestre)) {
            if ($semestre == 'undefined') {
                $data['eventos'] = Clase::all();
                return response()->json($data['eventos']);
            } else

                $data['eventos'] = Clase::CalxSemestre($semestre)->get();
            return response()->json($data['eventos']);
        }



        $eventos = [];

        return $ambiente;
    }

    /**
     * Show the fo`rm for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Clase  $clase
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $data['eventos'] = Dato::all();

        return response()->json($data['eventos']);
    }

    public function crearClase(Request $request){
        
        $clase= new Clase;
        $clase->periodo_id = $request->periodo;
        $clase->materia_id = $request->materia;
        $clase->responsable_id=$request->responsable;
        $clase->ambiente_id=$request->ambiente;
        $clase->daysOfWeek=$request->day;
        $clase->startTime=$request->startTime;
        $clase->endTime=$request->endTime;
        $tipo=$request->tipo;
        $nivel=$request->nivel;

        function setColor($tipo,$nivel){
            if($tipo=='aula'){
                if($nivel=='docente'){
                    $color="#0066CC";
                }
                else{
                    $color="#00CCFF";
                }
            }
            else{
                if($nivel=='docente'){
                    $color="#006600";
                }
                else{
                    $color="#00FF00";
                }
            }
            return $color;
        }
        $color=setColor($tipo,$nivel);
        $clase->color=$color;
        $clase->save();
        return response()->json([
            "message"=> "estudiante creado",
            "request"=>$clase,
            "color"=>$color
        ],201);
    }



    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Clase  $clase
     * @return \Illuminate\Http\Response
     */
    public function edit(Clase $clase)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Clase  $clase
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Clase $clase)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Clase  $clase
     * @return \Illuminate\Http\Response
     */
    public function destroy(Clase $clase)
    {
        //
    }
}
