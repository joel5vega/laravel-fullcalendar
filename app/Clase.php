<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class Clase extends Model
{
    //
    protected $table = 'clases';
   // protected $dates = ['deleted_at'];//Registramos la nueva columna para #SoftDelete
    protected $fillable = ['materia_id','responsable_id','ambiente_id','dia','horaini','horafin','periodo'];
    public $timestamps = false;

    use SoftDeletes;
    // esta consulta retornara todos los horarios del aula
    public function scopeAula($query,$aula_id){
        return $query->where('ambiente_id','=',$aula_id);
    }
    /*
    public function scopeCalAmbiente($query, $aula_id){
        if ($aula_id != '') {
            $query->where('ambiente_id','=',$aula_id)
            ->join('materias', 'materia_id', '=', 'materias.id')
            ->join('responsables', 'responsable_id', '=', 'responsables.id')
            ->join('periodos', 'periodo', '=', 'periodos.id')
            ->join('ambientes', 'ambiente_id', '=', 'ambientes.id')
            ->select('clases.id','dia as daysOfWeek','horaini as startTime','horafin as endTime',
            'periodos.start_date as startRecur','periodos.end_date as endRecur',
            'materias.sigla as sigla','materias.id as materia_id','materias.nombre as materia_nombre',
            'ambientes.nombre as ambiente',
            'responsables.titulo as responsable_titulo','responsables.nombre as responsable_nombre','responsables.ap_paterno as responsable_ap_paterno')
            ;
        }
        return $query;
    }
    */
    // esta funcion retornara todos los horarios del dia
    public function scopeDia($query,$dia){
        return $query->where('dia','=',$dia);
    }
    //esta funcion retorna todas las materias del semestre
    public function scopeSemestre($query,$materia_id){
               
        return $query->where('materia_id','=',$materia_id);
    }
    public function scopeResponsable($query,$responsable_id){
               
        return $query->where('responsable_id','=',$responsable_id);
    }
    public function scopeAmbientes($query,$tipo){
               
        return $query->
        join('ambientes', 'ambiente_id', '=', 'ambientes.id')->
        where('ambientes.tipo','=',$tipo);
    }
    public function scopeDatos($query,$id){
        return $query->where('id','=',$id)
        ->join('materias', 'materia_id', '=', 'materias.id')
        ->join('responsables', 'responsable_id', '=', 'responsables.id')
        ->join('periodos', 'periodo', '=', 'periodos.id')
        ->join('ambientes', 'ambiente_id', '=', 'ambientes.id')
        ->select('clases.id as id','materia_id','ambiente_id',
        'startTime','endTime','daysOfWeek',
        'materias.sigla as sigla','materias.nombre as title','materias.semestre as semestre','materias.tipo as tipo','materias.nivel as nivel',
        'responsables.nombre as responsable','responsables.ap_paterno as responsable_ap_paterno',
        'ambientes.nombre as ambiente',
        'periodos.start_date as startRecur','periodos.end_date as endRecur');
    }
    //esta funcion devolvera todas las clases id por semestre
    public function scopeCalxSemestre($query,$semestre){
        return $query->
        join('materias','materia_id','=','materias.id')
        ->join('responsables', 'responsable_id', '=', 'responsables.id')
        ->join('periodos', 'periodo_id', '=', 'periodos.id')
        ->join('ambientes', 'ambiente_id', '=', 'ambientes.id')->
        where('materias.semestre','=',$semestre);

    }
    public function scopeCalxAmbiente($query,$id){
        return $query->
        join('materias','materia_id','=','materias.id')
        ->join('responsables', 'responsable_id', '=', 'responsables.id')
        ->join('periodos', 'periodo_id', '=', 'periodos.id')
        ->join('ambientes', 'ambiente_id', '=', 'ambientes.id')->
        where('ambientes.id','=',$id);

    }
    public function scopeTipoResponsable($query,$nivel){
        return $query->
        where('materias.nivel','=',$nivel)
        ->join('materias', 'materia_id', '=', 'materias.id')
        ->join('responsables', 'responsable_id', '=', 'responsables.id')
        ->join('periodos', 'periodo', '=', 'periodos.id')
        ->join('ambientes', 'ambiente_id', '=', 'ambientes.id')
        ->select('clases.id','dia','horaini','horafin',
        'periodos.start_date as startRecur','periodos.end_date as endRecur',
        'materias.sigla as sigla','materias.id as materia_id','materias.nombre as materia_nombre',
        'ambientes.nombre as ambiente',
        'responsables.titulo as responsable_titulo','responsables.nombre as responsable_nombre','responsables.ap_paterno as responsable_ap_paterno')
        ;
    }
}
