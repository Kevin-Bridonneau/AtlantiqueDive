<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class DiveSites extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('divesites', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('description');
            $table->string('gps');
            $table->integer('depth');
            $table->string('visibility')->nullable();
            $table->string('current')->nullable();
            $table->string('pathToPicture')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('divesites');
    }
}
