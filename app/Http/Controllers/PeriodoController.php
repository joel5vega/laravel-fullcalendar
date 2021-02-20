<?php

namespace App\Http\Controllers;

use App\Periodo;
use Illuminate\Http\Request;

class PeriodoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        $this->validate($request, [
            'nombre' => 'required', 'start_date' => 'required',
            'gestion' => 'required', 'end_date' => 'required'

        ]);
        // $periodo = new Periodo;
        $periodo = Periodo::create([
            'nombre' => $request->nombre, 'start_date' => $request->start_date,
            'gestion' => $request->gestion, 'end_date' => $request->end_date

        ]);
        $response['message'] = "Periodo creado exitosamente";
        $response['periodo'] = $periodo;

        return $response;
    }


    public function show(Periodo $periodo)
    {
        //
    }

    public function edit(Periodo $periodo)
    {
        //
    }


    public function update(Request $request, Periodo $periodo)
    {
        $periodo = Periodo::find($request->id);
        $this->validate($request, [
            'id' => 'required', 'nombre' => 'required', 'start_date' => 'required',
            'gestion' => 'required', 'end_date' => 'required'

        ]);
        $periodo->nombre = $request->nombre;
        $periodo->gestion = $request->gestion;
        $periodo->start_date = $request->start_date;
        $periodo->end_date = $request->end_date;
        $periodo->save();
        return $periodo;
    }

    public function destroy(Request $request)
    {
        Periodo::destroy($request->id);
        $response = "Registro eliminado satisfactoriamente";
        return $response;
    }
}
