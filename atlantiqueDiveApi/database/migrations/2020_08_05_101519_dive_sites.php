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
            $table->string('description',5000);
            $table->float('lat');
            $table->float('lng');
            $table->integer('depth');
            $table->string('visibility')->nullable();
            $table->string('current')->nullable();
            $table->string('pathtopicture')->nullable();
            $table->boolean('verified');
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
