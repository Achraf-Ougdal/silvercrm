<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App;

class Residence extends Model
{
    public function rooms(){
    	return $this->hasMany(App\Room::class);
    }
}
