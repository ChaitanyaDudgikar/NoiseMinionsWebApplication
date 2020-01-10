
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Simple Map</title>
        <meta name="viewport" content="initial-scale=1.0">
        <meta charset="utf-8">
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
                top: 80%;
                background: #FFFFFF;
                border: 1px solid white;
                border-radius: 4px;
                width: 80%;
                box-shadow: black 5px 5px 10px;
            }

            .slider-container > label
            {
                width: 100px;
                display: inline-block;
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
            <div id="map"></div>
            <script>
                var map;
                var currentheatmap;
                var overlay;
                var lastTimeout;
                function initMap() {
                    map = new google.maps.Map(document.getElementById('map'), {
                        center: {lat: 17.60, lng: 75.90},
                        zoom: 12.5
                    });


                    //let USGSOverlay={};

//                    function USGSOverlay(bounds, image, map) {
//
//                        // Now initialize all properties.
//                        this.bounds_ = bounds;
//                        this.image_ = image;
//                        this.map_ = map;
//
//                        // Define a property to hold the image's div. We'll
//                        // actually create this div upon receipt of the onAdd()
//                        // method so we'll leave it null for now.
//                        this.div_ = null;
//
//                        // Explicitly call setMap on this overlay
//                        this.setMap(map);
//                    }
//
//                    USGSOverlay.prototype = new google.maps.OverlayView();
//
//                    USGSOverlay.prototype.onAdd = function () {
//
//                        var div = document.createElement('div');
//                        div.style.border = 'none';
//                        div.style.borderWidth = '0px';
//                        div.style.position = 'absolute';
//
//                        // Create the img element and attach it to the div.
//                        var img = document.createElement('img');
//                        img.src = this.image_;
//                        img.style.width = '100%';
//                        img.style.height = '100%';
//                        div.appendChild(img);
//
//                        this.div_ = div;
//
//                        // Add the element to the "overlayImage" pane.
//                        var panes = this.getPanes();
//                        panes.overlayImage.appendChild(this.div_);
//                    };
//
//                    USGSOverlay.prototype.draw = function () {
//
//                        // We use the south-west and north-east
//                        // coordinates of the overlay to peg it to the correct position and size.
//                        // To do this, we need to retrieve the projection from the overlay.
//                        var overlayProjection = this.getProjection();
//
//                        // Retrieve the south-west and north-east coordinates of this overlay
//                        // in LatLngs and convert them to pixel coordinates.
//                        // We'll use these coordinates to resize the div.
//                        var sw = overlayProjection.fromLatLngToDivPixel(this.bounds_.getSouthWest());
//                        var ne = overlayProjection.fromLatLngToDivPixel(this.bounds_.getNorthEast());
//
//                        // Resize the image's div to fit the indicated dimensions.
//                        var div = this.div_;
//                        div.style.left = sw.x + 'px';
//                        div.style.top = ne.y + 'px';
//                        div.style.width = (ne.x - sw.x) + 'px';
//                        div.style.height = (sw.y - ne.y) + 'px';
//                    };
//
//                    USGSOverlay.prototype.onRemove = function () {
//                        this.div_.parentNode.removeChild(this.div_);
//                    };
//
//                    // Set the visibility to 'hidden' or 'visible'.
//                    USGSOverlay.prototype.hide = function () {
//                        if (this.div_) {
//                            // The visibility property must be a string enclosed in quotes.
//                            this.div_.style.visibility = 'hidden';
//                        }
//                    };
//
//                    USGSOverlay.prototype.show = function () {
//                        if (this.div_) {
//                            this.div_.style.visibility = 'visible';
//                        }
//                    };
//
//                    USGSOverlay.prototype.toggle = function () {
//                        if (this.div_) {
//                            if (this.div_.style.visibility === 'hidden') {
//                                this.show();
//                            } else {
//                                this.hide();
//                            }
//                        }
//                    };
//
//                    USGSOverlay.prototype.toggleDOM = function () {
//                        if (this.getMap()) {
//                            // Note: setMap(null) calls OverlayView.onRemove()
//                            this.setMap(null);
//                        } else {
//                            this.setMap(this.map_);
//                        }
//                    };
//

                    var bounds = new google.maps.LatLngBounds(
                            new google.maps.LatLng(17.66, 75.90),
                            new google.maps.LatLng(17.67, 75.91));

                    // The photograph is courtesy of the U.S. Geological Survey.
                    var srcImage = 'https://developers.google.com/maps/documentation/javascript/';
                    srcImage += 'examples/full/images/talkeetna.png';


//                    overlay = new USGSOverlay(bounds, srcImage, map);


                    var solapur = new google.maps.LatLng(17.677383, 75.908670);

                    map = new google.maps.Map(document.getElementById('map'), {
                        center: solapur,
                        zoom: 13,
                        //  mapTypeId: 'satellite'
                    });

                    google.maps.event.addListener(map, 'bounds_changed', function () {
                        //                    console.log('clearingtimeout',lasttimeout);
                        clearTimeout(lastTimeout);
                        lastTimeout = window.setTimeout(function () {
//                            console.log(sw.lat(), sw.lng(), ne.lat(), ne.lng());
                            onSliderChange();
                        }, 2000);
                        //                    console.log('timeout',lasttimeout);
                    });

                }

                function showHeatMap(data)
                {
                    if (currentheatmap)
                    {
                        currentheatmap.setMap(null);
                    }

                    var heatMapData = [
//                        {location: new google.maps.LatLng(17.61, 75.91), weight: 0.5},
//                        new google.maps.LatLng(17.61, 75.91),
//                        {location: new google.maps.LatLng(17.61, 75.91), weight: 2},
//                        {location: new google.maps.LatLng(17.61, 75.93), weight: 3},
//                        {location: new google.maps.LatLng(17.61, 75.92), weight: 2},
//                        new google.maps.LatLng(17.62, 75.92),
//                        {location: new google.maps.LatLng(17.62, 75.92), weight: 0.5},
//
//                        {location: new google.maps.LatLng(17.62, 75.93), weight: 3},
//                        {location: new google.maps.LatLng(17.63, 75.92), weight: 2},
//                        new google.maps.LatLng(17.62, 75.93),
//                        {location: new google.maps.LatLng(17.62, 75.92), weight: 0.5},
//                        new google.maps.LatLng(17.63, 75.93),
//                        {location: new google.maps.LatLng(17.62, 75.94), weight: 2},
//                        {location: new google.maps.LatLng(17.62, 75.95), weight: 3}
                    ];

                    for (let i of JSON.parse(data))
                    {
                        console.log("i", i);
                        heatMapData.push({location: new google.maps.LatLng(i.latitudeNoise, i.longitudeNoise), weight: i.noiselevel / 100.0});
                    }


                    var heatmap = new google.maps.visualization.HeatmapLayer({
                        data: heatMapData,
                        dissipating: true,
                        radius: 10
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
                let DATE = ['NA', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31']
                let TIME = ['NA', '00', '01', '02', '03', '04', '05', '6', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23']
                //DOW
                $(function () {
                    $("#slider_dow").slider({
                        value: 0, min: 0, max: 7, step: 1,
                        slide: function (event, ui) {
                            $("#text_dow").val(DAYS[ui.value]);
                            onSliderChange();
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
                            onSliderChange();
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
                            onSliderChange();
                        }
                    });
                    $("#text_m").val(MONTHS[ $("#slider_m").slider("value")]);
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
                .slider
                {
                    width: 50%;
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
            </style>


            <body>

                <div id="sliders">
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
        </div>

        <script>
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
                        $.ajax({url: "/noiseservice/query.htm?long_from=0&long_to=180&lat_from=0&lat_to=90", success: function (result) {
                                console.log(result);
                                showHeatMap(result);
                            }});
                    });
                }, 2000);
            }
        </script>

    </body>
</html>