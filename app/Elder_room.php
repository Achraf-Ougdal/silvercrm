<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Elder_room extends Model
{
    //
    public function rooms(){
    	return $this->hasMany(App\Room::class);
    }

    public function elders(){
    	return $this->hasMany(App\Elder::class);
    }
}
