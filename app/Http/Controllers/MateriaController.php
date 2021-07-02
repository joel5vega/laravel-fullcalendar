<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Materia;
use App\Pensum;
use App\Mencion;
use Illuminate\Support\Facades\DB;
use App\MateriaController\guardarMencion;

class MateriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //

        $materias = Materia::with('pensum', 'menciones')->get();
        return response()->json($materias);
        // return view('Materia.index', compact('materias'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $pensums = new Pensum;
        $pensums = Pensum::all();
        // foreach($pensums as $item){
        //     print_r($item->nombre);
        // }
        //$pensums = Pensum::where("semestre","=",1)->select('nombre')->get()->toArray();
        return view('Materia.create', compact('pensums'));
    }
    public function getSemestre(Request $request)
    {
        $semestre = $request->semestre;
        //La mencion debe llegar como mencion_id
        $mencion = $request->query('mencion');
        if (isset($mencion)) {
            $menciones = Mencion::with('materias')->get();
            $indexSemestres = Materia::MateriasSemestre($semestre)->pluck('id');
            // $datos['mencion']=$menciones;
            // $datos['semestre']=$indexSemestres;
            $datos['materias'] = $menciones[$mencion - 1]->materias
                ->whereIn('id', $indexSemestres)->values();
            // ->get(['materia_id as id','nombre'])->values();
            // $datos =$semestres;
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
        //$this->validate($request, ['nombre' => 'required', 'tipo' => 'required', 'sigla' => 'required','pensum' => 'required','semestre' => 'required']);
        $materia = new Materia;
        $materia->sigla = $request->sigla;
        $materia->nombre = $request->nombre;
        $materia->tipo = $request->tipo;
        $materia->semestre = $request->semestre;
        $materia->pensum_id = $request->pensum;
        $materia->save();
        // Menciones
        $mencionesSeleccionadas = $request->menciones;
        $materia_id = $materia->id;

        //Las menciones deben llegar como un objeto en el formato :{id:true,id2:false}
        $menciones = Mencion::all();
        foreach ($menciones as $mencion) {
            if ($mencion->nombre !== "General") {
                $mencion_id = $mencion->id;
                if (isset($mencionesSeleccionadas[$mencion_id])) {
                    $valor = $mencionesSeleccionadas[$mencion_id];
                    if ($valor == true) {
                        $seleccion[$mencion_id] = $materia_id;
                        DB::insert('insert into materia_mencion (materia_id, mencion_id) values (?, ?)', [$materia_id, $mencion_id]);
                    }
                }
            }
        }

        return response()->json([
            "message" => "Materia creada",
            "requestw" => $seleccion,
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
        $response = $id;
        Materia::find($id)->delete();
        return response()->json($response);
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
