<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class semestre extends Model
{
    //
    protected $fillable = ['nombre','semestre','mencion'];

    public function scopeSemestre($query){
        return $query->select('semestre')->groupBy('semestre');
    }
    public function scopeMencion($query){
        return $query->select('mencion')->groupBy('mencion');
    }
}
