<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateElderRoomsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
         Schema::table('elder_rooms', function (Blueprint $table) {
            
            $table->dropColumn('tarif');
            $table->string('contratSejour')->after('elder_id');
            $table->string('typeSejour')->after('elder_id');
            $table->string('titleSejour')->after('elder_id');

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
