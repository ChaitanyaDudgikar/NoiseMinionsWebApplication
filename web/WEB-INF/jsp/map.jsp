<!DOCTYPE html>
<html>
    <head>
        <title>Heatmap-Noise Minions</title>
        <meta name="viewport" content="initial-scale=1.0">
        <meta charset="utf-8">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



        <style>
            /* Always set the map height explicitly to define the size of the div
             * element that contains the map. */
            #maincontainer
            {
                position: relative;
                height: 100%;
                width: 100%;
            }
            #map {
                left: 0;
                top: 0;
                position: absolute;
                height: calc(100%);
                width: 100%;
            }
            /* Optional: Makes the sample page fill the window. */
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            #sliders
            {
                padding: 15px;
                position: absolute;
                left: 10%;
                top: 62%;
                background: #FFFFFF;
                border: 1px solid white;
                border-radius: 4px;
                width: 80%;
                box-shadow: black 5px 5px 10px;
            }

            .hidden-sliders
            {

                top: 89% !important;
                left: 0% !important;
                height: 26px;
                overflow: hidden;
                background: rgba(255,255,255,0.0) !important;
                border: none !important;
                box-shadow: none !important;
                width: 6% !important;
            }

            .slider-container > label
            {

                width: 100px;
                display: inline-block;
            }

            .slider-gap
            {
                height: 5px;
                display: block;
            }

            .slider-container
            {

                margin-top: 5px;
                margin-bottom: 5px;
            }

        </style>
    </head>
    <body>
        <div id="maincontainer">



            <div id="map">

            </div>
            <script>
                var map;
                var currentheatmap;
                var overlay;
                var lastTimeout;
                var querymode = 'pattern';

                function initMap() {
                    map = new google.maps.Map(document.getElementById('map'), {
                        center: {lat: 17.60, lng: 75.90},
                        zoom: 12.5
                    });


                    //let USGSOverlay={};



                    var bounds = new google.maps.LatLngBounds(
                            new google.maps.LatLng(17.66, 75.90),
                            new google.maps.LatLng(17.67, 75.91));

                    // The photograph is courtesy of the U.S. Geological Survey.
                    var srcImage = 'https://developers.google.com/maps/documentation/javascript/';
                    srcImage += 'examples/full/images/talkeetna.png';





                    var solapur = new google.maps.LatLng(17.677383, 75.908670);

                    map = new google.maps.Map(document.getElementById('map'), {
                        center: solapur,
                        zoom: 13,
                        minZoom: 3,
                        maxZoom: 19
                                //  mapTypeId: 'satellite'
                    });

                    google.maps.event.addListener(map, 'bounds_changed', function () {
                        //                    console.log('clearingtimeout',lasttimeout);
                        clearTimeout(lastTimeout);
                        lastTimeout = window.setTimeout(function () {

                            onSliderChange();
                        }, 500);
                        //                    console.log('timeout',lasttimeout);
                    });

                }

                function showHeatMap(data)
                {
                    if (currentheatmap)
                    {
                        currentheatmap.setMap(null);
                    }

                    var heatMapData = [];

                    let minlevel = 30;
                    let maxlevel = 60;
                    let sum=0;
                    let count=0;
                   // heatMapData.push({location: new google.maps.LatLng(18.18, 77.77), weight: 0});
                    //heatMapData.push({location: new google.maps.LatLng(18.20, 77.80), weight: 200});
                    for (let i of JSON.parse(data))
                    {
                        console.log("i", i, (i.noiselevel - minlevel) / (maxlevel - minlevel));
                        let weight = i.noiselevel;//Math.pow(10, i.noiselevel / 20.0);
                        sum=sum+i.noiselevel;
                        count=count+1;
                        console.log("weight", weight);
                        heatMapData.push({location: new google.maps.LatLng(i.latitudeNoise, i.longitudeNoise), weight: weight});
                    }
                    console.log("final "+sum/count);
                    let zoom = map.getZoom();
                    console.log("zoom", zoom);

                    var heatmap = new google.maps.visualization.HeatmapLayer({
                        data: heatMapData,
                        dissipating: true,
                        radius: Math.pow(1.25, zoom)
                    });
                    heatmap.setMap(map);
                    currentheatmap = heatmap;
                }

            </script>

            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhSS8DRRGPseUed7KQZtv2nrZueQz35GU&callback=initMap&libraries=visualization" async defer></script>



            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
            <link rel="stylesheet" href="/resources/demos/style.css">
            <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
            <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
            <script>

                let DAYS = ['NA', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
                let MONTHS = ['NA', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                let DATE = ['NA', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31'];
                let TIME = ['NA', '00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23'];
               
                let month = 0;
                let date = 0;
                let day = 0;
                let time = -1;
                let month2 = 1;
                let date2 = 1;
                let time2 = 0;
                let year = 2019;
                //DOW
                $(function () {

                    $("#tabs").tabs();

                    $("#slider_dow").slider({
                        value: 0, min: 0, max: 7, step: 1,
                        slide: function (event, ui) {
                            $("#text_dow").val(DAYS[ui.value]);
                            day = ui.value;

                            onSliderChange();
                            $("#slider_date").slider('value', 0);
                            $("#text_date").val(DATE[0]);
                            date = 0;
                        }
                    });
                    $("#text_dow").val(DAYS[ $("#slider_dow").slider("value")]);
                });
                //DATE
                $(function () {
                    $("#slider_date").slider({
                        value: 0, min: 0, max: 31, step: 1,
                        slide: function (event, ui) {
                            $("#text_date").val(DATE[ui.value]);
                            date = ui.value;

                            onSliderChange();
                            $("#slider_dow").slider('value', 0);
                            $("#text_dow").val(DAYS[0])
                            day = 0;


                        }
                    });
                    $("#text_date").val(DATE[ $("#slider_date").slider("value")]);
                });
                //TIME
                $(function () {
                    $("#slider_time").slider({
                        value: 0, min: 0, max: 24, step: 1,
                        slide: function (event, ui) {
                            $("#text_time").val(TIME[ui.value]);

                            time = ui.value - 1;

                            onSliderChange();

                        }
                    });
                    $("#text_time").val(TIME[ $("#slider_time").slider("value")]);
                });
                //MONTH
                $(function () {
                    $("#slider_m").slider({
                        value: 0, min: 0, max: 12, step: 1,
                        slide: function (event, ui) {
                            $("#text_m").val(MONTHS[ui.value]);
                            month = ui.value;

                            onSliderChange();

                        }
                    });
                    $("#text_m").val(MONTHS[ $("#slider_m").slider("value")]);
                });
                /////////////////////////////////////////// 
                $(function () {
                    $("#slider2_y").slider({
                        value: 2019, min: 2019, max: 2030, step: 1,
                        slide: function (event, ui) {
                            $("#text2_y").val(ui.value);
                            year = ui.value;

                            onSliderChange();

                        }
                    });
                    $("#text2_y").val($("#slider2_y").slider("value"));

                    $("#slider2_m").slider({
                        value: 0, min: 1, max: 12, step: 1,
                        slide: function (event, ui) {
                            $("#text2_m").val(MONTHS[ui.value]);
                            month2 = ui.value;

                            onSliderChange();

                        }
                    });
                    $("#text2_m").val(MONTHS[ $("#slider2_m").slider("value")]);

                    $("#slider2_date").slider({
                        value: 0, min: 1, max: 31, step: 1,
                        slide: function (event, ui) {
                            $("#text2_date").val(DATE[ui.value]);
                            date2 = ui.value;

                            onSliderChange();

                        }
                    });
                    $("#text2_date").val(DATE[ $("#slider2_date").slider("value")]);

                    $("#slider2_time").slider({
                        value: 0, min: 1, max: 24, step: 1,
                        slide: function (event, ui) {
                            $("#text2_time").val(TIME[ui.value]);
                            time2 = ui.value - 1;

                            onSliderChange();

                        }
                    });
                    $("#text2_time").val(TIME[ $("#slider2_time").slider("value")]);

                });

                $(function () {

                    function setSliderTicks(el) {
                        var $slider = $(el);
                        var max = $slider.slider("option", "max");
                        var min = $slider.slider("option", "min");
                        var spacing = (100.0 / (max - min));

                        $slider.find('.ui-slider-tick-mark').remove();
                        for (var i = 1; i < max - min; i++) {
                            $('<span class="ui-slider-tick-mark"></span>').css('left', Math.floor(spacing * i) + '%').appendTo($slider);
                        }
//                        $slider.css('width',spacing*(max-min)+"%");
                    }

//                    setSliderTicks($('#slider_dow'));
//                    setSliderTicks($('#slider_m'));
//                    setSliderTicks($('#slider_date'));
//                    setSliderTicks($('#slider_time'));


                });
            </script>

            <style>
                img.sticky {
                    position: -webkit-sticky;
                    position: sticky;
                    top: 10px;
                    left: 1233px;
                    width: 250px;
                }
                #button{
                    float:right;
                    

                }
                .slider
                {
                    width: 80%;
                    display: inline-block;
                }

                input[type=text]
                {
                    width: 100px;
                }

                .ui-slider-tick-mark{
                    display:inline-block;
                    width:1px;
                    background:gray;
                    height:14px;
                    position:absolute;
                    top:0px;
                }
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


            <body>                
                <div>		   
                    <div id="sliders" class="collapse">

                        <button type="button" class="btn btn-info" data-toggle2="collapse" data-target2="#sliders" onclick="toggleSliders();">Select</button>
                        <div class="slider-gap"></div>
                        <div id="tabs">
                            <ul>
                                <li><a href="#tab1" onclick="querymode = 'pattern'; onSliderChange()">Pattern</a></li>
                                <li><a href="#tab2" onclick="querymode = 'history'; onSliderChange()">History</a></li>
                            </ul>
                            <div id="tab1">
                                <div class="slider-container"> 
                                    <label >Month</label>
                                    <input type="text" id="text_m" readonly style="border:0; color:#f6931f; font-weight:bold;">
                                    <div id="slider_m" class="slider"></div>
                                </div> 
                                <div class="slider-container"> 
                                    <label >Date</label>
                                    <input type="text" id="text_date" readonly style="border:0; color:#f6931f; font-weight:bold;">

                                    <div id="slider_date" class="slider"></div>
                                </div> 
                                <div class="slider-container"> 
                                    <label >Day</label>
                                    <input type="text" id="text_dow" readonly style="border:0; color:#f6931f; font-weight:bold;">

                                    <div id="slider_dow" class="slider"></div>
                                </div> 
                                <div class="slider-container"> 
                                    <label >Time</label>
                                    <input type="text" id="text_time" readonly style="border:0; color:#f6931f; font-weight:bold;">

                                    <div id="slider_time" class="slider"></div>
                                </div> 
                            </div>
                            <div id="tab2">
                                <div class="slider-container"> 
                                    <label >Year</label>
                                    <input type="text" id="text2_y" readonly style="border:0; color:#f6931f; font-weight:bold;">
                                    <div id="slider2_y" class="slider"></div>
                                </div> 
                                <div class="slider-container"> 
                                    <label >Month</label>
                                    <input type="text" id="text2_m" readonly style="border:0; color:#f6931f; font-weight:bold;">
                                    <div id="slider2_m" class="slider"></div>
                                </div> 
                                <div class="slider-container"> 
                                    <label >Date</label>
                                    <input type="text" id="text2_date" readonly style="border:0; color:#f6931f; font-weight:bold;">

                                    <div id="slider2_date" class="slider"></div>
                                </div> 
                                <div class="slider-container"> 
                                    <label >Time</label>
                                    <input type="text" id="text2_time" readonly style="border:0; color:#f6931f; font-weight:bold;">

                                    <div id="slider2_time" class="slider"></div>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
                <img class="sticky" src="/images/noiselevel1.jpg" >
                <script>

                    function toggleSliders() {
                        let sliders = $("#sliders");
                        console.log(sliders);
                        //sliders.css("height","20px");
                        //sliders[0].style.height="100px";
                        sliders.toggleClass("hidden-sliders");
                    }

                    function onSliderChange()
                    {

                        clearTimeout(lastTimeout);
                        lastTimeout = window.setTimeout(function () {

                            $(function () {
                                console.log("Sending ajax request");
                                let bounds = map.getBounds();
                                console.log(bounds);

                                let sw = bounds.getSouthWest();
                                let ne = bounds.getNorthEast();
                                console.log(sw, ne);
                                console.log(sw.lat(), sw.lng(), ne.lat(), ne.lng());
                                console.log(querymode);
                                if (querymode === 'pattern')
                                {
                                    let url = "/query.htm?long_from=" + sw.lng() + "&long_to=" + ne.lng() + "&lat_from=" + sw.lat() + "&lat_to=" + ne.lat();
                                    if (month !== 0)
                                        url += "&month=" + month;
                                    if (time !== -1)
                                        url += "&time=" + time;
                                    if (day !== 0)
                                        url += "&dow=" + day;
                                    if (date !== 0)
                                        url += "&date=" + date;
                                    console.log("url", url);
                                    $.ajax({url: url, success: function (result) {
                                            console.log(result);
                                            showHeatMap(result);
                                        }});
                                } else if (querymode === 'history')
                                {
                                    let url = "/query.htm?long_from=" + sw.lng() + "&long_to=" + ne.lng() + "&lat_from=" + sw.lat() + "&lat_to=" + ne.lat();

                                    url += "&year=" + year;

                                    url += "&month=" + month2;

                                    url += "&time=" + time2;
                                    url += "&date=" + date2;
                                    console.log("url", url);
                                    $.ajax({url: url, success: function (result) {
                                            console.log(result);
                                            showHeatMap(result);
                                        }});
                                }
                            });
                        }, 2000);
                    }
                </script> 
            </body>
</html>