<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Materia;
use App\Mencion;
// use Dotenv\Validator;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class MateriaController extends Controller
{
    public function index()
    {
        $materias = Materia::with('pensum', 'menciones')->get();
        return response()->json($materias);
    }

    public function getSemestre(Request $request)
    {
        $semestre = $request->semestre;
        //La mencion debe llegar como mencion_id
        $mencion = $request->query('mencion');
        if (isset($mencion)) {
            $menciones = Mencion::with('materias')->get();
            $indexSemestres = Materia::MateriasSemestre($semestre)->pluck('id');
            $datos['materias'] = $menciones[$mencion - 1]->materias
                ->whereIn('id', $indexSemestres)->values();
        } else {
            if (isset($semestre)) {
                $datos['materias'] = Materia::MateriasSemestre($semestre)->get();
            } else {
                $datos['materias'] = Materia::all();
            }
        }
        return response()->json($datos);
    }


    public function store(Request $request)
    {
       
        $materia = new Materia;
        $validator = Validator::make($request->all(), [
            'nombre' => 'required', 'semestre' => 'required', 'pensum' => 'required',
            'sigla' => 'required', 'tipo' => ['required', 'regex:/(^teoria$|^laboratorio$)/']
        ]);
        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors()
            ], 400);
        }
        $materia->sigla = $request->sigla;
        $materia->nombre = $request->nombre;
        $materia->tipo = $request->tipo;
        $materia->semestre = $request->semestre;
        $materia->pensum_id = $request->pensum;
         
        $materia->save();
        
        // Menciones
        $mencionesSeleccionadas = $request->menciones;
        $materia_id = $materia->id;
        // return $materia_id;
        //Las menciones deben llegar como un objeto en el formato :{id:true,id2:false}
        $menciones = Mencion::all();
        
        foreach ($menciones as $mencion) {
            //verifica si es una materia general
            if ($mencion->nombre !== "General") {
                //en caso de q no sea asigan el id de la mencion, esto para todas las menciones
                $mencion_id = $mencion->id;
                //
                /*
              if(!empty($mencionesSeleccionadas[$mencion_id])){
                return $mencion_id;
              }
              else{
                  return $mencion;
              }
                */
                //verificamos si la mencion seleccionada existe
                if (!empty($mencionesSeleccionadas[$mencion_id])) {
                    //Si la mencion existe entre las menciones seleccionadas en el request
                    
                        $seleccion[$mencion_id] = $materia_id;
                        // return $seleccion;
                        //inserta en la tabla pivot el valor que vincula a las materias
                        DB::insert(
                            'insert into materia_mencion (materia_id, mencion_id) values (?, ?)',
                            [$materia_id, $mencion_id]
                        );
                    // }
                    
                }
                
            }
        }
return response()->json([
            "message" => "Materia creada",
            "data"=>$materia,
        ], 201);

        return response()->json([
            "message" => "Materia creada",
        ], 201);
    }

    public function show($id)
    {
        $materias = Materia::find($id);
        return  view('Materias.show', compact('materias'));
    }

    public function update(Request $request, $id)
    {
        /*
        $this->validate($request, [
            'nombre' => 'required',
            'sigla' => 'required',
            'semestre' => 'required',
            'pensum' => 'required',
            'tipo' => 'required'
        ]);
        */

        $materia = Materia::find($id);
        $materia->sigla = $request->sigla;
        $materia->nombre = $request->nombre;
        $materia->tipo = $request->tipo;
        $materia->semestre = $request->semestre;
        $materia->pensum_id = $request->pensum_id;
        $materia->save();
        // return $materia;
        // Menciones
        $mencionesSeleccionadas = $request->menciones;
        //Las menciones deben llegar como un objeto en el formato :{id:true,id2:false}
        $menciones = Mencion::all();
        foreach ($menciones as $mencion) {
            if ($mencion->nombre !== "General") {
                $mencion_id = $mencion->id;
                if (isset($mencionesSeleccionadas[$mencion_id])) {
                    $valor = $mencionesSeleccionadas[$mencion_id];
                    if ($valor == true) {
                        $seleccion[$mencion_id] = $mencion_id;
                    }
                }
            }
        }
        $materia->menciones()->sync($seleccion);
        return response()->json([
            "message" => "Materia editada",
            "request" => $seleccion,
        ], 201);
    }

    public function destroy($id)
    {
        Materia::find($id)->delete();
        return response()->json([
            "message" => "Materia eliminada",
        ], 200);
    }

    public function getMaterias(Request $request)
    {
        $id = $request->id;
        if (isset($id)) {
            $datos['materias'] = Materia::find($id);
        } else {
            $datos['materias'] = Materia::all();
        }
        return response()->json($datos);
    }
}
