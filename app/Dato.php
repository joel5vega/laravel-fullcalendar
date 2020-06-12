<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Dato extends Model
{
    //
    protected $table = 'datos';

    //Disenamos scopes
    //Para obtener el listado de las clases en un ambiente determindao
    public function scopePeriodo($query, $periodo)
    {
        return $query->where('periodo_id', '=', $periodo);
    }
    public function scopeAmbiente($query, $periodo, $aula_id)
    {
        return $query->where('periodo_id', '=', $periodo)->where('ambiente_id', '=', $aula_id);
    }
    //para obtener las clases de un semestre determinado
    public function scopeSemestre($query, $periodo, $semestre)
    {
        return $query->where('periodo_id', '=', $periodo)->where('semestre', '=', $semestre);
    }
    //para obtener las clases segun el tipo de(laboratorio o teoria)
    public function scopeTipo($query, $periodo, $semestre, $tipo)
    {

        return $query->where('periodo_id', '=', $periodo)->where('periodo_id', '=', $periodo)->where('semestre', '=', $semestre)->where('tipo', '=', $tipo);
    }
    //para obtener las clases de una mencion especifica
    public function scopeMencion($query, $periodo, $semestre, $mencion)
    {
        return $query->where('periodo_id', '=', $periodo)->where('semestre', '=', $semestre)->where($mencion, '=', 'si');
    }
    //un indice de los ambientes disponibles en las clases existentes
    public function scopeindexAmbiente($query, $periodo)
    {
        return $query->where('periodo_id', '=', $periodo)->select('ambiente_id as id', 'ambiente as nombre', 'tipoAmbiente as tipo')->groupBy('id');
    }
}
