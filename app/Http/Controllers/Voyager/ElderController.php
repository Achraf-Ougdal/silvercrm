<?php

namespace App\Http\Controllers\Voyager;

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

class ElderController extends VoyagerBaseController
{

    use BreadRelationshipParser;

    public function search(Request $request){
/*
        $residence_id = null;
        $source = $_GET['source'] == "source" ? null : $_GET['source'];
        $elderName = $_GET['elderName'];

        if ($_GET['residence'] != 'residence'){
        	$residence = App\Residence::where('name', $_GET['residence'])->get('id');
        	$residence_id = $residence['0']['id'];
        }

     	if ($residence_id != null && $source != null){
     		
     		$elder = App\Elder::where('elder_last_name',$_GET['elderName'])
     		->where('residence_id',$residence_id)->where('source', $source)
            ->get();

     	}

     	else if ($residence_id == null && $source != null){

     		$elder = App\Elder::where('elder_last_name',$_GET['elderName'])->where('source', $source)
            ->get();

     	}

     	else if ($residence_id != null && $source == null){
     		$elder = App\Elder::where('elder_last_name',$_GET['elderName'])
     		->where('residence_id',$residence_id)
            ->get();

     	}

     	else{
     		$elder = App\Elder::where('elder_last_name',$_GET['elderName'])
            ->get();

     	}

     	if ($elder->count() == 0){
     		$data = [
            	'message'    => 'identifiant introuvable',
            	'alert-type' => 'error',
        	];
        	return redirect()->route("voyager.elders.index")->with($data);
     	}
     	
     	else{
     		return redirect()->route("voyager.elders.index", compact('residence_id', 'source', 'elderName'));
     	}
        
*/
     	$slug = 'elders';
            
        $residences = DB::select('select * from residences');

        // GET THE DataType based on the slug
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('browse', app($dataType->model_name));

        $getter = $dataType->server_side ? 'paginate' : 'get';

        $search = (object) ['value' => $request->get('elderName'), 'source' => $request->get('source'), 'residence' => $request->get('residence')];

        $searchNames = [];
        if ($dataType->server_side) {
            $searchable = SchemaManager::describeTable(app($dataType->model_name)->getTable())->pluck('name')->toArray();
            $dataRow = Voyager::model('DataRow')->whereDataTypeId($dataType->id)->get();
            foreach ($searchable as $key => $value) {
                $field = $dataRow->where('field', $value)->first();
                $displayName = ucwords(str_replace('_', ' ', $value));
                if ($field !== null) {
                    $displayName = $field->getTranslatedAttribute('display_name');
                }
                $searchNames[$value] = $displayName;
            }
        }

        $orderBy = $request->get('order_by', $dataType->order_column);
        $sortOrder = $request->get('sort_order', $dataType->order_direction);
        $usesSoftDeletes = false;
        $showSoftDeleted = false;

        // Next Get or Paginate the actual content from the MODEL that corresponds to the slug DataType
        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);

            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $query = $model->{$dataType->scope}();
            } else {
                $query = $model::select('*');
            }

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model)) && Auth::user()->can('delete', app($dataType->model_name))) {
                $usesSoftDeletes = true;

                if ($request->get('showSoftDeleted')) {
                    $showSoftDeleted = true;
                    $query = $query->withTrashed();
                }
            }

            // If a column has a relationship associated with it, we do not want to show that field
            $this->removeRelationshipField($dataType, 'browse');

            if ($search->value != '' && $search->source && $search->residence) {
                /*$search_filter = ($search->residence == 'source') ? '=' : 'LIKE';
                $search_value = ($search->residence == 'equals') ? $search->value : '%'.$search->value.'%';
                $query->where($search->key, $search_filter, $search_value);*/

                $residence_id = null;
                $source = ($search->source == "source") ? null : $search->source;

                if ($search->residence != 'residence'){
                	$residence = App\Residence::where('name', $search->residence)->get('id');
        			$residence_id = $residence['0']['id'];
                }

                if ($residence_id != null && $source != null){

		     		$query->where('elder_last_name', $search->value)
		     		->where('residence_id', $residence_id)
		     		->where('source', $source);
		     	}

		     	else if ($residence_id == null && $source != null){
		     		$query->where('elder_last_name', $search->value)
		     		->where('source', $source);
		     	}
		     	else if ($residence_id != null && $source == null){
		     		$query->where('elder_last_name', $search->value)
		     		->where('residence_id', $residence_id);
		     	}
		     	else{
		     		$query->where('elder_last_name', $search->value);
		     	}

            }

            if ($orderBy && in_array($orderBy, $dataType->fields())) {
                $querySortOrder = (!empty($sortOrder)) ? $sortOrder : 'desc';
                $dataTypeContent = call_user_func([
                    $query->orderBy($orderBy, $querySortOrder),
                    $getter,
                ]);
            } elseif ($model->timestamps) {
                $dataTypeContent = call_user_func([$query->latest($model::CREATED_AT), $getter]);
            } else {
                $dataTypeContent = call_user_func([$query->orderBy($model->getKeyName(), 'DESC'), $getter]);
            }

            // Replace relationships' keys for labels and create READ links if a slug is provided.
            $dataTypeContent = $this->resolveRelations($dataTypeContent, $dataType);
        } else {
            // If Model doesn't exist, get data from table name
            $dataTypeContent = call_user_func([DB::table($dataType->name), $getter]);
            $model = false;
        }

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($model);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'browse', $isModelTranslatable);

        // Check if server side pagination is enabled
        $isServerSide = isset($dataType->server_side) && $dataType->server_side;

        // Check if a default search key is set
        $defaultSearchKey = $dataType->default_search_key ?? null;

        // Actions
        $actions = [];
        if (!empty($dataTypeContent->first())) {
            foreach (Voyager::actions() as $action) {
                $action = new $action($dataType, $dataTypeContent->first());

                if ($action->shouldActionDisplayOnDataType()) {
                    $actions[] = $action;
                }
            }
        }

        // Define showCheckboxColumn
        $showCheckboxColumn = false;
        if (Auth::user()->can('delete', app($dataType->model_name))) {
            $showCheckboxColumn = true;
        } else {
            foreach ($actions as $action) {
                if (method_exists($action, 'massAction')) {
                    $showCheckboxColumn = true;
                }
            }
        }

        // Define orderColumn
        $orderColumn = [];
        if ($orderBy) {
            $index = $dataType->browseRows->where('field', $orderBy)->keys()->first() + ($showCheckboxColumn ? 1 : 0);
            $orderColumn = [[$index, $sortOrder ?? 'desc']];
        }

        $view = 'voyager::bread.browse';

        if (view()->exists("voyager::$slug.browse")) {
            $view = "voyager::$slug.browse";
        }

        return Voyager::view($view, compact(
            'actions',
            'dataType',
            'dataTypeContent',
            'isModelTranslatable',
            'search',
            'orderBy',
            'orderColumn',
            'sortOrder',
            'searchNames',
            'isServerSide',
            'defaultSearchKey',
            'usesSoftDeletes',
            'showSoftDeleted',
            'showCheckboxColumn',
            'residences'
        ));
    }
    	
}
