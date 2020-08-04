<?php

use Illuminate\Database\Seeder;
use App\Todo;

class TodoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(Todo::class, 50)->create();
    }
}
