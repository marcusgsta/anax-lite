<?php

namespace Mag\Calendar;

class Calendar
{
    public $html = "";
    public $image = "";
    public $nrOfDays = [];
    public $months = [];
    public $month = [];
    public $currentMonth = "";
    public $title = "";
    public $weekDay = "";
    public $images = [
        'january.jpg',
        'february.jpg',
        'march.jpg',
        'april.jpg',
        'may.jpg',
        'june.jpg',
        'july.jpg',
        'august.jpg',
        'september.jpg',
        'october.jpg',
        'november.jpg',
        'december.jpg'
    ];
    /**
    * Constructor
    * @return void
    */
    public function __construct()
    {
        // $info = cal_info(0);
        // print_r($info);
        // print_r($info['months']);
        // $days = cal_days_in_month(CAL_GREGORIAN, 2, 2017);
        // print_r($days);
        // return $this->getMonth();
    }

    /**
    * Create html for calendar
    * @return $html
    */
    public function createCalendar()
    {
        // $this->html = "A calendar";
        // return $this->html;
    }

    public function getWeek()
    {
        $week = new Week;
        return $week->createHeadings();
    }

    public function getMonth()
    {
        $month = new Month;
        $this->nrOfDays = $month->getNrOfDays();
    }

    public function setCurrentMonth()
    {
        $this->currentMonth = date('n');
        return $this->currentMonth;
    }

    public function setWeekDay($monthNum)
    {
        $this->weekDay = date('w', mktime(0, 0, 0, $monthNum, 1, 2017));
        return $this->weekDay;
    }


    public function getTitle()
    {
        $this->title = date('F Y');
        return $this->title;
    }

    public function setTitle($monthNum)
    {
        $monthName = date('F', mktime(0, 0, 0, $monthNum, 10));
        $this->title = $monthName . date(' Y');
        return $this->title;
    }

    public function getNextMonth()
    {
        if (isset($_GET['month'])) {
            $nextMonth = $_GET['month'] + 1;
        } else {
            $nextMonth = $this->currentMonth + 1;
        }

        if ($nextMonth == 13) {
            return false;
        }

        $link = "<div class='next'><a href='?month=$nextMonth'>Next --></a></div>";
        return $link;
    }

    public function getPreviousMonth()
    {
        if (isset($_GET['month'])) {
            $prevMonth = $_GET['month'] - 1;
        } else {
            $prevMonth = $this->currentMonth - 1;
        }

        if ($prevMonth == 0) {
            return false;
        }

        $link = "<div class='prev'><a href='?month=$prevMonth'><-- Previous</a></div>";
        return $link;
    }

    public function getPreviousMonthNum()
    {
        if (isset($_GET['month'])) {
            $prevMonth = $_GET['month'] - 2;
        } else {
            $prevMonth = $this->currentMonth - 2;
        }
        return $prevMonth;
    }


    public function getImage($month)
    {
        $month = $this->images[$month];
        $image = "<img class='calendar' src='image/$month' alt='$month'>";
        // $image = "<img class='calendar' src='image/car.png' alt=''>";
        return $image;
    }



    public function fixStrayDays($startDay, $prevMonth)
    {

        $strayDays = $startDay - 1;
        // Check if $startDay = 0 (sunday)
        // and if so, change to include 6 straydays
        if ($strayDays == -1) {
            $strayDays = 6;
        }

        if ($prevMonth == -1) {
            $prevMonth = 11;
        }
        $prevMonthArray = $this->nrOfDays[$prevMonth];
        $strayArray = array_slice($prevMonthArray, -$strayDays);
        $html = "";
        // $html = "<div class='strayDays'>";
        for ($i = 0; $i < $strayDays; $i++) {
            $html .= "<div class='day strayDay'>$strayArray[$i]</div>";
        }
        // $html .= "</div>";

        return $html;
    }
}
