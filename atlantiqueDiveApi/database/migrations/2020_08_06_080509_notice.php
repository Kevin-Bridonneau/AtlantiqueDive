<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Notice extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::disableForeignKeyConstraints();
        Schema::create('notice', function (Blueprint $table) {
            $table->id();
            $table->integer('dive_id');
            $table->integer('user_id');
            $table->timestamp('created_at');
            $table->string('msg');
            $table->integer('rate');
            $table->foreign('dive_id')
            ->references('id')
            ->on('divesites')
            ->onDelete('restrict')
            ->onUpdate('restrict');
            $table->foreign('user_id')
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
        Schema::dropIfExists('notice');
    }
}
