<?php

namespace App\Http\Controllers;

use App\Clase;
use App\Dato;
use App\Periodo;
use App\Mencion;
use App\Ambiente;

use Illuminate\Http\Request;

class ClaseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $periodo = $request->query('periodo');
        if (!isset($periodo)) {
            $dato = Periodo::Actual()->first();
            $periodo = $dato->id;
        }

        $ambiente = $request->query('ambiente');
        $semestre = $request->query('semestre');

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
            $materias = $arrayMaterias->getMateriasEnMencion($mencion)->materias->pluck('materia_id');
            //Realizamos una comparacion de los datos de materia en mencion obtendos con las clases existentes actualmente
            // $response = Dato::All()->whereIn('materia_id', $materias)->sortBy('semestre'); // Obtiene todos los registros
            $response = Dato::Semestre($periodo, $semestre)->whereIn('materia_id', $materias)->get();
            return response()->json($response->values());
        } else $clases = Dato::Semestre($periodo, $semestre)->get();
        return response()->json($clases);
    }
    public function getClasesAmbiente(Request $request)
    {
        $ambiente = $request->ambiente;
        $periodo = $request->query('periodo');
        $clases = Dato::Ambiente($periodo, $ambiente)->get();
        return response()->json($clases);
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
        } else $response['clases'] = $clases;
        return response()->json($response);
    }
    public function getClasesResponsable(Request $request)
    {
        $responsable = $request->responsable;
        $periodo = $request->query('periodo');
        $clases = Dato::Responsable($periodo, $responsable)->get();
        return response()->json($clases);
    }

    /**
     * Show the fo`rm for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Clase  $clase
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $data['eventos'] = Dato::all();

        return response()->json($data['eventos']);
    }

    public function crearClase(Request $request)
    {

        $clase = new Clase;
        $clase->periodo_id = $request->periodo;
        $clase->materia_id = $request->materia;
        $clase->responsable_id = $request->responsable;
        $clase->ambiente_id = $request->ambiente;
        $clase->daysOfWeek = $request->day;
        $clase->startTime = $request->startTime;
        $clase->endTime = $request->endTime;
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
        return response()->json([
            "message" => "estudiante creado",
            "request" => $clase,
            "color" => $color
        ], 201);
    }



    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Clase  $clase
     * @return \Illuminate\Http\Response
     */
    public function edit(Clase $clase)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Clase  $clase
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Clase $clase)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Clase  $clase
     * @return \Illuminate\Http\Response
     */
    public function destroy(Clase $clase)
    {
        //
    }
}
