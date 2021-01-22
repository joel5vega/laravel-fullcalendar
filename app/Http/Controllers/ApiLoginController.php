<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\User;
use Illuminate\Support\Facades\DB;
use GuzzleHttp\Client;

class ApiLoginController extends Controller
{
    use AuthenticatesUsers;

    protected function authenticated(Request $request, $user)
    {
        // implement your user role retrieval logic, for example retrieve from `roles` database table
        $username = $request->username;
        $password = $request->password;
        $role = User::Rol($username)->pluck('tipo')->first();
        // $usuario = request('username');
        //obtenemos el token generico
        $secret = DB::table('oauth_clients')
            ->where('id', 2)
            ->pluck('secret')
            ->first();



        $data = [
            'grant_type' => 'password',
            'client_id' => 1,
            'client_secret' => $secret,
            'username' => $username,
            'password' => $password,

        ];
        // grant scopes based on the role that we get previously
        switch ($role) {
            case 'webmaster';
                $request->request->add([
                    'scope' => 'webmaster' // grant manage order scope for user with admin role
                ]);
                $data['scope'] = 'webmaster';
                break;
            case 'administrativo';
                $request->request->add([
                    'scope' => 'administrativo' // grant manage order scope for user with admin role
                ]);
                $data['scope'] = 'administrativo';
                break;
            case 'docente';
                $request->request->add([
                    'scope' => 'docente' // grant manage order scope for user with admin role
                ]);
                break;
            default:
                $request->request->add([
                    'scope' => 'estudiante' // grant manage order scope for user with admin role
                ]);
                break;
        }

        // return ($data);

        // forward the request to the oauth token request endpoint

        $tokenRequest = Request::create(
            '/api/login',
            'post',
            $data
        );

        // $tokenRequest = post('login', [AccessTokenController::class, 'issueToken'])
        //     ->middleware(['api-login', 'throttle']);
         return ($tokenRequest);
/*
        $http = new Client();
        //
        $response = $http->post('http://127.0.0.1:8000/api/login', [
            'form_params' => [
                'grant_type' => 'password',
                'client_id' => '2',
                'client_secret' => '2UHmLIkJIdToHBmBmZm9PMMRD2Gl6rBxK91mCeYF',
                'username' => 'joel.vega@gmail.com',
                'password' => 'p4ss',
            ],
        ]);
 return ($tokenRequest);
        return json_decode((string) $response->getBody(), true);

*/
        // return Route::dispatch($tokenRequest);
    }
}
