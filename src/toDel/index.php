<?php
    /**
     * Takes an Excel file name, and creates its equivalent csv file
     * 
     * @param string $filename The name of the Excel file.
     */
    function excelToCsv($filename)  {

        require_once 'Classes/PHPExcel.php';
        //ini_set('memory_limit', '1000M');

        
        try { // Try reading the excel file
            $fileType=PHPExcel_IOFactory::identify($filename);
            $objReader = PHPExcel_IOFactory::createReader($fileType);
            $objReader->setReadDataOnly(true);   
            $objPHPExcel = $objReader->load($filename);
        } catch (\Throwable $th) {
            die("Could't Open the file $filename for reading!");
        }

        try { // Try creating and writing into a csv holding the same_name.csv
            $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'CSV');
            $csv_name =  explode('.', $filename)[0] . '.csv';
            $objWriter->save($csv_name);
        } catch (\Throwable $th) {
            die("Could't Open the file $csv_name for writing!");
        }

        return $csv_name;
    }
    
    
    function CsvToSqlTable($csv_filename) { 
        $filename = explode('.', $csv_filename)[0];

        // Connecting to the PDO
        $conn = new \PDO('mysql:host=localhost;dbname=OCP', 'pixel', '1234');
        
        // Creating the SQL Query for creating the table
        $fd = fopen($csv_filename, 'r') or die('Cannot open file for reading:  '.$csv_filename);
        $header_line = fgets($fd);
        $header_array = explode(',', $header_line);

        // The CREATE TABLE query
        $columns='';
        foreach ($header_array as $column) {
            $columns .= $column.' VARCHAR(200),';
        } $columns = rtrim($columns, ','); 

        $SQL_create_table = <<<EOF
            CREATE TABLE $filename (
                $columns
            )
EOF;
$stmt = $pdo->prepare($SQL_create_table);
$stmt->execute();

        // The seeding query
        $SQL_load_data = <<<EOF
            LOAD DATA INFILE $csv_filename
            INTO TABLE $filename
            FIELDS TERMINATED BY ','
            OPTIONALLY ENCLOSED BY '"' 
            LINES TERMINATED BY '\n'
            IGNORE 1 LINES 
EOF;
$stmt = $pdo->prepare($SQL_load_data);
$stmt->execute();
    
        echo "done";//"$SQL_create_table |||\n $query";
    }
    CsvToSqlTable('Sample.csv');
//    excelToCsv("Sample.xlsx");