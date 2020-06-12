<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
Use App\User;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

        //Login creado desde https://www.toptal.com/laravel/restful-laravel-api-tutorial
/*
    public function login(Request $request){
        $this->validateLogin($request);
        if($this->attemptLogin($request)){
            $user= new User;
            $user=$this->guard()->user();
            $token=$user->generateToken();

            return response()->json([
                'data'=>$user->toArray()
            ]);
        }

        return $this->sendFailedLoginResponse($request);
    }
    */
}
