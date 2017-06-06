<?php
/**
*   Week class
*/
namespace Mag\Calendar;

/**
*   Week class
*   @var string $html   html output
*   @var string $headings html for headings
*/
class Week
{
    public $html = "";
    public $headings = "";

    /**
    * Constructor
    * @return void
    */
    public function __construct()
    {
        $this->createHeadings();
        $this->createWeek();
    }

    /**
    * Create month
    * @return $html
    */
    public function createWeek()
    {
        $this->html .= "<tr class='week'><td>Day</td><td>Day</td>
                        <td>Day</td><td>Day</td><td>Day</td>
                        <td>Day</td><td class='holiday'>Day</td></tr>";

        return $this->html;
    }

    /**
    * Create headings
    * @return string $html  html code for headings
    */
    public function createHeadings()
    {
        $this->headings = "<div class='headings'><div>Mon</div><div>Tue</div>
                        <div>Wed</div><div>Thu</div>
                        <div>Fri</div><div>Sat</div>
                        <div>Sun</div></div>";

        return $this->headings;
    }
}
