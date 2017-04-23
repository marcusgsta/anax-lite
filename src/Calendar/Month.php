<?php

namespace Mag\Calendar;

class Month
{
    public $html = "";
    // public $days = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
    //                 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
    //                 21, 22, 23, 24, 25, 26, 28, 29, 30, 31];

    private $nrOfDays = [];
    // public $months = {
    //     "january" : 31,
    //     "february" : 28,
    //     "march" : 31
    //
    //
    // };
    /**
    * Constructor
    * @return void
    */
    public function __construct()
    {
        // return $this->createSlots();
    }


    public function getNrOfDays()
    {
        for ($i = 1; $i < 13; $i ++) {
            $days = cal_days_in_month(CAL_GREGORIAN, $i, 2017);
            $monthArray = [];

            for ($x = 1; $x <= $days; $x++) {
                // array_push($monthArray, "<div class='day'>$x</div>");
                array_push($monthArray, $x);
            }

            array_push($this->nrOfDays, $monthArray);
        }
        return $this->nrOfDays;
    }
}
