@extends('layouts.layout')
@section('content')
<div class="row">
	<section class="content">
		<div class="col-md-8 col-md-offset-2">
			@if (count($errors) > 0)
			<div class="alert alert-danger">
				<strong>Error!</strong> Revise los campos obligatorios.<br><br>
				<ul>
					@foreach ($errors->all() as $error)
					<li>{{ $error }}</li>
					@endforeach
				</ul>
			</div>
			@endif
			@if(Session::has('success'))
			<div class="alert alert-info">
				{{Session::get('success')}}
			</div>
			@endif

			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Nuevo materia</h3>
				</div>
				<div class="panel-body">					
					<div class="table-container">
						<form method="POST" action="{{ route('materia.update',$materia->id) }}"  role="form">
							{{ csrf_field() }}
							<input name="_method" type="hidden" value="PATCH">
							<div class="row">
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="text" name="nombre" id="nombre" class="form-control input-sm" value="{{$materia->nombre}}">
									</div>
								</div>
								<div class="form-group">
									<select name="semestre" id="semestre" class="form-control input-sm" value="{{$materia->semestre}}" placeholder="Semestre" required>
											<option value="1">Primer Semestre</option>
											<option value="2">Segundo Semestre</option>
											<option value="3">Tercer Semestre</option>
											<option value="4">Cuarto Semestre</option>
											<option value="5">Quinto Semestre</option>
											<option value="6">Sexto Semestre</option>
											<option value="7">Septimo Semestre</option>
											<option value="8">Octavo Semestre</option>
											<option value="9">Noveno Semestre</option>
											<option value="10">Decimo Semestre</option>
									</select>
									</div>
									<div class="form-group">
										<select name="mencion" id="mencion" class="form-control input-sm" value="{{$materia->mencion}}"placeholder="Mencion">
											<option value="Telecomunicaciones">Telecomunicaciones</option>
											<option value="Control">Control</option>
											<option value="Sistemas">Sistemas</option>
											<option value="General">General</option>	
										</select>
									</div>
								
							<div class="form-group">
								<input type="text" name="presigla" class="form-control input-sm" placeholder="Sigla Materia"  value="{{$materia->presigla}}"></textarea>
								<input type="text" name="postsigla" class="form-control input-sm" placeholder="Sigla Nivel"  value="{{$materia->postsigla}}"></textarea>
							</div>
							<div class="form-group">
										<select name="pensum" id="pensum" class="form-control input-sm" placeholder="Pensum" value="{{$materia->pensum}}">
											<option value="2000">Pensum 2000</option>
											<option value="anterior">Pensum Anterior</option>
											<option value="nuevo">Pensum Nuevo</option>											
										</select>
							</div>
							</div>
							</div>
							<div class="row">
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">									
											<select name="tipo" id="tipo" class="form-control input-sm" value="{{$materia->tipo}}"placeholder="Tipo" required>
											<option value="teoria">Teoria</option>
											<option value="laboratorio">Laboratorio</option>
											</select>										
									</div>
								</div>
								
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">									
											<select name="nivel" id="nivel" class="form-control input-sm" value="{{$materia->nivel}}"placeholder="Nivel" required>
											<option value="auxiliar">Auxiliatura</option>
											<option value="docente">Docencia</option>
											</select>										
									</div>
								</div>
							</div>
							
							<div class="form-group">
							<select name="paralelo" id="paralelo" class="form-control input-sm" placeholder="Paralelo"  value="{{$materia->paralelo}}"required>
											<option value="A">A</option>
											<option value="B">B</option>
											<option value="C">C</option>
											</select>
							</div>
							<div class="row">

								<div class="col-xs-12 col-sm-12 col-md-12">
									<input type="submit"  value="Actualizar" class="btn btn-success btn-block">
									<a href="{{ route('materia.index') }}" class="btn btn-info btn-block" >Atrás</a>
								</div>	

							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</section>
	@endsection