<?php

use Illuminate\Database\Seeder;
use App\Responsable;
use App\Pensum;
use Faker\Factory as Faker;
use App\User;
use App\Clase;

class ResponsablesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        /*
        //Solo se debe correr una vez para evitar duplicados
        // Pensum::truncate();
        $pensum = new Pensum();
        $pensum->nombre = "Pensum 2000";
        $pensum->descripcion = "Pensum actual";
        $pensum->save();
        
        // Responsables
        $faker = Faker::create('es_ES');
        for ($i = 0; $i < 20; $i++) {
            $responsable = new Responsable();
            $responsable->nombre = $faker->firstName;
            $responsable->ap_paterno = $faker->lastName;
            $responsable->ap_materno = $faker->lastName;
            $responsable->puesto = $faker->randomElement(['docente', 'auxiliar']); // Docente o auxiliar
            $responsable->titulo = $faker->randomElement(['Ing.', 'Lic.', 'MSc.', 'PhD']); //ing o lic
            $responsable->descripcion = $faker->sentence;
            $responsable->save();
        }
        
        $webmaster= new User();
        $webmaster->name="Joel";
        $webmaster->email="joel5vega@gmail.com";
        $webmaster->password=bcrypt('p4ss');
        $webmaster->tipo="webmaster";
        $webmaster->estado=1;
        $webmaster->save();
        
        //clases
        for ($i = 0; $i < 50; $i++){
            $time=$faker->time($format = 'H:i',$min = "07:00",$max = "18:00");
            $time2=$faker->time($format = 'H:i',$min = $time,$max="20:00");
            $clase = new Clase();
            $clase->materia_id=$faker->numberBetween(1,95);
            $clase->responsable_id=$faker->numberBetween(1,20);
            $clase->ambiente_id=$faker->numberBetween(1,12);
            $clase->periodo_id="4";
            $clase->dia=$faker->numberBetween(1,5);
            $clase->hora_ini=$time;
            $clase->hora_fin=$time2;
            $clase->color=$faker->hexColor;
            $clase->nivel= $faker->randomElement(['auxiliatura', 'docencia']);
            $clase->paralelo= $faker->randomElement(['A', 'B']);
            $clase->save();
        }
        */
    }
}
