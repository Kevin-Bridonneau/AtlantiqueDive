<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Presence extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::disableForeignKeyConstraints();
        Schema::create('presence', function (Blueprint $table) {
            $table->id();
            $table->integer('dive_id');
            $table->integer('club_id');
            $table->foreign('dive_id')
            ->references('id')
            ->on('divesites')
            ->onDelete('restrict')
            ->onUpdate('restrict');
            $table->foreign('club_id')
            ->references('id')
            ->on('users')
            ->onDelete('restrict')
            ->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('presence');
    }
}
