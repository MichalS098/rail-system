<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;

class Ticket extends Pivot
{    
    protected $table = 'passenger_train';
}
