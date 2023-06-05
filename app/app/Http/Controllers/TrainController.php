<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class TrainController extends Controller
{
    public function check(Request $request)
    {        
        $request->validate([
            'dateTime' => 'required|date_format:Y-m-d\TH:i',
            'from' => 'required|string',
            'to' => 'required|string',            
        ]);

        $dateTime = $request->input('dateTime');
        $from = $request->input('from');
        $to = $request->input('to');

        // // 
        // return 
        // return test success
     

        return back()->with('success', 'Train is available');
    }
}
