<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Ambiente;

class AmbienteController extends Controller
{
    public function index()
    {
        //
        $ambientes=Ambiente::orderBy('id','DESC')->paginate(15);
        
        //return $ambientes;
        return view('Ambiente.index',compact('ambientes')); 
    }
    public function api_index(Request $request)
    {
        
        
        $tipo=$request->query('tipo');
        if(isset($tipo))
        {
            $ambientes=Ambiente::where('tipo','=',$tipo)->get();
            return $ambientes;
        } 
        else
        $ambientes=Ambiente::orderBy('id','DESC')->paginate(15);
        return $ambientes;
        //return $ambientes;
        // return view('Ambiente.index',compact('ambientes')); 
    }

    public function create()
    {
        //
        echo 'llega';
        return view('Ambiente.create');
    }

    
    public function store(Request $request)
    {
        //
        $this->validate($request,['nombre'=>'required','tipo'=>'required','capacidad'=>'nullable','edificio','piso']);
        Ambiente::create($request->all());
        return redirect()->route('ambiente.index')->with('success','Registro creado satisfactoriamente');
    
    }
    public function api_store(Request $request)
    {
        //
        $this->validate($request,['nombre'=>'required','tipo'=>'required','capacidad'=>'nullable','edificio','piso']);
        Ambiente::create($request->all());
        echo $request;
        return "exito";
    
    }

    public function show($id)
    {
        //
        $ambientes=Ambiente::find($id);
        //return $ambientes;
        return  view('ambiente.show',compact('ambientes'));
    }
    //api
    public function api_show($id)
    {
        //
        $ambientes=Ambiente::find($id);
        return $ambientes;
    }

    public function edit($id)
    {
        //
        $ambiente=ambiente::find($id);
        return view('ambiente.edit',compact('ambiente'));
    }

    public function update(Request $request, $id)
    {
        //
        $this->validate($request,['nombre'=>'required','tipo'=>'required','capacidad','edificio','piso']);
 
        ambiente::find($id)->update($request->all());
        return redirect()->route('ambiente.index')->with('success','Registro actualizado satisfactoriamente');
 
    }

    public function api_update(Request $request, $id)
    {
        //
        $this->validate($request,['nombre'=>'required','tipo'=>'required','capacidad','edificio','piso']);
 
        ambiente::find($id)->update($request->all());
        //return redirect()->route('ambiente.index')->with('success','Registro actualizado satisfactoriamente');
        return "actualizado";
 
    }

    public function destroy($id)
    {
        //
        Ambiente::find($id)->delete();
        return redirect()->route('ambiente.index')->with('success','Registro eliminado satisfactoriamente');
    }

    public function api_delete($id)
    {
        //
        Ambiente::find($id)->delete();
        //return redirect()->route('ambiente.index')->with('success','Registro eliminado satisfactoriamente');
        return "eliminado";
    }
}

