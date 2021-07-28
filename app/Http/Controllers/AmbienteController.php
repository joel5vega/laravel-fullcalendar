<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Ambiente as Ambiente;
use Illuminate\Support\Facades\Validator;

class AmbienteController extends Controller
{
    public function index(Request $request)
    {
        $tipo = $request->query('tipo');
        if (isset($tipo)) {
            $ambientes = Ambiente::Tipo($tipo)->get();
            $response = $ambientes;
        } else {
            $ambientes  = Ambiente::all();
            $response['ambientes'] = $ambientes;
        }
        return response()->json($response);
        // return view('Ambiente.index', compact('ambientes'));
    }

    public function store(Request $request)
    {
        //
        $validator = Validator::make($request->all(), [
            'nombre' => 'required|not_regex:/[^A-Za-z0-9\- ]/', 
            'tipo' => 'required', 
            'capacidad' => 'nullable|int', 'descripcion' => 'nullable'
        ]);
        // $validatedData = $request->validate(
        //     ['nombre' => 'required', 'tipo' => 'required', 'capacidad' => 'nullable|int', 'descripcion' => 'nullable']
        // );
        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors()
            ], 400);
        }
        return $request;
        // $ambiente = Ambiente::create($validatedData);
        return response()->json('Ambiente creado');
    }

    public function show($id)
    {
        //
        $ambientes = Ambiente::find($id);
        return response()->json($ambientes);
    }

    public function update(Request $request)
    {
        //
        $validatedData = $request->validate(
            ['id' => 'required', 'nombre' => 'required', 'tipo' => 'required', 'capacidad' => 'nullable']
        );
        Ambiente::find($request->id)->update($validatedData);

        return $request;
    }

    public function destroy($id)
    {
        Ambiente::find($id)->delete();
        return response()->json('Ambiente eliminado');
    }
}
