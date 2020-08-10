<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App;

class Room extends Model
{
	public function elder_rooms(){
		return $this->hasMany(App\Elder_room::class);
	}

	public function room_tarif(){
		return $this->hasMany(App\Room_tarif::class);
	}

	public function residence(){
		return $this->belongsTo(App\Residence::class);
	}

	public function roomCategory(){
		return $this->belongsTo(App\RoomCategory::class, 'room_categorie_id');
	}

}
