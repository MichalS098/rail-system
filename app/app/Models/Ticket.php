<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;

class Ticket extends Pivot
{    
    protected $table = 'passenger_train';

    public function passenger()
    {
        return $this->belongsTo(Passenger::class);
    }

    public function train()
    {
        return $this->belongsTo(Train::class);
    }
}
