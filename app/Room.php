<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Room extends Model
{
	public function elder_rooms(){
		return $this->hasMany(App\Elder_room::class);
	}
}
