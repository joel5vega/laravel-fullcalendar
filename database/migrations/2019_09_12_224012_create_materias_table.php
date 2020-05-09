<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMateriasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('materias', function (Blueprint $table) {
            $table->increments('id');
            $table->string('sigla');
            $table->string('nombre');
            $table->string('tipo');
            $table->string('semestre');
            $table->string('control')->nullable();;
            $table->string('telecomunicaciones')->nullable();;
            $table->string('sistemas')->nullable();
            $table->string('requisito')->nullable();            
            $table->string('pensum');
            $table->string('nivel');
            $table->string('paralelo');
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
        Schema::dropIfExists('materias');
    }
}
