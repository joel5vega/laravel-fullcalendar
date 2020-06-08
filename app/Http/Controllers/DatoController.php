<?php

namespace App\Http\Controllers;

use App\Ambiente;
use App\Materia;
use App\Responsable;
use App\Dato;
use Illuminate\Http\Request;

class DatoController extends Controller
{

    public function getDatos()
    {
        $datos = Dato::all();
        return $datos;
    }
    public function getMaterias(Request $request)
    {
        $semestre=$request->semestre;
        $mencion=$request->query('mencion');
        if(isset($mencion)){
            $datos['materias'] = Materia::MateriasSemestreMencion($semestre,$mencion)->get();
        }
        else{
            $datos['materias'] = Materia::MateriasSemestre($semestre)->get();
        }
        
        return response()->json($datos);
    }
    public function getAmbientes(Request $request)
    {
        $tipo=$request->query('tipo');
        if(isset($tipo)){
              $datos['ambientes'] = Ambiente::Tipo($tipo)->get();
        
        }
        else 
        $datos['ambientes'] = Ambiente::all();
        return response()->json($datos);
      
    }
    public function getResponsables(Request $request)
    {
        $nivel=$request->query('nivel');
        if(isset($nivel)){
              $datos['responsables'] = Responsable::Nivel($nivel)->get();
        
        }
        else 
        $datos['responsables'] = Responsable::all();
        return response()->json($datos);
      
    }
    public function getSearch(Request $request)
    {
        $semestre = $request->query('semestre');
        $mencion = $request->query('mencion');
        $ambiente = $request->query('ambiente');
        if ($semestre < 7) {
            $clases = Dato::Ambiente($semestre)->get();
            return response()->json($clases);
        } elseif (isset($mencion)) {
            $clases = Dato::Mencion($semestre, $mencion)->get();
            return response()->json($clases);
        }
    }

    //esto nos dara los datos que necesitamos para nuestras opciones
    public function apiIndex(Request $request)
    {
        $ambiente = $request->query('ambiente');
        $response = $ambiente;
        $index = $request->query('index');
        if (isset($index)) {
            switch ($index) {
                case 'ambientes': {$response['ambientes'] = Dato::indexAmbiente()->get();
                                    $response['periodo']="II/2020";}
                    break;
            }
        }
        return response()->json($response);
    }


    public function getClasesEnSemestre(Request $request)
    {
        $semestre = $request->semestre;
        $mencion = $request->query('mencion');
        if ($semestre < 7) {
            $clases = Dato::Semestre($semestre)->get();
            return response()->json($clases);
        } elseif (isset($mencion)) {
            $clases = Dato::Mencion($semestre, $mencion)->get();
            return response()->json($clases);
        }
        else $clases = Dato::Semestre($semestre)->get();
        return response()->json($clases);
    }

    public function getClasesEnAmbiente($id)
    {
        $clases = Dato::Ambiente($id)->get();
        return response()->json($clases);
    }
}
