<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    private $user;

    public function __construct(User $user)
    {
        // İnitialize user property.
        $this->user = $user;
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'c_password' => 'required|same:password',
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);
        }
        
        $input = $request->all();
        
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        $success['token'] =  $user->createToken('MyApp')->accessToken;
        $success['name'] =  $user->name;
        return response()->json(['success' => $success]);
    }
    ////////////////
    public function index()
    {
        $usuarios = User::with('responsable')->get()->values();
        return response()->json($usuarios);
    }

    public function show($id)
    {
        $usuario = User::find($id);
        if ($usuario->estado === 'true') {
            $response['tipo'] = User::Rol($id)->pluck('tipo')->first();
            $response['user'] = User::with("responsable")->where('id', '=', $id)->first();
        } else $response = "Usuario no habilitado";
        return $response;
    }

    public function update(Request $request)
    {
        $id = $request->id;
        $validator = Validator::make($request->all(), [
            'id' => 'required',
            'name' => 'required',
            'email' => 'required|email',
            'tipo' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);
        }
        $user = User::find($id);
        $user->name = $request->name;
        $user->email = $request->email;
        $user->responsable_id = $request->responsable_id;
        $user->tipo = $request->tipo;
        $user->save();
        $success['user'] = $user;
        return response()->json(['success' => $success]);
    }
    public function destroy($id)
    {
        User::destroy($id);
        return $id;
    }
    public function habilitar(Request $request)
    {
        $id = $request->id;
        $user = User::findOrFail($id);
        $user->estado = "true";
        $user->save();
        $success['user'] = $user;
        return response()->json(['success' => $success]);
    }
}
