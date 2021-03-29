<?php

namespace App\Http\Controllers;

use App\Clase;
use App\Responsable;
use App\Periodo;
use App\Dato;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\ClaseController;

class ResponsableController extends Controller
{

    public function index(Request $request)
    {
        $nivel = $request->query('nivel');
        if (isset($nivel)) {
            $datos['responsables'] = Responsable::Nivel($nivel)->orderBy("ap_paterno")->get();
        } else
            $datos['responsables'] = Responsable::all();
        return response()->json($datos);
    }


    public function create()
    {
        //
    }


    public function store(Request $request)
    {
        //
        $this->validate($request, [
            'ap_paterno' => 'required',
            'puesto' => 'required'
        ]);
        $responsable = new Responsable;
        $responsable->titulo = $request->titulo;
        $responsable->nombre = $request->nombre;
        $responsable->ap_paterno = $request->ap_paterno;
        $responsable->ap_materno = $request->ap_materno;
        $responsable->puesto = $request->puesto;
        $responsable->telefono = $request->telefono;
        $responsable->email = $request->email;
        $responsable->descripcion = $request->descripcion;
        $responsable->foto = $request->foto;

        $responsable->save();

        return response()->json([
            "message" => "Responsable creado",
            "request" => $responsable,

        ], 201);
        return $responsable;
    }


    public function show(Responsable $responsable)
    {
        //
    }

    public function edit(Responsable $responsable)
    {
        //
    }


    public function update(Request $request, Responsable $responsable)
    {
        //
        return "update";
    }

    public function destroy(Request $request)
    {
        $id = $request->id;
        // $periodo
        $clases = Dato::Responsable($id)->pluck('id');
        Clase::whereIn('id', $clases)->update(['responsable_id' => '1']);
        // ->get();
        User::where('id', $id)->update(['responsable_id' => '1']);
        Responsable::destroy($request->id);
        $response = "Registro eliminado satisfactoriamente";
        return $response;
    }
    //Funcioin para obtener el periodo actual
    public function getActualPeriodoId()
    {
        //obtiene hora actual
        $now = date("Y-m-d");
        $actual = Periodo::Actual($now)->first();
        return $actual->id;
    }
}
