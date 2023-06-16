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
}
