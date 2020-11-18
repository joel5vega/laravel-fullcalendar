<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Responsable extends Model
{
    //
    protected $fillable = ['nombre','ap_paterno','ap_materno','puesto','titulo','profesion','estado','ru'];
    protected $hidden = ["created_at", "updated_at"];
    public function scopeNivel($query,$nivel){
        return $query->where('puesto','=',$nivel);
    }
}
