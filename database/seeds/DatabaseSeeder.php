<?php
namespace Database\Seeders;
use App\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // factory(User::class,7)->create();
        User::create([
            'name'=>'Joel ',
            'email'=>'admin@mail',
            'password'=>bcrypt('p4ss')
        ]);
        // $this->call(ResponsablesTableSeeder::class);
    }
}
