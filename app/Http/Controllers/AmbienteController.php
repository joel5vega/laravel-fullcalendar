<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Ambiente as Ambiente;

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
        $validatedData = $request->validate(
            ['nombre' => 'required', 'tipo' => 'required', 'capacidad' => 'nullable','descripcion'=>'nullable']
        );
        $ambiente = Ambiente::create($validatedData);
        return response()->json('Ambiente creado');
        // return $request;
        //return redirect()->route('ambiente.index')->with('success', 'Registro creado satisfactoriamente');
    }

    public function show($id)
    {
        //
        $ambientes = Ambiente::find($id);
        return response()->json($ambientes);
        // return  view('ambiente.show',compact('ambientes'));1
    }

    public function update(Request $request)
    {
        //
        $validatedData = $request->validate(
            ['id' => 'required', 'nombre' => 'required', 'tipo' => 'required', 'capacidad' => 'nullable']
        );
        Ambiente::find($request->id)->update($validatedData);

        return $request;
        // return redirect()->route('ambiente.index')->with('success', 'Registro actualizado satisfactoriamente');
    }

    public function destroy($id)
    {
        Ambiente::find($id)->delete();
        return response()->json('Ambiente eliminado');
        // return redirect()->route('ambiente.index')->with('success', 'Registro eliminado satisfactoriamente');
    }
    /*
    public function edit($id)
    {
        //
        $ambiente = ambiente::find($id);
        return view('ambiente.edit', compact('ambiente'));
    }
    public function create()
    {
        //
        echo 'llega';
        // return view('Ambiente.create');
    }

    */
}
