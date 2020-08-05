<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Elder extends Model
{
    public function residence(){
        return $this->belongsTo(App\Residence::class);
    }

    public function elder_rooms(){
    	return $this->belongsTo(App\Elder_room::class);
    }

}
