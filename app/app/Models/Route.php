<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Route extends Model
{
    use HasFactory;

    public function cities()
    {
        return $this->belongsToMany(City::class);
    }

    public function schedules()
    {
        return $this->hasMany(Schedule::class);
    }


    // TODO: DOKONCZ TO PRZENIES TO DO SERVICECLASS
    public static function distanceBetweenCitiesKM(City $first, City $second): float
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

        return $angle * $earthRadiusKm;
    }
}
