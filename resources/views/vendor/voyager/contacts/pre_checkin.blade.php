@php
    // $edit = !is_null($dataTypeContent->getKey());
    // $add  = is_null($dataTypeContent->getKey());
     $add = true;
     $edit = false;
    //dd($residences);
@endphp

@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop

@section('page_title', __('voyager::generic.'.($edit ? 'edit' : 'add')).' contact & senior')

@section('page_header')
    <h1 class="page-title">

        {{ __('voyager::generic.'.($edit ? 'edit' : 'add')).'  contact & senior' }}
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content edit-add container-fluid">


                    <form role="form"
                          class="form-edit-add"
                          action="{{ route('checkin.verif') }}"
                          method="POST" enctype="multipart/form-data">


                    <!-- CSRF TOKEN -->
                        {{ csrf_field() }}
                                                <div class="row">
                                                    <div class="col-md-12">

                                                        <div class="panel panel-bordered">
                                                        <div class="panel-body">

                                                        @if (count($errors) > 0)
                                                            <div class="alert alert-danger">
                                                                <ul>
                                                                    @foreach ($errors->all() as $error)
                                                                        <li>{{ $error }}</li>
                                                                    @endforeach
                                                                </ul>
                                                            </div>
                                                        @endif

                                                            <div class="form-group col-md-6 ">
                                                                <label class="control-label" for="name">Nom du senior</label>
                                                                <input required="" type="text" class="form-control" name="senior_name" placeholder="Nom du senior" value="">

                                                            </div>
                                                            <div class="form-group col-md-6 ">
                                                                <label class="control-label" for="xxx">Résidence</label>

                                                                <select class="form-control select2 select2-hidden-accessible" name="residence_id" data-select2-id="10" tabindex="-1" aria-hidden="true">
                                                                    @foreach($residences as $residence)
                                                                        <option value="<?php echo $residence->id; ?>"><?php echo $residence->name; ?></option>
                                                                    @endforeach
                                                                </select>

                                                            </div>



                                                        </div><!-- panel-body -->




                                                    <div class="panel-footer">
                                                        @section('submit-buttons')
                                                            <button type="submit" class="btn btn-primary save">{{ __('voyager::generic.save') }}</button>
                                                        @stop
                                                        @yield('submit-buttons')
                                                    </div>




                                            </div>
                                        </div>
                                    </div>
                    </form>
    </div>


@stop

@section('javascript')

@stop
