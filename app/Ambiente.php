<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ambiente extends Model
{
    //
    protected $fillable = ['nombre', 'tipo', 'capacidad','descripcion'];
    protected $hidden = ["created_at", "updated_at"];
    // public $timestamps = false;

    //scope para retornar los registros q coincidan con el tipo
    public function scopeTipo($query, $tipo)
    {
        return $query->where('tipo', '=', $tipo);
    }
}
