<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Train extends Model
{
    use HasFactory;

    public function carrier()
    {
        return $this->belongsTo(Carrier::class);
    }

    public function schedule()
    {
        return $this->hasOne(Schedule::class);
    }

    public function tickets()
    {
        return $this->hasMany(Ticket::class);
    }
}
