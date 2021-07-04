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
        // return response()->json(['success' => $success], $this->successStatus);
    }
    ////////////////
    public function index()
    {
        $usuarios = User::with('responsable')->get()->values();
        return response()->json($usuarios);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

        $usuario = User::find($id);
        if ($usuario->estado === 'true') {
            // $response['user'] = $usuario;
            $response['tipo'] = User::Rol($id)->pluck('tipo')->first();
            $response['user'] = User::with("responsable")->where('id', '=', $id)->first();
        } else $response = "Usuario no habilitado";
        return $response;
    }



    public function update(Request $request, $id)
    {
        //
    }


    public function destroy($id)
    {
        return "destroy";
    }
    public function habilitar(Request $request)
    {
        $id = $request->id;
        $user = User::findOrFail($id);
        $user->estado = "true";
        $user->save();
        return $user;
    }
}
