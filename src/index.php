<?php
    /** Including the Blade templating engine */
    include "BladeTemp/lib/BladeOne.php";
    use eftec\bladeone;
    $views = __DIR__ . '/V/views';              // folder where the templates are located
    $compiledFolder = __DIR__ . '/V/cashed_views'; // folder where the cached templates are tocated
    $blade=new bladeone\BladeOne($views,$compiledFolder);


    /** The Years we are going to be using */
    $years = array('1990', '1991', '1992', '1993', '1994', '1995', '1996', '1997', '1998', '1999',
                   '2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009',
                   '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019');

    $geolocations = array('Geolocation01', 'Geolocation02', 'Geolocation03', 'Geolocation04', 'Geolocation05'
                          , 'Geolocation06', 'Geolocation07', 'Geolocation08', 'Geolocation09', 'Geolocation10');

    
    // Filling the body of the tables with dummy data #cpc
    foreach ($geolocations as $geolocation) {
        // Filling the cpc of some available years
        for ($i=0, $limit=rand(0,sizeof($years) - 1) ; $i <= $limit ; $i++) { 
            $table_rows[$geolocation][$years[$i]]= 'cpc';
        }
    }


    echo $blade->run("table", ['years' => $years ,'table_rows' => $table_rows,'change' =>  'OCP Logo here']);