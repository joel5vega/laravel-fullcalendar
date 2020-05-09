<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Materia extends Model
{
    //
    protected $table = 'materias';
    protected $fillable = ['sigla','nombre','tipo','semestre','control','telecomunicaciones','sistemas','requisito','pensum','nivel','paralelo'];
    public $timestamps = false;

    
    public function scopeMateriasSemestre($query,$semestre){
        return $query->where('semestre','=',$semestre);
    }
}
