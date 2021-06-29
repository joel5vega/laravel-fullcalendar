<?php

namespace App\Http\Controllers;

use App\Clase;
use App\Dato;
use App\Periodo;
use App\Mencion;
use App\Ambiente;
use App\Materia;
use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;

class ClaseController extends Controller
{
    public function index(Request $request)
    {

        $periodo = $request->query('periodo');

        if (!isset($periodo)) {
            $dato = Periodo::Actual()->first();
            $periodo = $dato->id;
        }

        $ambiente = $request->query('ambiente');
        $semestre = $request->query('semestre');
        $estado = $request->query('estado');
        if (isset($estado)) {
            $clases = Dato::estado($estado)->get();
            return response()->json($clases);
        }

        if (isset($ambiente)) {
            if ($ambiente == 'undefined') {
                $data = Dato::all();
                return response()->json($data);
            } else
                $data = Dato::Ambiente($periodo, $ambiente)->get();
            return response()->json($data);
        }
        //Devolvemos las clases actuales
        $clases = Dato::Periodo($periodo)->get();
        // return $periodo;
        return response()->json($clases);
    }
    public function getClasesSemestre(Request $request)
    {
        $semestre = $request->semestre;
        $mencion = $request->query('mencion');
        $periodo = $request->query('periodo');

        if (!isset($periodo)) {
            $periodo = $this->getActualPeriodoId();
        }
        if ($semestre < 7) {
            $clases = Dato::Semestre($periodo, $semestre)->get();
            return response()->json($clases);
        } elseif (isset($mencion)) {
            //Instanciamos para poder utilizar el metodo getmateriasenmencion
            $arrayMaterias = new ClaseController();
            //Elegimos el campo materias de las menciones, 
            //y mediante pluck  obtenemos solamente los datos fuera del objeto
            $materias = $arrayMaterias->getMateriasEnMencion($mencion)->materias->pluck('id');
            //Realizamos una comparacion de los datos de materia en mencion obtendos con las clases existentes actualmente
            $response = Dato::Semestre($periodo, $semestre)->whereIn('materia_id', $materias)->get();
            return response()->json($response->values());
        } else $clases = Dato::Semestre($periodo, $semestre)->get();
        return response()->json($clases);
    }
    public function getClasesAmbiente(Request $request)
    {
        $ambiente = $request->ambiente;
        $periodo = $request->query('periodo');
        if (!isset($periodo)) {
            $periodo = $this->getActualPeriodoId();
        }
        $clases = Dato::Ambiente($periodo, $ambiente)->get();
        return response()->json($clases);
    }
    public function getMaterias(Request $request)
    {
        $semestre = $request->semestre;
        $mencion = $request->query('mencion');
        if (isset($mencion)) {
            $datos['materias'] = Materia::MateriasSemestreMencion($semestre, $mencion)->get();
        } else {
            if (isset($semestre)) {
                $datos['materias'] = Materia::MateriasSemestre($semestre)->get();
            } else {
                $datos['materias'] = Materia::all();
            }
        }

        return response()->json($datos);
    }

    public function getMateriasEnMencion($mencion)
    {
        $consulta = Mencion::with('materias')->where('id', '=', $mencion)->first();
        // $clases = $consulta->materias->pluck('materia_id');
        return $consulta;
    }
    //Funcioin para obtener el periodo actual
    public function getActualPeriodoId()
    {
        //obtiene hora actual
        $now = date("Y-m-d");
        $actual = Periodo::Actual($now)->first();
        return $actual->id;
    }
    public function getTime()
    {
        $today = getdate();
        $dia = $today["wday"];
        $hour = $today["hours"];
        if ($hour < 10) {
            $hora = "0$hour";
        } else {
            $hora = $today["hours"];
        }
        $minuto = $today["minutes"];
        // La hora siempre debe estar en formato hh:mm si no esta asi falla
        $time = "$hora:$minuto";
        $response['dia'] = $dia;
        $response['time'] = $time;
        return $response;
    }
    public function getClasesNow(Request $request)
    {
        // Obtenemos el tipo de consulta, si es q no existe se retorna todas las clases
        $index = $request->query('index');
        // Periodo, Dia y Hora Actual
        $periodo = $this->getActualPeriodoId();
        $dia = $this->getTime()['dia'];
        $time = $this->getTime()['time'];
        //Clases ocupadas
        $clases = Dato::Hora($periodo, $dia, $time)->get();
        $ocupado = Dato::IndexOcupado($periodo, $dia, $time)->pluck("ambiente_id");
        if (isset($index)) {
            switch ($index) {
                    //para entregar lista de ambientes
                case 'ambientes': {
                        $response['ocupados'] = Ambiente::all()->whereIn('id', $ocupado)->sortBy("tipo")->values();
                        $response['libres'] = Ambiente::all()->whereNotIn('id', $ocupado)->sortBy("tipo")->sortByDesc("capacidad")->values();
                    }
                    break;
            }
        } else $response = $clases;
        return response()->json($response);
    }
    public function getClasesResponsable(Request $request)
    {
        $responsable = $request->responsable;
        $periodo = $request->query('periodo');
        if ($periodo) {
        } else {
            $periodo = $this->getActualPeriodoId();
        }

        $clases = Dato::Responsable($responsable)->where('periodo_id', $periodo)->get();
        return response()->json($clases);
    }

    public function create()
    {
        //
    }
    public function habilitar(Request $request)
    {
        $id = $request->id;
        if($id==0)
        {
            $habilitar=$request->todos;
            if($habilitar=="yes"){
                DB::update('update clases set estado=? where estado=?',["true","false"]);
                return $habilitar;
            }
            
        }
        $clase = Clase::findOrFail($id);
        $clase->estado = "true";
        $clase->save();
        return $clase;
    }
    public function editar(Request $request)
    {
        $id = $request->id;
        $clase = Clase::findOrFail($id);
        $clase->materia_id = $request->materia;
        $clase->responsable_id = $request->responsable;
        $clase->ambiente_id = $request->ambiente;
        $clase->periodo_id = $request->periodo;
        $clase->dia = $request->day;
        $clase->hora_ini = $request->startTime;
        $clase->hora_fin = $request->endTime;
        $clase->nivel = $request->nivel;
        $clase->paralelo = $request->paralelo;
        $tipo = $request->tipo;
        $nivel = $request->nivel;
        if ($tipo == 'aula') {
            if ($nivel == 'docente') {
                $color = "#0066CC";
            } else {
                $color = "#00CCFF";
            }
        } else {
            if ($nivel == 'docente') {
                $color = "#006600";
            } else {
                $color = "#00FF00";
            }
        }
        $clase->color = $color;
        $clase->save();
        return response()->json([
            "message" => "Clase modificada con exito",
            "request" => $clase,
            "color" => $color
        ], 201);

    }
    public function store(Request $request)
    {
        //validar
        $this->validate($request, [
            'materia' => 'required', 'responsable' => 'required',
            'ambiente' => 'required', 'tipo' => 'required',
            'nivel' => 'required', 'day' => 'required',
            'startTime' => 'required', 'endTime' => 'required'
        ]);
        //
        $clase = new Clase;
        $clase->materia_id = $request->materia;
        $clase->responsable_id = $request->responsable;
        $clase->ambiente_id = $request->ambiente;
        $clase->periodo_id = $request->periodo;
        $clase->dia = $request->day;
        $clase->hora_ini = $request->startTime;
        $clase->hora_fin = $request->endTime;
        $clase->nivel = $request->nivel;
        $clase->paralelo = $request->paralelo;
        $tipo = $request->tipo;
        $nivel = $request->nivel;
        //return "request";
        //return $request;
        function setColores($tipo, $nivel)
        {
            if ($tipo == 'aula') {
                if ($nivel == 'docente') {
                    $color = "#0066CC";
                } else {
                    $color = "#00CCFF";
                }
            } else {
                if ($nivel == 'docente') {
                    $color = "#006600";
                } else {
                    $color = "#00FF00";
                }
            }
            return $color;
        }
        $color = setColores($tipo, $nivel);
        $clase->color = $color;
        $clase->save();
        return response()->json([
            "message" => "estudiante creado",
            "request" => $clase,
            "color" => $color
        ], 201);
    }


    public function show($id)
    {
        $data['evento'] = Dato::find($id);
        return response()->json($data['evento']);
    }

    public function crearClase(Request $request)
    {
        //validar
        /*
        $this->validate($request, [
            'materia' => 'required', 'responsable' => 'required',
            'ambiente' => 'required',
            'periodo' => 'nullable',
            'nivel' => 'required', 'day' => 'required',
            'startTime' => 'required', 'endTime' => 'required',
            'paralelo' => 'nullable'
        ]);
        */
        //

        $clase = new Clase;
        $clase->materia_id = $request->materia;
        $clase->responsable_id = $request->responsable;
        $clase->ambiente_id = $request->ambiente;
        $clase->periodo_id = $request->periodo;
        $clase->dia = $request->day;
        $clase->hora_ini = $request->startTime;
        $clase->hora_fin = $request->endTime;
        $clase->nivel = $request->nivel;
        $clase->paralelo = $request->paralelo;
        $tipo = $request->tipo;
        $nivel = $request->nivel;

        function setColor($tipo, $nivel)
        {
            if ($tipo == 'aula') {
                if ($nivel == 'docente') {
                    $color = "#0066CC";
                } else {
                    $color = "#00CCFF";
                }
            } else {
                if ($nivel == 'docente') {
                    $color = "#006600";
                } else {
                    $color = "#00FF00";
                }
            }
            return $color;
        }

        $color = setColor($tipo, $nivel);
        $clase->color = $color;
        $clase->save();

        //Para copiar al periodo 2
        $clone = $clase->replicate();
        $clone->periodo_id = "3";
        $clone->push();

        return response()->json([
            "message" => "Clase creada con exito",
            "request" => $clase,
            "color" => $color
        ], 201);
    }

    public function destroy(Request $request)
    {
        $id=$request->id;
        
        $clase= Clase::findOrFail($id);
        $clase->forceDelete();
    
        return $id;
    }
     public function update(Request $request, Clase $clase)
    {
        //
    }

  
}
