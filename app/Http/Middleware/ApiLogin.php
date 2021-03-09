<?php

namespace App\Http\Middleware;

use App\User;
use Closure;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;

class ApiLogin
{

    public function handle(Request $request, Closure $next)
    {
        // echo $username = $request->username;

        // $role = User::Rol($username)->pluck('tipo')->first();
        // grant scopes based on the role that we get previously
        // switch ($role) {
        //     case 'webmaster';
        //         $scope = 'webmaster'; // grant manage order scope for user with admin role

        //         break;
        //     case 'administrativo';
        //         $scope = 'administrativo';
        //         break;
        //     case 'docente';
        //         $scope = 'docente';
        //         break;
        //     default:
        //         $scope = 'estudiante';
        //         break;
        // }


        //// obteniendo contrasena passport
        $secret = DB::table('oauth_clients')
            ->where('id', 2)
            ->pluck('secret')
            ->first();
                
        $request->merge([
            'grant_type' => 'password',
            'client_id' => 2,
            'client_secret' => $secret,
        ]);

        // echo $request;

        // echo $secret;
        return $next($request);
    }
}
