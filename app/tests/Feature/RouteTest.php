<?php

namespace Tests\Feature;

use App\Models\City;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class RouteTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function test_distance_between_cities(): void
    {
        City::create([
            'name' => 'Moscow',
            'latitude' => 55.7558,
            'longitude' => 37.6173,
        ]);

        City::create([
            'name' => 'Saint Petersburg',
            'latitude' => 59.9343,
            'longitude' => 30.3351,
        ]);

        
    }
}
