<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

use Illuminate\Support\Str;

use Laravel\Passport\HasApiTokens;


class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    
    protected $fillable = [
        'name', 'email', 'password', 'tipo', 'responsable_id'
    ];

  
    protected $hidden = [
        'password', 'remember_token', 'created_at', 'updated_at', 'email_verified_at'
    ];

  
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function generateToken()
    {
        $this->api_token = Str::random(60);
        $this->save();

        return $this->api_token;
    }
    //Para identificar el rol
    public function scopeRol($query, $username)
    {
        return $query->where('id', '=', $username)->select("tipo");
    }

    //para vincularlo a un usuario
    public function responsable()
    {
        return $this->belongsTo(Responsable::class);
    }
}
