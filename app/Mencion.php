<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Mencion extends Model
{
    protected $table = 'mencions';
    protected $fillable = ['nombre', 'descripcion'];
    protected $hidden = ['pivot', 'created_at', 'updated_at'];
    //una mencion tiene muchas materias
    public function materias()
    {
        return $this->belongsToMany(Materia::class)->select('materia_id', 'nombre');
    }
}
