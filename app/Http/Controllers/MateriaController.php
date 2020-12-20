<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Materia;
use App\Pensum;

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

        $materias = Materia::with('pensum','menciones')->get();
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
        // echo "funcion getSemestre<br>";
        if ($request->ajax()) {
            $materias = Pensum::where("semestre", $request->semestre)->get();

            foreach ($materias as $materia) {
                $materiasArray[$materia->id] = $materia->nombre;
                echo $materia->nombre;
            }

            return response()->json($materiasArray);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, ['materia' => 'required', 'nivel' => 'required', 'paralelo' => 'nullable']);
        //    print_r($request->materia);
        $asignatura = new Pensum;
        $asignatura = Pensum::where("id", "=", $request->materia)->get()->toArray();
        // $materia['nivel']= $request->nivel;
        $materia = new Materia;
        //hay que investigar como asignar un objeto a otro
        $materia->sigla = $asignatura[0]['sigla'];
        $materia->nombre = $asignatura[0]['nombre'];
        $materia->tipo = $asignatura[0]['tipo'];
        $materia->semestre = $asignatura[0]['semestre'];
        $materia->nivel = $request->nivel;
        $materia->paralelo = $request->paralelo;
        $materia->control = $request->control;
        $materia->telecomunicaciones = $request->telecomunicaciones;
        $materia->pensum = $asignatura[0]['pensum'];
        $materia->save();

        //Materia::create($request->all());
        return redirect()->route('materia.index')->with('success', 'Registro creado satisfactoriamente');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $materias = Materia::find($id);
        return  view('Materias.show', compact('materias'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $materia = Materia::find($id);
        return view('materia.edit', compact('materia'));
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
        $this->validate($request, ['nombre' => 'required', 'semestre' => 'required', 'mencion' => 'required', 'presigla' => 'required', 'postsigla' => 'required', 'pensum' => 'required', 'tipo' => 'required', 'nivel' => 'required', 'paralelo' => 'nullable']);
        Materia::find($id)->update($request->all());
        return redirect()->route('materia.index')->with('success', 'Registro actualizado satisfactoriamente');
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
        // echo $id;
        $response = $id;
        // Materia::find($id)->delete();
        // return redirect()->route('materia.index')->with('success','Registro eliminado satisfactoriamente');
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
