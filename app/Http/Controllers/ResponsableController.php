<?php

namespace App\Http\Controllers;

use App\Clase;
use App\Responsable;
use App\Periodo;
use App\Dato;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\ClaseController;
use App\Http\Controllers\ClaseController\getActualPeriodoId;
use App\Http\Controllers\ClaseController\getClasesResponsable;
use Carbon\Carbon;
use Facade\FlareClient\Http\Response;

class ResponsableController extends Controller
{

    public function index(Request $request)
    {
        $nivel = $request->query('nivel');
        if (isset($nivel)) {
            $datos['responsables'] = Responsable::Nivel($nivel)->orderBy("ap_paterno")->get();
        } else
            $datos['responsables'] = Responsable::all();
        return response()->json($datos);
    }


    public function store(Request $request)
    {
        //
        $this->validate($request, [
            'ap_paterno' => 'required',
            'puesto' => 'required'
        ]);
        $responsable = new Responsable;
        $responsable->titulo = $request->titulo;
        $responsable->nombre = $request->nombre;
        $responsable->ap_paterno = $request->ap_paterno;
        $responsable->ap_materno = $request->ap_materno;
        $responsable->puesto = $request->puesto;
        $responsable->telefono = $request->telefono;
        $responsable->email = $request->email;
        $responsable->descripcion = $request->descripcion;
        $responsable->foto = $request->foto;

        $responsable->save();

        return response()->json([
            "message" => "Responsable creado",
            "request" => $responsable,

        ], 201);
        // return $responsable;
    }


    public function show(Request $request)
    {
        $id = $request->id;
        $responsable = Responsable::find($id);
        return $responsable;
    }

    public function getHoras(Request $request)
    {
        //Recibe la consulta desde el exterior
        $responsable = $request->id;
        $horas = $this->buscarHoras($responsable);
        $response = $horas;
        return $response;
    }
    public function buscarHoras($id)
    {
        // Sirve como una funcion en el sistema
        $periodo = $this->getActualPeriodoId();
        $clases = Dato::Responsable($id)->where('periodo_id', $periodo)->select('id','startTime','endTime')->get();
        $i=0;
        foreach($clases as $class){
        $horas = $this->getIntervalo($class->startTime,$class->endTime);
        $total[$i]=$horas;
        $i=$i+1;
        }
        $tiempoTotal=array_sum($total);
        return $tiempoTotal;
    }
    function getIntervalo($start,$end){
        $startTime =Carbon::parse($start);
        $endTime = Carbon::parse($end);
        $duration = $startTime->diffInMinutes($endTime);
        return $duration;
    }

    public function update(Request $request)
    {
        $responsable = Responsable::find($request->id);
        $this->validate($request, [
            'ap_paterno' => 'required', 'id' => 'required', 'puesto' => 'required',
        ]);
        $responsable->titulo = $request->titulo;
        $responsable->nombre = $request->nombre;
        $responsable->ap_paterno = $request->ap_paterno;
        $responsable->ap_materno = $request->ap_materno;
        $responsable->puesto = $request->puesto;
        $responsable->telefono = $request->telefono;
        $responsable->email = $request->email;
        $responsable->descripcion = $request->descripcion;
        $responsable->foto = $request->foto;
        $responsable->save();
        return response()->json([
            "message" => "Responsable creado",
            "request" => $responsable,

        ], 201);
    }

    public function destroy(Request $request)
    {
        $id = $request->id;
        // $periodo
        $clases = Dato::Responsable($id)->pluck('id');
        Clase::whereIn('id', $clases)->update(['responsable_id' => '1']);
        // ->get();
        User::where('id', $id)->update(['responsable_id' => '1']);
        Responsable::destroy($request->id);
        $response = "Registro eliminado satisfactoriamente";
        return $response;
    }
    //Funcioin para obtener el periodo actual
    public function getActualPeriodoId()
    {
        //obtiene hora actual
        $now = date("Y-m-d");
        $actual = Periodo::Actual($now)->first();
        return $actual->id;
    }
}
