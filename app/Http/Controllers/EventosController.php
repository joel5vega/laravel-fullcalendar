<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\evento;
use stdClass;

class EventosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $semestres = new stdClass();
        $semestres->nombre = "Primer Semestre";
        $semestres->valor = "1";


        return view("eventos.index");
        // ,compact('semestres'));
    }

    /**
     * Show the form for creating a new resource.
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
        $datosEvento = request()->except(['_token', '_method']);
        evento::insert($datosEvento);
        print_r($datosEvento);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $data['eventos'] = evento::all();
        // echo "pasa por show";
        return response()->json($data['eventos']);
    }
    public function showSemestres(Request $request){
        // echo $request;
        // echo $request->semestre;
        $eventos = EventosController::getSemestre($request->semestre);
        return view('eventos.index',compact('eventos'));
    }
    public function showAulas(Request $request){
        //echo $request;
        echo $request->aula;
        return view('eventos.aulas');
    }

    //para obtener los datos dado un semestre
    public function getSemestre($semestre)
    {
       
        $datos['eventos'] = evento::query()->where('daysOfWeek', '=', $semestre)->get();

        return response()->json($datos['eventos']);
        
    }
    public function getAula(Request $request)
    {
        // echo "pasa por getsemestre";
        $datos['eventos'] = evento::query()->where('daysOfWeek', '=', 1)->get();

        return response()->json($datos['eventos']);
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $datosEvento = request()->except(['_token', '_method']);
        $respuesta = evento::where('id', '=', $id)->update($datosEvento);
        return response()->json($respuesta);
    }



    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $eventos = evento::findOrFail($id);
        evento::destroy($id);
        return response()->json($id);
    }
}
