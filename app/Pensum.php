<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pensum extends Model
{
    protected $fillable = ['nombre','descripcion'];
    protected $hidden = ["created_at", "updated_at","pivot",'descripcion'];
    public function materias()
    {
        return $this->hasMany(Materia::class);
    }
}
