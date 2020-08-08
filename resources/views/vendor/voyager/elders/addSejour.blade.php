@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        Ajouter une chambre pour {{$elder->elder_first_name}} {{$elder->elder_last_name}} 
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')

    <div class="page-content read container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered container-fluid" style="padding-bottom:15px; padding-top: 15px;">
                	<form  method="post" onsubmit="return validateForm()" action="{{route('addSejour')}}" class="col-md-6" enctype="multipart/form-data">

                		<!-- CSRF TOKEN -->
                        {{ csrf_field() }}

                        <div id="errors">
                            	
                        </div>
                        
                        <input type="text" name="elderId" value="{{$elder->id}}" hidden>
                		<div class="form-group">
                			<h4>Titre *</h4>
                			<input type="text" class="form-control"  name="titreSejour" required>
                		</div>
                		<div class="form-group">
                			<h4>Type de séjour *</h4>
                			<select id="typeSejour" name="typeSejour" class="form-control" style="padding-right: 20px; padding-left: 20px;">
                                <option value="Cours séjour">Cours séjour</option>
                                <option value="Long séjour">Long séjour</option>
                                <option value="Acceuil de jour">Acceuil de jour</option>
                            </select>
                		</div>
                		<div class="form-group">
                			<h4>Date d'entrée *</h4>
                			<input id="dateEntree" type="date" class="form-control"  name="dateEntree" required>
                		</div>
                		<div class="form-group">
                			<h4>Date de sortie </h4>
                			<input id="dateSortie" type="date" class="form-control" name="dateSortie" >
                		</div>
                		<div class="form-group">
                			<h4>Chambre *</h4>
                			<select id="chambre" name="chambre" class="form-control" style="padding-right: 20px; padding-left: 20px;">
                               @foreach ($rooms as $room)
                                <option value="{{$room->numero}}">{{$room->numero}}</option>
                                @endforeach
                            </select>
                		</div>
                		<div class="form-group">
                			<h4>Prix *</h4>
                			<input id="prix" type="number" step="any" class="form-control"  name="prix" required >
                		</div>
                		<div class="form-group">
                			<h4>Contrat de sejour *</h4>
                			<input type="file"  name="contrat" required>
                		</div>
                		<button type="submit" class="btn btn-primary save">Ajouter un séjour</button>
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

			var dateEntree = document.getElementById("dateEntree").value;
			var dateSortie = document.getElementById("dateSortie").value;
			var prix = document.getElementById("prix").value;

			prix = parseInt(prix);

			console.log(prix);
			console.log(dateSortie);

			if (!dateSortie.isEmpty){
				var dEntree = new Date(dateEntree); 
			    var dSortie = new Date(dateSortie);

			    if (dEntree.getTime() > dSortie.getTime()){
			    	errors.push("la date de sortie doit etre superieur à la date d'entrée");
			    }
			}

			if (prix < 0){
				errors.push("le prix doit être positif");
			}

			if (errors.length > 0){
				let i = 0;
				var container = document.getElementById('errors');
				container.innerHTML= "<ul id='errorList' class='alert alert-danger'></ul>";
				var list = document.getElementById('errorList');
				for (i = 0; i < errors.length; i++) {
				  list.innerHTML += '<li>'+errors[i]+'</li>';
				}
				window.scrollTo(0, 0);
				return false
			}

			return true;
    	}
    </script>
@stop

