<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ambiente extends Model
{
    //
    protected $fillable = ['nombre','tipo','capacidad','edificio','piso'];

    public $timestamps = false;

    public function scopeAulas($query){
    return $query->where('tipo','=','aula');
    }
    public function scopeLabos($query){
    return $query->where('tipo','=','laboratorio');
    }
    //scope para retornar los registros q coincidan con el tipo
    
    public function scopeTipo($query,$tipo){
        return $query->where('tipo','=',$tipo);
    }
    
}
