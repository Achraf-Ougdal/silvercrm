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

class ResidenceController extends VoyagerBaseController
{

    use BreadRelationshipParser;

    public function show(Request $request, $id)
    {
        $slug = 'residences';

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        $isSoftDeleted = false;

        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
                $model = $model->withTrashed();
            }
            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $model = $model->{$dataType->scope}();
            }
            $dataTypeContent = call_user_func([$model, 'findOrFail'], $id);
            if ($dataTypeContent->deleted_at) {
                $isSoftDeleted = true;
            }
        } else {
            // If Model doest exist, get data from table name
            $dataTypeContent = DB::table($dataType->name)->where('id', $id)->first();
        }

        // Replace relationships' keys for labels and create READ links if a slug is provided.
        $dataTypeContent = $this->resolveRelations($dataTypeContent, $dataType, true);

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'read');

        // Check permission
        $this->authorize('read', $dataTypeContent);

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'read', $isModelTranslatable);

        $view = 'voyager::bread.read';

        if (view()->exists("voyager::$slug.read")) {
            $view = "voyager::$slug.read";
        }

        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable', 'isSoftDeleted'));
    }

    public function indexAddGrille($id){

    	$residence = App\Residence::find($id);
    	$rooms = App\Room::where('residence_id', $id)->get();
    	$categories = App\RoomCategory::all();

    	return view('vendor.voyager.residences.addGrille', compact('residence', 'rooms', 'categories'));
    }

    public function addGrille(Request $request){
    	
    	$room = App\Room::where('numero', $request->get('chambre'))->get('id');
    	$category = App\RoomCategory::where('name', $request->get('category'))->get('id');
    	$is_tarif_exists = App\Room_tarif::where('room_id', $room['0']['id'])->where('residence_id', $request->get('residenceId'))->count();
    	
    	if ($is_tarif_exists > 0){

    		$data = [
                    'message'    => 'Cette chambre existe déjà sur la grille',
                    'alert-type' => 'error'
                ];
    		return redirect()->route('indexAddGrille', ['id'=>$request->get('residenceId')])->with($data);
    	}
    	else{

    		$roomTarif = new App\Room_tarif;

    		$roomTarif->residence_id = $request->get('residenceId');
    		$roomTarif->room_id = $room['0']['id'];
    		$roomTarif->category_id = $category['0']['id'];
    		$roomTarif->tarif = floatval($request->get('tarif'));
    		$roomTarif->start_date = $request->get('dateStart');

    		$roomTarif->save();

    		$data = [
                    'message'    => 'la chambre a été ajouté à la grille' ,
                    'alert-type' => 'success'
          	];

            return redirect()->route('indexAddGrille', ['id'=>$request->get('residenceId')])->with($data);

    	}
    }

    public function indexEditGrille($id){

    	$roomTarifs = App\Room_tarif::where('residence_id', $id)->where('end_date',null)->get();
    	$roomIds = [];
    	$actualStartDates = [];
    	
    	for ($i=0; $i < count($roomTarifs); $i++) { 
    		# code...
    		array_push($roomIds, $roomTarifs[$i]['room_id']);
    		array_push($actualStartDates, ['id'=>$roomTarifs[$i]['room_id'], "start_date"=>$roomTarifs[$i]['start_date']]);
    	}

    	$rooms = App\Room::find($roomIds);
    	$residence = App\Residence::find($id);
    	$categories = App\RoomCategory::all();

    	$actualCategories = [];


    	foreach ($roomTarifs as $rt){
    		$actualCategorySelect = App\RoomCategory::where('id', $rt['category_id'])->get();
    		array_push($actualCategories, ["room_id"=>$rt['room_id'], "category"=>$actualCategorySelect['0']['name']]);
    	}

    	$typesChambre = App\Room::select('type')->get();

    	return view('vendor.voyager.residences.editGrille', compact('rooms', 'residence', 'categories', 'typesChambre','roomTarifs','actualCategories','actualStartDates'));
    }

    public function viewGrille($id){

    	$roomTarifs = App\Room_tarif::where('residence_id', $id)->where('end_date',null)->get();
    	$roomIds = [];
    	
    	for ($i=0; $i < count($roomTarifs); $i++) { 
    		# code...
    		array_push($roomIds, $roomTarifs[$i]['room_id']);
    	}

    	$rooms = App\Room::find($roomIds);
    	$residence = App\Residence::find($id);
    	$categories = App\RoomCategory::all();

    	$actualCategories = [];

    	foreach ($roomTarifs as $rt){
    		$actualCategorySelect = App\RoomCategory::where('id', $rt['category_id'])->get();
    		array_push($actualCategories, ["room_id"=>$rt['room_id'], "category"=>$actualCategorySelect['0']['name']]);
    	}

    	$typesChambre = App\Room::select('type')->get();

    	return view('vendor.voyager.residences.viewGrille', compact('rooms', 'residence', 'categories', 'typesChambre','roomTarifs','actualCategories'));
    }

    public function searchGrille(Request $request){
    	
    	if ($request->get('numeroChambre') != '') {

                $residence_id = $request->get('residenceId');
                $categorie = ($request->get('categorie')== "categorie") ? null : $request->get('categorie');
                $type = ($request->get('typeChambre')== "typeChambre") ? null : $request->get('typeChambre');

               

                if ($categorie != null && $type != null){

                	$roomTarifs = App\Room_tarif::where('residence_id', $residence_id)->where('end_date', null)->get();
			    	$roomIds = [];
			    	
			    	for ($i=0; $i < count($roomTarifs); $i++) { 
			    		# code...
			    		array_push($roomIds, $roomTarifs[$i]['room_id']);
			    	}

			    	$actualCategories = [];

				    	foreach ($roomTarifs as $rt){
				    		$actualCategorySelect = App\RoomCategory::where('id', $rt['category_id'])->get();
				    		array_push($actualCategories, ["room_id"=>$rt['room_id'], "category"=>$actualCategorySelect['0']['name']]);
				    	}


			    	$chambreCategorie = App\RoomCategory::where('name', $categorie)->get('id');
			    	$rooms = App\Room::where('residence_id', $residence_id)->where('numero', $request->get('numeroChambre'))->where('type', $type)->where('room_categorie_id', $chambreCategorie['0']['id'])->get();
			    	$residence = App\Residence::find($residence_id);
			    	$categories = App\RoomCategory::all();

			    	$typesChambre = App\Room::select('type')->get();
			    	return view('vendor.voyager.residences.viewGrille', compact('rooms', 'residence', 'categories', 'typesChambre','roomTarifs','actualCategories'));
		     	}

		     	else if ($categorie == null && $type != null){

		     		$roomTarifs = App\Room_tarif::where('residence_id', $residence_id)->where('end_date', null)->get();
			    	$roomIds = [];
			    	
			    	for ($i=0; $i < count($roomTarifs); $i++) { 
			    		# code...
			    		array_push($roomIds, $roomTarifs[$i]['room_id']);
			    	}

			    	$actualCategories = [];

				    	foreach ($roomTarifs as $rt){
				    		$actualCategorySelect = App\RoomCategory::where('id', $rt['category_id'])->get();
				    		array_push($actualCategories, ["room_id"=>$rt['room_id'], "category"=>$actualCategorySelect['0']['name']]);
				    	}

			    	$rooms = App\Room::where('residence_id', $residence_id)->where('numero', $request->get('numeroChambre'))->where('type', $type)->get();
			    	$residence = App\Residence::find($residence_id);
			    	$categories = App\RoomCategory::all();

			    	$typesChambre = App\Room::select('type')->get();
			    	return view('vendor.voyager.residences.viewGrille',  compact('rooms', 'residence', 'categories', 'typesChambre','roomTarifs','actualCategories'));

		     	}
		     	else if ($categorie != null && $type == null){

		     		$roomTarifs = App\Room_tarif::where('residence_id', $residence_id)->where('end_date', null)->get();
			    	$roomIds = [];
			    	
			    	for ($i=0; $i < count($roomTarifs); $i++) { 
			    		# code...
			    		array_push($roomIds, $roomTarifs[$i]['room_id']);
			    	}

			    	$actualCategories = [];

				    	foreach ($roomTarifs as $rt){
				    		$actualCategorySelect = App\RoomCategory::where('id', $rt['category_id'])->get();
				    		array_push($actualCategories, ["room_id"=>$rt['room_id'], "category"=>$actualCategorySelect['0']['name']]);
				    	}

			    	$chambreCategorie = App\RoomCategory::where('name', $categorie)->get('id');
			    	$rooms = App\Room::where('residence_id', $residence_id)->where('numero', $request->get('numeroChambre'))->where('room_categorie_id', $chambreCategorie['0']['id'])->get();
			    	$residence = App\Residence::find($residence_id);
			    	$categories = App\RoomCategory::all();

			    	$typesChambre = App\Room::select('type')->get();
			    	return view('vendor.voyager.residences.viewGrille',  compact('rooms', 'residence', 'categories', 'typesChambre','roomTarifs','actualCategories'));

		     	}
		     	else{

		     		$roomTarifs = App\Room_tarif::where('residence_id', $residence_id)->where('end_date', null)->get();

			    	$roomIds = [];
			    	
			    	for ($i=0; $i < count($roomTarifs); $i++) { 
			    		# code...
			    		array_push($roomIds, $roomTarifs[$i]['room_id']);
			    	}


			    	$actualCategories = [];

				    	foreach ($roomTarifs as $rt){
				    		$actualCategorySelect = App\RoomCategory::where('id', $rt['category_id'])->get();
				    		array_push($actualCategories, ["room_id"=>$rt['room_id'], "category"=>$actualCategorySelect['0']['name']]);
				    	}



			    	$rooms = App\Room::where('residence_id', $residence_id)->where('numero', $request->get('numeroChambre'))->get();
			    	$residence = App\Residence::find($residence_id);
			    	$categories = App\RoomCategory::all();

			    	$typesChambre = App\Room::select('type')->get();
			    	return view('vendor.voyager.residences.viewGrille',  compact('rooms', 'residence', 'categories', 'typesChambre','roomTarifs','actualCategories'));

		     	}

            }

    }

    public function editGrille(Request $request){

    	$residence_id = $request->get('residenceId');

    	$roomIdSelect = App\Room_tarif::where('residence_id', $residence_id)->get('room_id');
    	$roomIds = [];

    	foreach ($roomIdSelect as $id ) {
    		# code...
    		array_push($roomIds, $id['room_id']);
    	}

		$roomsTochange = [];

    	foreach ($roomIds as $roomId){
    		
    		$changeCaterogie = false;
    		$changeTarif = false;
    		$changeDateStart = false;

    		//should we change the category ?
    		if ($request->get(''.$roomId.'_categorie_old') != $request->get(''.$roomId.'_categorie_new')){
    			// yes we should
    			$changeCaterogie = true;
    		}

    		//should we change the tarif ?
    		if ($request->get(''.$roomId.'_tarif_new') != null){
    			// yes we should
    			$changeTarif = true;
    		}
    		//should we change the start_date ?
    		if ($request->get(''.$roomId.'_dateStart_new') != null){
    			// yes we should
    			$changeDateStart = true;
    		}

    		array_push($roomsTochange, [
    			'id' => $roomId,
    			'changeCaterogie' => $changeCaterogie,
    			'changeTarif' => $changeTarif,
    			'changeDateStart' => $changeDateStart
    		]);
    	}

    	foreach ($roomsTochange as $change) {
    		
    		if ($change['changeCaterogie'] && !$change['changeTarif'] && !$change['changeDateStart']){
    			$category = App\RoomCategory::where('name',  $request->get(''.$change['id'].'_categorie_new'))->get('id');
    			DB::update('update room_tarif set category_id = ? where room_id = ? and residence_id = ?', [$category['0']['id'],$change['id'], $residence_id]);
    		}

    		if ($change['changeTarif'] && !$change['changeDateStart']){

    			$oldRoomTarif = App\Room_tarif::where('end_date', null)->where('room_id', $change['id'])->where('residence_id', $residence_id)->update([
    					'end_date'=>date("Y-m-d")
    			]);

    			$category = App\RoomCategory::where('name',  $request->get(''.$change['id'].'_categorie_new'))->get('id');

    			$newRoomTarif = new App\Room_tarif;

    			$newRoomTarif->room_id = $change['id'];
    			$newRoomTarif->residence_id = $residence_id;
    			$newRoomTarif->category_id = $category['0']['id'];
    			$newRoomTarif->tarif = $request->get(''.$change['id'].'_tarif_new');
    			$newRoomTarif->start_date = date("Y-m-d");

    			$newRoomTarif->save();
    			
    		}

    		if ($change['changeDateStart'] && !$change['changeTarif']){

    			$oldRoomTarif = App\Room_tarif::where('end_date', null)->where('room_id', $change['id'])->where('residence_id', $residence_id)->update([
    					'end_date'=>date("Y-m-d")
    			]);

    			$category = App\RoomCategory::where('name',  $request->get(''.$change['id'].'_categorie_new'))->get('id');

    			$newRoomTarif = new App\Room_tarif;

    			$newRoomTarif->room_id = $change['id'];
    			$newRoomTarif->residence_id = $residence_id;
    			$newRoomTarif->category_id = $category['0']['id'];
    			$newRoomTarif->tarif = $request->get(''.$change['id'].'_tarif_old');
    			$newRoomTarif->start_date = $request->get(''.$change['id'].'_dateStart_new');

    			$newRoomTarif->save();
    		}

    		if ($change['changeDateStart'] && $change['changeTarif']){

    			$oldRoomTarif = App\Room_tarif::where('end_date', null)->where('room_id', $change['id'])->where('residence_id', $residence_id)->update([
    					'end_date'=>date("Y-m-d")
    			]);

    			$category = App\RoomCategory::where('name',  $request->get(''.$change['id'].'_categorie_new'))->get('id');

    			$newRoomTarif = new App\Room_tarif;

    			$newRoomTarif->room_id = $change['id'];
    			$newRoomTarif->residence_id = $residence_id;
    			$newRoomTarif->category_id = $category['0']['id'];
    			$newRoomTarif->tarif = $request->get(''.$change['id'].'_tarif_new');
    			$newRoomTarif->start_date = $request->get(''.$change['id'].'_dateStart_new');

    			$newRoomTarif->save();

    		}
    	}

    	$data = [
    		'message'    => 'Grille modifié avec succès',
            'alert-type' => 'success',
    	];

    	return redirect()->route('viewGrille', ['id'=>$residence_id])->with($data);

    }
}
