<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Pensum;

class PensumController extends Controller
{

    public function index()
    {
        $pensums = Pensum::orderBy('semestre')->paginate(30);
        return view('Pensum.index', compact('pensums'));
    }

    public function create()
    {
        return view('Pensum.create');
    }

    public function store(Request $request)
    {

        $this->validate($request, [
            'nombre' => 'required', 'semestre' => 'required',
            'mencion' => 'required', 'presigla' => 'required', 'postsigla' => 'required'
        ]);

        Pensum::create($request->all());
        return "creado";
        return redirect()->route('pensum.index')
            ->with('success', 'Registro creado satisfactoriamente');
    }

    public function show($id)
    {
        return "show";
    }

    public function edit($id)
    {
        $pensum = Pensum::find($id);
        return view('pensum.edit', compact('pensum'));
    }


    public function update(Request $request, $id)
    {
        //
        /*
        $this->validate($request,[ 'nombre'=>'required','semestre'=>'required','mencion'=>'required','presigla'=>'required','postsigla'=>'required','pensum'=>'required']);
        Pensum::find($id)->update($request->all());
        */
        return "update";
        return redirect()->route('pensum.index')->with('success', 'Registro actualizado satisfactoriamente');
    }


    public function destroy($id)
    {
        Pensum::find($id)->delete();
        return "destroy";
        return redirect()->route('pensum.index')->with('success', 'Registro eliminado satisfactoriamente');
    }

    //para obtener las materias de un determinado semestre
    public function getSemestre($request)
    {
        if ($request->ajax()) {
            $materias = Pensum::where("semestre", $request->semestre)->get();
            foreach ($materias as $materia) {
                $materiasArray[$materia->id] = $materia->nombre;
            }
            return response()->json($materiasArray);
        }
    }
}
