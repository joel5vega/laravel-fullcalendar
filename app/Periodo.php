<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Periodo extends Model
{
    //
    protected $fillable = ['nombre', 'gestion', 'start_date', 'end_date'];
    protected $hidden = ['created_at', 'updated_at'];
    //Obtiene el periodo actual
    
    public function scopeActual($query)
    {
        $now =date ("Y-m-d");
        return $query->where('start_date', '<=', $now)->where('end_date', '>=', $now);
    }
}
