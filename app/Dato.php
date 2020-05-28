<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Dato extends Model
{
    //
    protected $table = 'datos';

    //Disenamos scopes
    public function scopeAmbiente($query,$aula_id){
        return $query->where('ambiente_id','=',$aula_id);
    }
    public function scopeSemestre($query,$semestre){
        return $query->where('semestre','=',$semestre);
    }
}
