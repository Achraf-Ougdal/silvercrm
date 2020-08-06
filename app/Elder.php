<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Elder extends Model
{

	use SoftDeletes;

   protected $dates = ['deleted_at'];

   
    public function residence(){
        return $this->belongsTo(App\Residence::class);
    }

    public function elder_rooms(){
    	return $this->belongsTo(App\Elder_room::class);
    }

}
