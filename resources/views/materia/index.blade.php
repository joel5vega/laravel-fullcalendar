@extends('layouts.layout')
@section('content')
<div class="row">
  <section class="content">
    <div class="col-md-8 col-md-offset-2">
      <div class="panel panel-default">
        <div class="panel-body">
          <div class="pull-left"><h3>Lista materias</h3></div>
          <div class="pull-right">
            <div class="btn-group">
              <a href="{{ route('materia.create') }}" class="btn btn-info" >Añadir materia</a>
            </div>
          </div>
          <div class="table-container">
            <table id="mytable" class="table table-bordred table-striped">
             <thead>
               <th>Nombre</th>
               <th>Semestre</th>
               <th>Mencion</th>
               <th>Sigla</th>
               <th>Pensum</th>
               <th>Tipo</th>
               <th>Nivel</th>
               <th>Paralelo</th>              
               <th>Editar</th>
               <th>Eliminar</th>
             </thead>
             <tbody>
              @if($materias->count())  
              @foreach($materias as $materia)  
              <tr>
                <td>{{$materia->nombre}}</td>
                <td>{{$materia->semestre}}</td>
                <td>{{$materia->mencion}}</td>
                <td><?php print $materia->presigla.'-'.$materia->postsigla;?></td>
                <td>{{$materia->pensum}}</td>  
                <td>{{$materia->tipo}}</td>  
                <td>{{$materia->nivel}}</td>
                <td>{{$materia->paralelo}}</td>                  
                <td><a class="btn btn-primary btn-xs" href="{{action('MateriaController@edit', $materia->id)}}" ><span class="glyphicon glyphicon-pencil"></span></a></td>
                <td>
                  <form action="{{action('MateriaController@destroy', $materia->id)}}" method="post">
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
        </div>
      </div>
      <br><a href="http://localhost/project/public/">Pagina de inicio</a>
      {{ $materias->links() }}
    </div>
  </div>
</section>
 
@endsection