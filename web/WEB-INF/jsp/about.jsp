<%-- 
    Document   : about.jsp
    Created on : 21 Jan, 2020, 4:30:03 PM
    Author     : cdudg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>About-Noise Minions</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/assets/css/main.css" />
	</head>
	<body class="subpage">

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="/index.html" class="logo">Noise Minions</a>
					<nav id="nav">
						<a href="/index.html">Home</a>
						<a href="/about.html">About</a>
						<a href="/login.html">Login</a>
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>

		<!-- Three -->
			<section id="three" class="wrapper">
				<div class="inner">
					<header class="align-center">
						<h2>Noise Minions</h2>
						<p>The Smart Thing</p>
					</header>
					<p>Noise pollution is increasing in the daily life with the urbanization of the society. It has a big impact on the society disturbing mental peace and affecting the health of the society. 
The government is taking actions to reduce noise pollution. The objective is to help the government reach the goal by highlighting areas where noise pollution is high. The goal is to explore a simpler way to measure and calculate noise levels and display it easily on a digital heat map.
The proposed system includes development of an android application which runs in the background and repetitively records audio snippets, measures the noise level of the audio snippet and uploads it to a server. There it is processed and displayed on a heat map. This map makes easier for the government bodies and the users to locate the noisy areas in the cities and do proper city planning and take proper actions to reduce noise pollution.
</p>
					<p>The word “Minion” means a follower who follows or serves someone more important. As we are using smartphones as a source of data which wander or travel around the cities and provide us the required data we referred those smartphones as “Minions”. And as these smartphones measure the noise level, we titled them as “Noise Minions”.</p>
					<p>The main objective of Noise Minions is that the application will only locate the noisy areas. It only keeps track of the noise levels of the areas wherever the smartphones will travel and highlight the areas with more noise. With the obtained data the government can make proper city planning to reduce the noise pollution caused in the areas. The output of the noise minions is that it will only produce a heat map which displays the noise levels of the different areas. Using this data can contribute to reduce noise pollution by providing it to the government bodies. </p>
					<p>An android application is used for collecting the data. This android application is the main source for the data for generating the heat map. This data is crowdsourced i.e. the data is obtained from the android application users which travel through various areas of the cities. This application runs in background on users’ smartphone. It records audio snippets using Microphone of device. Audio snippets are recorded after a certain fixed interval of time using the android application. The users need not to perform any task to record the audio snippet. Our mobile application records audio snippets autonomously. From the recorded audio snippet sound pressure level i.e. the noise intensity in decibels is measured. The Privacy policy is not violated as only decibel value is calculated and then audio recording is dumped.After calculation, data is sent to the server which includes the sound intensity of the audio snippets, randomly generated device id which is unique for each device and GPS coordinates i.e. latitude and longitude. At the server, this data is stored in database with date, time. </p>
					<p>The data generated from mobile devices are used for pattern generation. Using MapReduce technique, different patterns with respect to month, date, weekday, and time are produced. These patterns are stored in another table in database.
The Google map API for JavaScript is used for google map. The UI design contains the different sliders of date, month, weekday and time. The  user can select knob of any slider or combination of knobs of one or more sliders. The knobs of sliders of weekday and date can’t be selected at a time because it can create conflict. When knob of any slider is not selected then the heatmap without any constraints of month, weekday, date and time is generated.And when the knobs of the sliders are selected then respective patterns are displayed.</p>
						<p>The Noise Minions help us to identify the silent zones and the noise zones on the map. The accuracy of the map is only dependent upon the number of users of this application. More is the number of users of this application, more is the accuracy in a particular zone and vice versa. More are the number of active smartphones, more is the accuracy of the map. The resultant heatmap is as follows.</p>
						
								<img src="/images/output.PNG" alt="Pic 01" />
							
				</div>
			</section>

		<!-- Footer -->
			<footer id="footer">
				<div class="inner">
					
						<ul class="icons">
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-linkedin"><span class="label">linkedIn</span></a></li>
							<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
							
						</ul>
					</div>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="/assets/js/jquery.min.js"></script>
			<script src="/assets/js/skel.min.js"></script>
			<script src="/assets/js/util.js"></script>
			<script src="/assets/js/main.js"></script>

	</body>
</html>