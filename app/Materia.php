<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Materia extends Model
{
    //
    protected $table = 'materias';
    protected $fillable = ['sigla','nombre','tipo','semestre','pensum'];
    public $timestamps = false;
    protected $hidden = ['pivot','created_at','updated_at'];
    
    
    //Relacion de uno a muchos
    // Una materia pertenece a un solo pensum
    public function pensum(){
        return $this->belongsTo(Pensum::class);
    }
    //Relacion de muchos a muchos
    //Una materia puede tener Menciones y una mencion contiene muchas materias
    public function menciones(){
        return $this->belongsToMany(Mencion::class)->select('mencion_id as id', 'nombre');
    }
    
    public function scopeMateriasSemestre($query,$semestre){
        return $query->where('semestre','=',$semestre);
    }
    public function scopeMateriasSemestreMencion($query,$semestre,$mencion){
        return $query->where('semestre','=',$semestre)->where($mencion,'=','si');;
    }
}
