@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        Grille de tarifs
    </h1>
    &ensp;

    @include('voyager::multilingual.language-selector')
@stop

@section('content')

    <div class="page-content read container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered container-fluid" style="padding-bottom:15px; padding-top: 15px;">

                	<h3>{{$residence->name}}</h3>
                
                	<br>
                	<!--<form method="GET" class="form-search" action="{{route('grilleSearch')}}">
                		
                               <div id="search-input">
                                    <div class="col-2">
                                    	<input type="text" name="residenceId" value="{{$residence->id}}" hidden>
                                        <select id="typeChambre" name="typeChambre" class="form-control" style="padding-right: 40px; padding-left: 0px;">
                                            <option value="typeChambre">Type de chambre</option>  
                                            @foreach ($typesChambre as $type)
                                            	@if($type->type)
                                            		<option value="{{$type->type}}">{{$type->type}}</option>
                                            	@endif
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-2">
                                        <select id="categorie" name="categorie" class="form-control" style="padding-right: 40px; padding-left: 20px; text-align: center;">
                                        	<option value="categorie">Categorie</option>
                                        	@foreach ($categories as $categorie)
                                            	<option value="{{$categorie->name}}">{{$categorie->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="input-group col-md-12">
                                        <input type="text" class="form-control" placeholder="Numero de chambre" name="numeroChambre" required>
                                        <span class="input-group-btn">
                                            <button class="btn btn-info btn-lg" type="submit">
                                                <i class="voyager-search"></i>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            </form>-->
                			<form method="post" action="{{route('editGrille')}}" onsubmit="return validateForm()">
								
								<!-- CSRF TOKEN -->
                        		{{ csrf_field() }}

                        		<div id="errors">
                            	
                        		</div>

                				<input type="text" name="residenceId" value="{{$residence->id}}" hidden>

                				

                				<table class="table">
                                <thead>
                                    <tr>
                                        <th >Numero de chambre </th>
                                        <th >Type de chambre </th>
                                        <th >Categorie de chambre </th>
                                        <th >Tarif de la chambre </th>
                                        <th >Validité</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	

	                                	@foreach($rooms as $room)
		                                	@php
		                                		$roomTarif = $room->room_tarif;
		                                	@endphp
		                                	@foreach ($actualCategories as $ac)
		                                        @if($ac['room_id'] == $room->id)
		                                            @php
		                                                $actualCategory = $ac['category'];
		                                            @endphp
		                                        @endif
		                                    @endforeach
		                                    @foreach ($roomTarifs as $roomT)
	                                            @if($roomT['room_id'] == $room->id)
	                                            	@php
	                                                	$actualTarif = $roomT['tarif'];
	                                                	$actualStartDate = $roomT['start_date'];
	                                                @endphp
	                                            @endif
	                                        @endforeach

	                                    <tr>
	                                        <td >{{$room->numero}}<br><input type="text" name="roomId" value="{{$room->id}}" hidden></td>
	                                        <td >{{$room->type}}</td>
	                                        <td >
	                                        	<span>
	                                        		{{$actualCategory}}
	                                        	</span>
	                                        	<input type="text" name="{{$room->id}}_categorie_old" value="{{$actualCategory}}" hidden>
	                                        	<br>
	                                        	<br>
	                                        	<select name="{{$room->id}}_categorie_new" class="form-control" style="padding-right: 40px; padding-left: 20px; text-align: center;">
		                                        	@foreach ($categories as $categorie)
		                                            	<option value="{{$categorie->name}}" @if($categorie->name== $actualCategory) selected @endif>{{$categorie->name}}</option>
		                                            @endforeach
	                                        	</select>
	                                        </td>
	                                        <td >
	                                        	<span>{{$actualTarif}}</span>
	                                        	<input type="number" name="{{$room->id}}_tarif_old" value="{{$actualTarif}}" hidden>
	                                        	<br>
	                                        	<br>
	                                        	<input type="number" step="any" id="tarif" name="{{$room->id}}_tarif_new" >
	                                        </td>
	                                        <td >
	                                        	<span>{{$actualStartDate}}</span>
	                                        	<input type="date" name="{{$room->id}}_dateStart_old" value="{{$actualStartDate}}" hidden>
	                                        	<br>
	                                        	<br>
	                                        	<input type="date" name="{{$room->id}}_dateStart_new" >
	                                        </td>
	                                    </tr>
	                                @endforeach
                                </tbody>
                            </table>
	                        <br>
	                        <button type="submit" class="btn btn-primary save" @if(count($rooms) == 0) disabled @endif><i class="voyager-check"></i>Enregistrer</button>
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


