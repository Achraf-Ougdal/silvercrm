<?php

namespace  App\Http\Controllers\Voyager;

use TCG\Voyager\Http\Controllers\VoyagerBaseController;

use Exception;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Database\Schema\SchemaManager;
use TCG\Voyager\Events\BreadDataAdded;
use TCG\Voyager\Events\BreadDataDeleted;
use TCG\Voyager\Events\BreadDataRestored;
use TCG\Voyager\Events\BreadDataUpdated;
use TCG\Voyager\Events\BreadImagesDeleted;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\Traits\BreadRelationshipParser;
use App;

class ContactController extends VoyagerBaseController
{
    use BreadRelationshipParser;
/*
    public function create (Request $request){
        $slug = $this->getSlug($request);
        dd($slug);
    }
*/
    public function checkin(Request $request){
        return "Yes";
       // $view = 'voyager::contacts.checkin';
        //return Voyager::view($view);
    }
    public function create_checkin (Request $request, $name = ""){

        $slug = 'elders';

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('add', app($dataType->model_name));

        $dataTypeContent = (strlen($dataType->model_name) != 0)
            ? new $dataType->model_name()
            : false;

        foreach ($dataType->addRows as $key => $row) {
            $dataType->addRows[$key]['col_width'] = $row->details->width ?? 100;
        }

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'add');

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'add', $isModelTranslatable);

        $dataType_elders = $dataType;
        $dataTypeContent_elders = $dataTypeContent;
        $isModelTranslatable_elders = $isModelTranslatable;

        //-----------------------------------------------------------------


        $slug = 'contacts';

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('add', app($dataType->model_name));

        $dataTypeContent = (strlen($dataType->model_name) != 0)
            ? new $dataType->model_name()
            : false;

        foreach ($dataType->addRows as $key => $row) {
            $dataType->addRows[$key]['col_width'] = $row->details->width ?? 100;
        }

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'add');

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'add', $isModelTranslatable);



        $view = 'voyager::contacts.checkin';

        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable'
                    , 'dataType_elders', 'dataTypeContent_elders', 'isModelTranslatable_elders',
                    'name'
        ));


    }

    public function store_checkin(Request $request){

        $slug = 'contacts';

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permissionc
        $this->authorize('add', app($dataType->model_name));

        // Validate fields with ajax
        $val = $this->validateBread($request->all(), $dataType->addRows)->validate();
        $data = $this->insertUpdateData($request, $slug, $dataType->addRows, new $dataType->model_name());

        event(new BreadDataAdded($dataType, $data));

         //______________________________________________________________________________________________
         //dd($request);
         //$request =


        $slug = 'elders';

        $request->request->set('first_name', $request->request->get('elder_first_name') );
        $request->request->set('last_name', $request->request->get('elder_last_name') );
        $request->request->set('address', $request->request->get('elder_address') );
        $request->request->set('zip_code', $request->request->get('elder_zip_code') );


        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('add', app($dataType->model_name));

        // Validate fields with ajax
        $val = $this->validateBread($request->all(), $dataType->addRows)->validate();
        $data = $this->insertUpdateData($request, $slug, $dataType->addRows, new $dataType->model_name());

        event(new BreadDataAdded($dataType, $data));



        if (!$request->has('_tagging')) {
            // IF WEB OR API ?
            if (auth()->user()->can('browse', $data)) {
                $redirect = redirect()->route("voyager.{$dataType->slug}.index");
            } else {
                $redirect = redirect()->back();
            }

            return $redirect->with([
                'message'    => __('voyager::generic.successfully_added_new')." {$dataType->getTranslatedAttribute('display_name_singular')}",
                'alert-type' => 'success',
            ]);
        } else {
            return response()->json(['success' => true, 'data' => $data]);
        }
    }
    public function pre_checkin(Request $request){

        $residences = App\Residence::select('id','name')->get();
        //dd($residences[0]->name);
        return Voyager::view('voyager::contacts.pre_checkin',compact('residences'));
    }
    public function checkin_verify(Request $request){
        $req = $request->request;
        $cnt = App\Elder::where('elder_last_name',$req->get('senior_name'))
            ->where('residence_id',$req->get('residence_id'))
            ->count();

        if($cnt > 0){
            $data = [
                'message'    => 'Un senior avec le meme nom existe déjà',
                'alert-type' => 'error',
            ];
            return redirect()->route("voyager.elders.index")->with($data);
        }else{
            return redirect()->route("checkin.form");
        }

    }


}
