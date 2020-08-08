<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateElderRoomsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('elder_rooms', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('room_id');
            $table->unsignedInteger('elder_id');
            $table->unsignedInteger('tarif')->nullable();
            $table->float('prix');
            $table->date('date_start');
            $table->date('date_fin')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('elder_rooms');
    }
}
