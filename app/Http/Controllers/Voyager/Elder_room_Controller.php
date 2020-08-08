<?php

namespace App\Http\Controllers\Voyager;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App;

class Elder_room_Controller extends Controller
{
    //

    public function indexAddSejour($id){

    	$elder = App\Elder::find($id);
        $rooms = App\Room::all();

    	return view('vendor.voyager.elders.addSejour', compact('elder', 'rooms'));
    }

    public function indexEditSejour($id){

        $elder = App\Elder::find($id);
        $rooms = App\Room::all();

        $elderRoom = App\Elder_room::where('elder_id', $id)->get();

        
        $idChambre = $elderRoom['0']['room_id'];
        $chambre = App\Room::find($idChambre);
        $chambreNumero= $chambre->numero;

        return view('vendor.voyager.elders.editSejour', compact('elder', 'rooms', 'elderRoom', 'chambreNumero'));    
    }

    public function addSejour(Request $request){
    	
        $chambre = $request->get('chambre');
        $prix = $request->get('prix');

        $room = App\Room::where('numero', $chambre)->get('id');

        // handle file upload

        if ($request->hasFile('contrat')){

            $fileExt = $request->file('contrat')->getClientOriginalExtension();

            if ($fileExt == "pdf"){

                $elderConserne = App\Elder::find($request->elderId);

                $fileNameToStore = $elderConserne->elder_last_name.'_'.$elderConserne->elder_first_name.'_'.$chambre.'_contrat_'.time().'.'.$fileExt;
                $path = $request->file('contrat')->storeAs('public/contrats',$fileNameToStore);

                $elder_room = new App\Elder_room;

                $elder_room->elder_id = $request->elderId;
                $elder_room->room_id = $room['0']['id'];
                $elder_room->titleSejour = $request->get('titreSejour');
                $elder_room->typeSejour = $request->get('typeSejour');
                $elder_room->prix = floatval($prix);
                $elder_room->date_start = $request->get('dateEntree');
                $elder_room->date_fin = $request->get('dateSortie');
                $elder_room->contratSejour = $fileNameToStore;

                $elder_room->save();

                $data = [
                    'message'    => 'Séjour a été ajouté avec succès',
                    'alert-type' => 'success',
                ];
                return redirect()->route("voyager.elders.show", ['id'=>$request->elderId])->with($data);

            }

            else{

                $data = [
                    'message'    => 'le contrat doit etre sous format pdf',
                    'alert-type' => 'error',
                ];
                return redirect()->route("elder.addSejour", ['id'=>$request->elderId])->with($data);
            }

        }

    }

    public function editSejour(Request $request){
        $chambre = $request->get('chambre');
        $prix = $request->get('prix');

        $room = App\Room::where('numero', $chambre)->get('id');

        // handle file upload

        if ($request->hasFile('contrat')){

            $fileExt = $request->file('contrat')->getClientOriginalExtension();

            if ($fileExt == "pdf"){

                $elderConserne = App\Elder::find($request->elderId);

                $fileNameToStore = $elderConserne->elder_last_name.'_'.$elderConserne->elder_first_name.'_'.$chambre.'_contrat_'.time().'.'.$fileExt;
                $path = $request->file('contrat')->storeAs('public/contrats',$fileNameToStore);

                App\Elder_room::where('elder_id', $request->elderId)->update([
                    'room_id'=> $room['0']['id'],
                    'titleSejour'=> $request->get('titreSejour'),
                    'typeSejour'=> $request->get('typeSejour'),
                    'prix'=> floatval($prix),
                    'date_start'=> $request->get('dateEntree'),
                    'date_fin'=> $request->get('dateSortie'),
                    'contratSejour'=>$fileNameToStore
                ]);

                $data = [
                    'message'    => 'Séjour a été modifié avec succès',
                    'alert-type' => 'success',
                ];
                return redirect()->route("voyager.elders.show", ['id'=>$request->elderId])->with($data);

            }

            else{

                $data = [
                    'message'    => 'le contrat doit etre sous format pdf',
                    'alert-type' => 'error',
                ];
                return redirect()->route("elder.editSejour", ['id'=>$request->elderId])->with($data);
            }

        }
    }

    public function deleteSejour($id){

        DB::delete('delete from elder_rooms where elder_id=?', [$id]);

        $data = [
                'message'    => 'Séjour a été supprimé avec succès',
                'alert-type' => 'success',
        ];

        return redirect()->route("voyager.elders.show", ['id'=>$id])->with($data);

    }
}
