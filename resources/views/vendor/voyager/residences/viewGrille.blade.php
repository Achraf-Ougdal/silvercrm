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
                	<form method="GET" class="form-search" action="{{route('grilleSearch')}}">
                		
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
                                        	<option value="categorie" >Categorie</option>
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
                            </form>
                	<table class="table">
                                <thead>
                                    <tr>
                                        <th >Numero de chambre </th>
                                        <th >Type de chambre </th>
                                        <th >Categorie de chambre </th>
                                        <th >Tarif de la chambre </th>
                                        <th ></th>
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
                                                            
                                                        @endphp
                                                    @endif
                                                @endforeach
                                    <tr >
                                        <td >{{$room->numero}}</td>
                                        <td >{{$room->type}}</td>
                                        <td >
                                            {{$actualCategory}}
                                        </td>
                                        <td >
                                            {{$actualTarif}}
                                        </td>
                                        <td ><a href="#">Historique</a></td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                </div>
            </div>
        </div>
    </div>
@stop


