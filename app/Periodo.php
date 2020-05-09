<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Periodo extends Model
{
    //
    protected $fillable = ['nombre','gestion','start_date','end_date'];
}
