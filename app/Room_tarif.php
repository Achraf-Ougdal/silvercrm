<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App;

class Room_tarif extends Model
{
    //

    protected $table = 'room_tarif';

    public function rooms(){
    	return $this->belongsTo(App\Room::class);
    }

    public function categorie(){
    	return $this->belongsTo(App\RoomCategory::class, 'category_id');
    }

}
