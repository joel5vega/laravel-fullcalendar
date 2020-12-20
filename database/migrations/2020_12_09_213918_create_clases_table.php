<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;


class CreateClasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('clases', function (Blueprint $table) {
             
            $table->increments('id');
            $table->unsignedInteger('materia_id');
            $table->foreign('materia_id')->references('id')->on('materias');
            $table->unsignedInteger('responsable_id')->default('0');
            $table->foreign('responsable_id')->references('id')->on('responsables');
            $table->unsignedInteger('ambiente_id');
            $table->foreign('ambiente_id')->references('id')->on('ambientes');
            $table->unsignedInteger('periodo_id');
            $table->foreign('periodo_id')->references('id')->on('periodos');
            $table->string('dia'); //  dia que se repite
            $table->string('hora_ini'); //hora de inicio
            $table->string('hora_fin'); // hora de final
            $table->string('color');
            $table->string('nivel'); // 
            $table->string('paralelo',10); 
            $table->unsignedInteger('estado')->default(0); // 
            //esta linea permite el borrado logico pero no de todo
            $table->softDeletes();
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
        Schema::dropIfExists('clases');
    }
}
