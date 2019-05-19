<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Main page</title>
    <link rel="stylesheet" href="V/assets/css/style.css">
    <script type="text/javascript" src="V/assets/js/tableScripts.js"></script>
</head>
<body>
    <h1>{{$change}}</h1>
    <table>
        <thead>
            <th>Geolocations</th>
            @foreach ($years as $year)
            <th class="expandable">{{$year}}</th>
            @endforeach
        </thead>

        <tbody>
            @foreach($table_rows as $key_geolocation => $row)
                <tr>    
                    <th class="expandable">{{$key_geolocation}}</th>   
                    @foreach ($years as $year)
                        <td> {{$row[$year]}} </td>
                    @endforeach
                </tr>
            @endforeach
        </tbody>
    </table> 
</body>
</html>