<?php

namespace App\Services;

use App\Models\City;

class CityService
{
    public static function distanceBetweenCitiesMeters(City $first, City $second): float
    {
        $earthRadiusKm = 6371;

        $latFrom = deg2rad($first->latitude);
        $lonFrom = deg2rad($first->longitude);
        $latTo = deg2rad($second->latitude);
        $lonTo = deg2rad($second->longitude);

        $latDelta = $latTo - $latFrom;
        $lonDelta = $lonTo - $lonFrom;

        $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) +
            cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));

        return $angle * $earthRadiusKm * 1000;
    }
}
