<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App;


class Elder extends Model
{

	use SoftDeletes;

   protected $dates = ['deleted_at'];

   
    public function residence(){
        return $this->belongsTo(App\Residence::class);
    }

    public function elder_rooms(){
    	return $this->hasOne(App\Elder_room::class);
    }

}
