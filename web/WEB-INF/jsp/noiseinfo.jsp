<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="initial-scale=1.0">
        <meta charset="utf-8">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://files.codepedia.info/files/uploads/iScripts/html2canvas.js"></script>
        <title>Live Data</title>
    </head>

    <body class="bodypage" id="body">
        
        <style>
            .bodypage
            {
                margin-top: -40px;
                margin-left: 0px;
            }
            

        </style>


        <div id="html-content-holder" style="width:1920px;">
            
            
            <p  style="height:64px; width:1920px; background:black  ; color:cyan; font-size:40px; text-align: center; margin-bottom: 0px;">
                <img style="vertical-align:middle"src="/images/stop.png" height="64" width="64">
                <a style=" color:red;"> Be the part of SOLUTION, NOT the part of POLLUTION </a>
                <img style="vertical-align:middle"src="/images/stop.png" height="64" width="64">
                <a> The Noise of different areas in Solapur city : </a>
               </p>

            <p  style="height:64px; width:1920px; background:black  ; color:cyan; font-size:40px; text-align: center; margin-top: 0px; margin-bottom: 0px;">
                <img style="vertical-align:middle"src="/images/img03.png" height="64" width="64">
                <a id="demo21"></a>
                <img style="vertical-align:middle"src="/images/img03.png" height="64" width="64">
                <a id="demo22"></a>
                <img style="vertical-align:middle"src="/images/img03.png" height="64" width="64">
                <a id="demo23"></a>
                <img style="vertical-align:middle"src="/images/img03.png" height="64" width="64">
                <a id="demo24"></a>
                <img style="vertical-align:middle"src="/images/img03.png" height="64" width="64">
            </p>

            <p  style="height:64px; width:1920px; background:black  ; color:cyan; font-size:40px; text-align: center; margin-top: 0px; margin-bottom: 0px;">
                <img style="vertical-align:middle"src="/images/noise1.jpg" height="64" width="150">
                <a style=" color:red;">KEEP CALM and SAVE YOUR EARS</a>
                <img style="vertical-align:middle"src="/images/stop.png" height="64" width="64">
                <a style=" color:red;"> Noise Pollution - If you don't kill IT, It will kill You</a>
                <img style="vertical-align:middle"src="/images/noise1.jpg" height="64" width="150">
            </p>

            <p  style="height:64px; width:1920px; background:black  ; color:cyan; font-size:40px; text-align: center;margin-top: 0px; margin-bottom: 0px;">
                <img style="vertical-align:middle"src="/images/img03.png" height="64" width="64">
                <a id="demo41"></a>
                <img style="vertical-align:middle"src="/images/img03.png" height="64" width="64">
                <a id="demo42"></a>
                <img style="vertical-align:middle"src="/images/img03.png" height="64" width="64">
                <a id="demo43"></a>
                <img style="vertical-align:middle"src="/images/img03.png" height="64" width="64">
                <a id="demo44"></a>
                <img style="vertical-align:middle"src="/images/img03.png" height="64" width="64">
            </p>

            <p  style="height:64px; width:1920px; background:black  ; color:cyan; font-size:40px; text-align: center;margin-top: 0px; margin-bottom: 0px;">
               <img style="vertical-align:middle"src="/images/stop.png" height="64" width="64">
                <a style=" color:red;"> Be the part of SOLUTION, NOT the part of POLLUTION </a>
                <img style="vertical-align:middle"src="/images/stop.png" height="64" width="64">
                <a> The Noise level of different areas in Solapur city : </a>
            </p>

            <p  style="height:64px; width:1920px; background:black  ; color:cyan; font-size:40px; text-align: center; margin-top:0px;">
                <img style="vertical-align:middle"src="/images/img03.png" height="64" width="64">
                 <a id="demo61"></a>
                <img style="vertical-align:middle"src="/images/img03.png" height="64" width="64">
                <a id="demo62"></a>
                <img style="vertical-align:middle"src="/images/img03.png" height="64" width="64">
                <a id="demo63"></a>
                <img style="vertical-align:middle"src="/images/img03.png" height="64" width="64">
                <a id="demo64"></a>
                <img style="vertical-align:middle"src="/images/img03.png" height="64" width="64">
            </p>
        </div>

        <style>
            .btn-info{

                background-color: #007FFF;
                border: 1px solid white;
                border-radius: 4px;
                box-shadow: black 3px 3px 6px;
                color: white;
                padding: 8px 22px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                cursor: pointer;
            }
        </style>
        <div>

            <button id="btnFullscreen" type="button" class="btn btn-info" onclick="full();">Full Screen</button>

        </div>
        

        
        <script>
           
            function full(){
             var elem = document.documentElement;
            if (elem.requestFullscreen) {
            elem.requestFullscreen();
            } else if (elem.mozRequestFullScreen) { /* Firefox */
            elem.mozRequestFullScreen();
            } else if (elem.webkitRequestFullscreen) { /* Chrome, Safari & Opera */
            elem.webkitRequestFullscreen();
            } else if (elem.msRequestFullscreen) { /* IE/Edge */
            elem.msRequestFullscreen();
            }
            }
            showLiveData();
            var myVar = setInterval(showLiveData, 60000);
            function p_avg(data) {
                let sum = 0;
                let count = 0;
                let average = 0;
                for (let i of JSON.parse(data))
                {
                    sum = sum + i.noiselevel;
                    count = count + 1;
                }
                average = Math.round(sum / count);
                if (average > 0) {
                    return average;
                } else {
                    return 0;
                }

            }

            function avg(data) {
                let sum = 0;
                let count = 0;
                let average = 0;
                for (let i of JSON.parse(data))
                {
                    var today = new Date();
                    var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + (today.getDate());
                    var time1 = (today.getHours() - 1) + ":" + today.getMinutes() + ":" + today.getSeconds();
                    var dateTime_from = date + ' ' + time1;
                    let d1 = new Date(i.datetime);
                    let d2 = new Date(dateTime_from);
                    if (d1 > d2) {
                        console.log(d1);
                        sum = sum + i.noiselevel;
                        count = count + 1;
                    }
                }
                average = Math.round(sum / count);
                if (average > 0) {
                    return average;
                } else {
                    return 0;
                }

            }

            function showLiveData() {
              
                var today = new Date();
                var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + (today.getDate());
                var date2 = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + (today.getDate() + 1);
                var time1 = (today.getHours() - 1) + ":" + today.getMinutes() + ":" + today.getSeconds();
                var time2 = (today.getHours()) + ":" + today.getMinutes() + ":" + today.getSeconds();
                var dateTime_from = date + ' ' + time1;
                var dateTime_to = date2 + ' ' + time2;
                var pattern_time = (today.getHours()).toString();
                let noise = 0;
               
                let url_1 = "/query.htm?status=1&long_from=75.905381&long_to=75.909381&lat_from=17.663354&lat_to=17.667354&pattern_time=" + pattern_time + "&dateTime_from=" + dateTime_from + "&dateTime_to=" + dateTime_to;

                //let url_1 = "/query.htm?status=1&long_from=75.805381&long_to=75.999381&lat_from=17.653354&lat_to=17.707354&pattern_time="+pattern_time+"&dateTime_from="+dateTime_from+"&dateTime_to="+dateTime_to;

                $.ajax({url: url_1, success: function (result) {
                        console.log("url_1", url_1);
                        console.log(result);
                        noise = avg(result);

                        if (noise > 0) {
                            document.getElementById("demo21").innerHTML = "Rang Bhavan :" + noise + "dB";
                            document.getElementById("demo41").innerHTML = "Rang Bhavan :" + noise + "dB";
                            document.getElementById("demo61").innerHTML = "Rang Bhavan :" + noise + "dB";
                        } else {
                            url_1 = "/query.htm?status=2&long_from=75.905381&long_to=75.909381&lat_from=17.663354&lat_to=17.667354&pattern_time=" + pattern_time + "&dateTime_from=" + dateTime_from + "&dateTime_to=" + dateTime_to;

                            $.ajax({url: url_1, success: function (result) {
                                    console.log("url_1", url_1);
                                    console.log(result);
                                    noise = p_avg(result);


                                    document.getElementById("demo21").innerHTML = "Rang Bhavan :" + noise + "dB";
                                    document.getElementById("demo41").innerHTML = "Rang Bhavan :" + noise + "dB";
                                    document.getElementById("demo61").innerHTML = "Rang Bhavan :" + noise + "dB";

                                }});
                        }
                    }});

                let url_2 = "/query.htm?status=1&long_from=75.903800&long_to=75.907800&lat_from=17.656967&lat_to=17.660967&pattern_time=" + pattern_time + "&dateTime_from=" + dateTime_from + "&dateTime_to=" + dateTime_to;

                $.ajax({url: url_2, success: function (result) {
                        console.log("url_2", url_2);
                        console.log(result);
                        noise = avg(result);
                        if (noise > 0) {
                            document.getElementById("demo22").innerHTML = "Saat Rasta :" + noise + "dB";
                            document.getElementById("demo42").innerHTML = "Saat Rasta :" + noise + "dB";
                            document.getElementById("demo62").innerHTML = "Saat Rasta :" + noise + "dB";
                        } else {
                            url_2 = "/query.htm?status=2&long_from=75.903800&long_to=75.907800&lat_from=17.656967&lat_to=17.660967&pattern_time=" + pattern_time + "&dateTime_from=" + dateTime_from + "&dateTime_to=" + dateTime_to;

                            $.ajax({url: url_2, success: function (result) {
                                    console.log("url_2", url_2);
                                    console.log(result);
                                    noise = p_avg(result);
                                    document.getElementById("demo22").innerHTML = "Saat Rasta :" + noise + "dB";
                                    document.getElementById("demo42").innerHTML = "Saat Rasta :" + noise + "dB";
                                    document.getElementById("demo62").innerHTML = "Saat Rasta :" + noise + "dB";

                                }});
                        }
                    }});

                let url_3 = "/query.htm?status=1&long_from=75.891577&long_to=75.895577&lat_from=17.662599&lat_to=17.666599&pattern_time=" + pattern_time + "&dateTime_from=" + dateTime_from + "&dateTime_to=" + dateTime_to;

                $.ajax({url: url_3, success: function (result) {
                        console.log("url_3", url_3);
                        console.log(result);
                        noise = avg(result);
                        if (noise > 0) {
                            document.getElementById("demo23").innerHTML = "Solapur Railway Station :" + noise + "dB";
                            document.getElementById("demo43").innerHTML = "Solapur Railway Station :" + noise + "dB";
                            document.getElementById("demo63").innerHTML = "Solapur Railway Station :" + noise + "dB";
                        } else {
                            url_3 = "/query.htm?status=2&long_from=75.891577&long_to=75.895577&lat_from=17.662599&lat_to=17.666599&pattern_time=" + pattern_time + "&dateTime_from=" + dateTime_from + "&dateTime_to=" + dateTime_to;

                            $.ajax({url: url_3, success: function (result) {
                                    console.log("url_3", url_3);
                                    console.log(result);
                                    noise = p_avg(result);
                                    document.getElementById("demo23").innerHTML = "Solapur Railway Station :" + noise + "dB";
                                    document.getElementById("demo43").innerHTML = "Solapur Railway Station :" + noise + "dB";
                                    document.getElementById("demo63").innerHTML = "Solapur Railway Station :" + noise + "dB";

                                }});
                        }
                    }});

                let url_4 = "/query.htm?status=1&long_from=75.896730&long_to=75.900730&lat_from=17.677608&lat_to=17.681608&pattern_time=" + pattern_time + "&dateTime_from=" + dateTime_from + "&dateTime_to=" + dateTime_to;

                $.ajax({url: url_4, success: function (result) {
                        console.log("url_4", url_4);
                        console.log(result);
                        noise = avg(result);
                        if (noise > 0) {
                            document.getElementById("demo24").innerHTML = "Central Bus Stand :" + noise + "dB";
                            document.getElementById("demo44").innerHTML = "Central Bus Stand :" + noise + "dB";
                            document.getElementById("demo64").innerHTML = "Central Bus Stand :" + noise + "dB";
                        } else {
                            url_4 = "/query.htm?status=2&long_from=75.896730&long_to=75.900730&lat_from=17.677608&lat_to=17.681608&pattern_time=" + pattern_time + "&dateTime_from=" + dateTime_from + "&dateTime_to=" + dateTime_to;

                            $.ajax({url: url_4, success: function (result) {
                                    console.log("url_4", url_4);
                                    console.log(result);
                                    noise = p_avg(result);
                                    document.getElementById("demo24").innerHTML = "Central Bus Stand :" + noise + "dB";
                                    document.getElementById("demo44").innerHTML = "Central Bus Stand :" + noise + "dB";
                                    document.getElementById("demo64").innerHTML = "Central Bus Stand :" + noise + "dB";

                                }});
                        }

                    }});
           
    }
        </script>
    </body>
</html>
