<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Todo;
use App\User;
use Faker\Generator as Faker;

$factory->define(Todo::class, function (Faker $faker) {
    return [
        'body' => $faker->sentence($nbWords=6, $variableNbWords=true),
        'user_id' => $faker->numberBetween($min=1, $max=3)
    ];
});