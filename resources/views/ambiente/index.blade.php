@extends('layouts.layout')
@section('content')
<div class="row">
  <section class="content">
    <div class="col-md-8 col-md-offset-2">
      <div class="panel panel-default">
        <div class="panel-body">
          <div class="pull-left"><h3>Lista ambientes</h3></div>
          <div class="pull-right">
            <div class="btn-group">
              <a href="{{ route('ambiente.create') }}" class="btn btn-info" >Añadir ambiente</a>
            </div>
          </div>
          <div class="table-container">
            <table id="mytable" class="table table-bordred table-striped">
             <thead>
               <th>Nombre</th>
               <th>Tipo</th>
               <th>Capacidad</th>
               <th>Edificio</th>
               <th>Piso</th>                           
               <th>Editar</th>
               <th>Eliminar</th>
             </thead>
             <tbody>
              @if($ambientes->count())  
              @foreach($ambientes as $ambiente)  
              <tr>
                <td>{{$ambiente->nombre}}</td>
                <td>{{$ambiente->tipo}}</td>
                <td>{{$ambiente->capacidad}}</td>
                <td>{{$ambiente->edificio}}</td>
                <td>{{$ambiente->piso}}</td>                
                <td><a class="btn btn-primary btn-xs" href="{{action('AmbienteController@edit', $ambiente->id)}}" ><span class="glyphicon glyphicon-pencil"></span></a></td>
                <td>
                  <form action="{{action('AmbienteController@destroy', $ambiente->id)}}" method="post">
                   {{csrf_field()}}
                   <input name="_method" type="hidden" value="DELETE">
 
                   <button class="btn btn-danger btn-xs" type="submit"><span class="glyphicon glyphicon-trash"></span></button>
                 </td>
               </tr>
               @endforeach 
               @else
               <tr>
                <td colspan="8">No hay registro !!</td>
              </tr>
              @endif
            </tbody>
 
          </table>
          <br><a href="http://localhost/project/public/">Pagina de inicio</a>

        </div>
      </div>
      {{ $ambientes->links() }}
    </div>
  </div>
</section>
 
@endsection