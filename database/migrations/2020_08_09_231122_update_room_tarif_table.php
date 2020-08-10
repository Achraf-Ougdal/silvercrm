<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateRoomTarifTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::table('room_tarif', function (Blueprint $table) {
            
            $table->foreign('room_id')->references('id')->on('rooms');
            $table->foreign('category_id')->references('id')->on('room_categories');
            $table->foreign('residence_id')->references('id')->on('residences');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
