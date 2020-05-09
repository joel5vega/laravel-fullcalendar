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
					<h3 class="panel-title">Nuevo ambiente</h3>
				</div>
				<div class="panel-body">					
					<div class="table-container">
						<form method="POST" action="{{ route('ambiente.update',$ambiente->id) }}"  role="form">
							{{ csrf_field() }}
							<input name="_method" type="hidden" value="PATCH">
							<div class="row">
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="text" name="nombre" id="nombre" class="form-control input-sm" value="{{$ambiente->nombre}}">
									</div>
								</div>

								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
											<select name="tipo" id="tipo" class="form-control input-sm" value="{{$ambiente->tipo}}" required>
											<option value="aula">Aula</option>
											<option value="laboratorio">Laboratorio</option>
											<option value="auditorio">Auditorio</option>
											</select>										
									</div>
								</div>

								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="integer" name="capacidad" id="capacidad" class="form-control input-sm" value="{{$ambiente->capacidad}}">
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="text" name="edificio" id="edificio" class="form-control input-sm" value="{{$ambiente->edificio}}">
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="text" name="piso" id="piso" class="form-control input-sm" value="{{$ambiente->piso}}">
									</div>
								</div>
							</div>

							
								
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-12">
									<input type="submit"  value="Actualizar" class="btn btn-success btn-block">
									<a href="{{ route('ambiente.index') }}" class="btn btn-info btn-block" >Atrás</a>
								</div>	
							</div>
							
						</form>
					</div>
				</div>

			</div>
		</div>
	</section>
	@endsection