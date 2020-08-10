@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        Créer Grille de tarifs
    </h1>
    &ensp;

    @include('voyager::multilingual.language-selector')
@stop

@section('content')

    <div class="page-content read container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered container-fluid" style="padding-bottom:15px; padding-top: 15px;">
                	<form  method="post" onsubmit="return validateForm()" action="{{route('addGrille')}}" class="col-md-6" enctype="multipart/form-data">

                		<!-- CSRF TOKEN -->
                        {{ csrf_field() }}

                        <div id="errors">
                            	
                        </div>
                        
                       <input type="text" name="residenceId" value="{{$residence->id}}" hidden="true">
                		<div class="form-group">
                			<h4>Nom de la residence *</h4>
                			<input type="text" class="form-control"  name="nomResidence" value="{{$residence->name}}" disabled>
                		</div>
                		<div class="form-group">
                			<h4>Début de validité *</h4>
                			<input id="dateStart" type="date" class="form-control"  name="dateStart" required>
                		</div>
                		<div class="form-group">
                			<h4>Numero de chambre *</h4>
                			<select id="chambre" name="chambre" class="form-control" style="padding-right: 20px; padding-left: 20px;">
                             	@foreach ($rooms as $room)
                                <option value="{{$room->numero}}">{{$room->numero}}</option>
                                @endforeach
                            </select>
                		</div>
                		<div class="form-group">
                			<h4>Categorie *</h4>
                			<select id="category" name="category" class="form-control" style="padding-right: 20px; padding-left: 20px;">
                             	@foreach ($categories as $category)
                                <option value="{{$category->name}}">{{$category->name}}</option>
                                @endforeach
                            </select>
                		</div>
                		<div class="form-group">
                			<h4>Tarif *</h4>
                			<input id="tarif" type="number" step="any" class="form-control"  name="tarif" required >
                		</div>
                	
                		<button type="submit" class="btn btn-primary save"><i class="voyager-check"></i>Enregistrer</button>
                	</form>
                </div>
            </div>
        </div>
    </div>
@stop
@section('javascript')
    <script>

    	function validateForm(){
    		var errors = [];
			var tarif = document.getElementById("tarif").value;

			tarif = parseInt(tarif);

			if (tarif < 0){
				errors.push("le tarif doit être positif");
			}

			if (errors.length > 0){
				var container = document.getElementById('errors');
				container.innerHTML= "<ul id='errorList' class='alert alert-danger'></ul>";
				var list = document.getElementById('errorList');
				list.innerHTML += '<li>'+errors[0]+'</li>';
				window.scrollTo(0, 0);
				return false
			}

			return true;
    	}

    </script>
@stop

