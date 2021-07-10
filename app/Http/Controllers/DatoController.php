<?php

namespace App\Http\Controllers;

use App\Ambiente;
use App\Materia;
use App\Responsable;
use App\Dato;
use App\Semestre;
use App\Mencion;
use App\Periodo;
use App\Pensum;
use Carbon\Carbon;


use Illuminate\Http\Request;
use PhpParser\Node\Expr\AssignOp\Concat;
use stdClass;
use App\Http\Controllers\ResponsableController\buscarHoras;
use App\Http\Controllers\ClaseController\getActualPeriodoId;

class DatoController extends Controller
{

    public function getDatos()
    {
        $datos = Dato::all();
        return $datos;
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
    public function getAmbientes(Request $request)
    {
        $tipo = $request->query('tipo');
        if (isset($tipo)) {
            $datos['ambientes'] = Ambiente::Tipo($tipo)->get();
        } else
            $datos['ambientes'] = Ambiente::all();
        return response()->json($datos);
    }
    public function getResponsables(Request $request)
    {
        $nivel = $request->query('nivel');
        if (isset($nivel)) {
            $datos['responsables'] = Responsable::Nivel($nivel)->get();
        } else
            $datos['responsables'] = Responsable::all();
        return response()->json($datos);
    }
    public function getSearch(Request $request)
    {
        $semestre = $request->query('semestre');
        $mencion = $request->query('mencion');
        $ambiente = $request->query('ambiente');
        $periodo = $request->query('periodo');
        if ($semestre < 7) {
            $clases = Dato::Ambiente($periodo, $semestre)->get();
            return response()->json($clases);
        } elseif (isset($mencion)) {
            $clases = Dato::Mencion($periodo, $semestre, $mencion)->get();
            return response()->json($clases);
        }
    }

    //esto nos dara los datos que necesitamos para nuestras opciones
    public function apiIndex(Request $request)
    {
        $periodo = $request->query('periodo');
        $index = $request->query('index');
        $tipo = $request->query('tipo');
        $actual = $this->getActualPeriodo();

        if (isset($index)) {
            switch ($index) {
                case 'ambientes': {
                        if (isset($periodo)) {
                            $response['ambientes'] = Dato::indexAmbiente($periodo)->get();
                        } else {
                            $response['ambientes'] = Ambiente::all();
                        }
                        $response['periodo'] = $periodo;
                    }
                    break;
                case 'clases': {
                        // $response['menciones'] = Semestre::Mencion()->get();
                        $response['clases'] = Dato::Periodo($actual)->get();
                    }

                    break;
                case 'periodos': {
                        $response['periodos'] = Periodo::all();
                        $actual = $this->getActualPeriodo();
                        $response['periodo'] = $actual;
                    }
                    break;
                case 'responsables': {
                        $response['responsables'] = Responsable::all();
                    }
                    break;
                case 'semestres': {
                        // $response['semestres'] = Semestre::Semestre()->get();
                    }
                case 'menciones': {
                        // $response['menciones'] = Semestre::Mencion()->get();
                    }

                    break;
            }
        } else {
            // $response['materias_control']=Materia::all()->menciones('nombre');
            $materias = new MateriaController();
            $response['pensums'] = Pensum::all();
            $response['materias'] = $materias->index()->original;
            $response['ambientes'] = Ambiente::all()->sortByDesc('capacidad')->values();
            $response['menciones'] = Mencion::all();
            $response['semestres'] = Semestre::all();
            $response['periodos'] = Periodo::all()->values();
            $response['periodoActual'] = $actual->first();
            $response['responsables'] = Responsable::all();
            $response['clases'] = Dato::Periodo($actual[0]->id)->get();
        }
        $datos = response()->json($response);
        return $datos;
        // return view('Home',compact('response'));
    }
    public function getActualPeriodo()
    {
        //obtiene hora actual
        $now = date("Y-m-d");

        $actual = Periodo::Actual($now)->get();
        return $actual;
    }
    public function getActualPeriodoId()
    {
        //obtiene hora actual
        $now = date("Y-m-d");
        $actual = Periodo::Actual($now)->first();
        return $actual->id;
    }

    public function getClasesEnSemestre(Request $request)
    {
        $semestre = $request->semestre;
        $mencion = $request->query('mencion');
        $periodo = $request->query('periodo');

        if ($semestre < 7) {
            $clases = Dato::Semestre($periodo, $semestre)->get();
            return response()->json($clases);
        } elseif (isset($mencion)) {
            $clases = Dato::Mencion($periodo, $semestre, $mencion)->get();
            return response()->json($clases);
        } else $clases = Dato::Semestre($periodo, $semestre)->get();
        return response()->json($clases);
    }

    public function getClasesEnAmbiente(Request $request)
    {
        $ambiente = $request->ambiente;
        $periodo = $request->query('periodo');
        $clases = Dato::Ambiente($periodo, $ambiente)->get();
        return response()->json($clases);
    }
    public function getClasesEnResponsable(Request $request)
    {
        $responsable = $request->responsable;
        $periodo = $request->query('periodo');
        $clases = Dato::Responsable($periodo, $responsable)->get();
        return response()->json($clases);
    }

    public function getEstadistica(Request $request)
    {
        $tipo = $request->query('tipo');
        switch ($tipo) {
            case 'responsable': {
                    $response[$tipo] = $this->getDatosResponsable();
                    break;
                }
            case 'ambiente': {
                    $response[$tipo] = $this->getDatosAmbiente();
                    break;
                }
        }
        return $response;
    }

    function getDatosResponsable()
    {
        $responsables_id = Responsable::nivel("docente")->pluck('id');

        $contar = 0;
        $registrados = 0;
        foreach ($responsables_id as $id) {
            $periodo = $this->getActualPeriodoId();
            $ap_paterno = Responsable::find($id)->ap_paterno;
            $titulo = Responsable::find($id)->titulo;
            $nombre = $titulo . " " . $ap_paterno;
            $clases = Dato::Responsable($id)->where('periodo_id', $periodo)->select('id', 'startTime', 'endTime')->get();
            $horas = $this->buscarHoras($id, $clases);
            $registrados = $registrados + 1;
            if ($horas > 0) {
                $total[$nombre] = round($horas / 0.75, 0);
                $contar = $contar + 1;
            }
        }
        $horas_acad = round(array_sum($total) / 40, 2);
        $response['docentes_registrados'] = $registrados;
        $response['docentes_activos'] = $contar;
        $response['docente_equivalente'] = $horas_acad;
        $response['responsables'] = $total;
        return $response;
    }
    function getDatosAmbiente()
    {
        $aulas_id = Ambiente::all()->pluck('id');
        // $labos_id = Ambiente::tipo("labo")->pluck('id');
        $contar = 0;
        $registrados = 0;
        $total = [];
        foreach ($aulas_id as $id) {
            $periodo = $this->getActualPeriodoId();
            $ambiente = Ambiente::find($id)->nombre;
            $clases = Dato::Ambiente($periodo, $id)->select('id', 'startTime', 'endTime')->get();
            $horas = $this->buscarHoras($id, $clases);
            $diarioH = $this->buscarDias($id, 'ambiente');
            $registrados = $registrados + 1;
            if ($horas > 0) {
                $total[$ambiente] = $horas;

                $contar = $contar + 1;
            }
            if ($diarioH > 0) {
                $diario[$ambiente] = $diarioH;
            }
        }
        $response['ambi'] = $ambiente;
        $response['registrados'] = $registrados;

        $response['diario'] = $diario;
        $response['total'] = $total;
        return $response;
    }

    public function buscarHoras($id, $clases)
    {
        $i = 0;
        $total = [];
        foreach ($clases as $class) {
            $horas = $this->getIntervalo($class->startTime, $class->endTime);
            $total[$i] = round($horas, 2);
            $i = $i + 1;
        }
        $tiempos = round(array_sum($total), 2);
        $tiempoTotal = round($tiempos, 1);
        return $tiempoTotal;
    }
    function getIntervalo($start, $end)
    {
        $startTime = Carbon::parse($start);
        $endTime = Carbon::parse($end);
        $duration = round($startTime->diffInMinutes($endTime) / 60, 2);
        return $duration;
    }
    public function buscarDias($id, $tipo)
    {
        $cont = [1, 2, 3, 4, 5, 6];
        $dias = ['Lun.', 'Mar.', 'Mie.', 'Jue.', 'Vie.', 'Sab.'];
        $periodo = $this->getActualPeriodoId();
        foreach ($cont as $dia) {
            $nombre = $dias[$dia - 1];
            $clases = Dato::Ambiente($periodo, $id)->where('daysOfWeek', $dia)->select('id', 'startTime', 'endTime')->get();
            $diarioA[$nombre] = $this->buscarHoras($id, $clases);
        }
        return $diarioA;
    }
}
