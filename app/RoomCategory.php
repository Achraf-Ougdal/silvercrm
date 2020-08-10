<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App;

class RoomCategory extends Model
{
	protected $table = 'room_categories';

    public function room_tarif(){
		return $this->hasMany(App\Room_tarif::class);
	}

	public function rooms(){
    	return $this->hasMany(App\Room::class);
    }
}
