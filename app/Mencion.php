<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Mencion extends Model
{
    protected $fillable = ['nombre','descripcion'];
    protected $hidden = ["created_at", "updated_at","pivot"];
}
