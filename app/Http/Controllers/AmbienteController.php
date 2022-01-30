<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Ambiente as Ambiente;
use App\Dato;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use PhpParser\Node\Expr\AssignOp\Concat;

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
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nombre' => 'required|not_regex:/[^A-Za-z0-9\- ]/',
            'tipo' => ['required', 'regex:/(^laboratorio$|^aula$)/'],
            'capacidad' => 'nullable|int', 'descripcion' => 'nullable'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors()
            ], 400);
        }
        Ambiente::create($request->all());
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
        $validator = Validator::make($request->all(), [
            'nombre' => 'required|not_regex:/[^A-Za-z0-9\- ]/',
            'tipo' => ['required', 'regex:/(^laboratorio$|^aula$)/'],
            'capacidad' => 'nullable|int', 'descripcion' => 'nullable'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors()
            ], 400);
        }
        $ambiente = Ambiente::find($request->id)->update($request->all());
        if ($ambiente) {
            $response = "Ambiente editado";
        }
        return response()->json($response);
    }

    public function destroy($id)
    {
        $ambiente=Ambiente::find($id);
        if(!isset($ambiente)){
            return "Ambiente no encontrado";
        }
        $c1 = Dato::Ambiente(2, $id)->pluck('id');
        $clase = [];
        $i = 0;
        foreach ($c1 as $c) {

            $clase[$i] = $c;
            $i=$i+1;
        }
        $c2 = Dato::Ambiente(3, $id)->pluck('id');
        foreach ($c2 as $c) {
            array_push($clase, $c);
        }
        foreach ($clase as $id) {
            DB::update(
                'update clases set estado=?, ambiente_id=? where id=?',
                ['false', 9, $id]
            );
        }
         $ambiente->delete();
        return response()->json('Ambiente eliminado');
    }
}
