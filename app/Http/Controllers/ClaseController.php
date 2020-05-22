<?php

namespace App\Http\Controllers;

use App\Clase;
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
        $data['eventos'] = Clase::all();
        // echo "pasa por show";
        return response()->json($data['eventos']);
    }
    public function getSemestre($id)
    {
        //
        // echo "getSemestre";
        // echo $id;

        $clases = Clase::CalxSemestre($id)->get();

        return response()->json($clases);
    }
    public function getAmbiente($id)
    {
        // //
        // echo "getAmbiente";
        // echo $id;

        $clases = Clase::CalxAmbiente($id)->get();

        return response()->json($clases);
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
