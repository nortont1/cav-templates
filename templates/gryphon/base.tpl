{% import "macros/render.tpl" as render %}
{% helper config %}
{% helper weather %}
{% helper utilityHelper as util %}
{% helper adpilotHelper as ads %}
{% import "macros/disqus.tpl" as disqus %}
{% set title %}{% block title %}{% endblock %}{% endset %}

{% set active %}{% block activeNav %}{% endblock %}{% endset %}
{% if not active %}
	{% set active = 'home' %}
{% endif %}

{% set subActive %}{% block subActive %}{% endblock %}{% endset %}

<!DOCTYPE html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>The Cavalier Daily{{ title|default(" University of Virginia's Student Newspaper") }} </title>
	<meta name="generator" content="Gryphon {{ config.appVersion }} (Foundry {{ config.foundryVersion }})" />
	<meta name="poweredby" content="SNworks - Solutions by The State News" />

	<link rel="icon" type="image/png" href="/faveicon.png">

	<link rel="stylesheet" type="text/css" href="{{ 'assets/dist/master.css'|asset }}" />
  <link rel="stylesheet" type="text/css" href="{{ 'assets/css/jquery.dropdown.css'|asset }}" />
	<meta name="viewport" content="width=device-width">


    <link rel="stylesheet" href="{{ 'assets/js/vendor/fancybox/jquery.fancybox.css'|asset }}" type="text/css" media="screen" />
    <link rel="stylesheet" href="{{ 'assets/js/vendor/fancybox/helpers/jquery.fancybox-buttons.css'|asset }}" type="text/css" media="screen" />
    <link rel="stylesheet" href="{{ 'assets/js/vendor/fancybox/helpers/jquery.fancybox-thumbs.css'|asset }}" type="text/css" media="screen" />

	<meta name="norton-safeweb-site-verification" content="fyija7dybln3trsnr4h76aml1s0lfayt-r6cgx8h7vvmo8wfhjd73ow5wqgb4-oz888lno-b6tf9in8ccg-nf0eacfq6m3chl2d7sw9hzdlvvxg7i1ja8hilhvuewa9n" />
	<script src="{{ 'assets/dist/modernizr.min.js'|asset }}"></script>
	<script type="text/javascript">

	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-5503642-1']);
	  _gaq.push(['_trackPageview']);

	  (function() {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();

	</script>
	{% block links%}
	{% endblock%}

	 <script type='text/javascript' src='http://partner.googleadservices.com/gampad/google_service.js'></script> <script type='text/javascript'>GS_googleAddAdSenseService("ca-pub-4992640591282735");
		GS_googleEnableAllServices();</script> <script type='text/javascript'>GA_googleAddSlot("ca-pub-4992640591282735", "R_Frontpage_Box");</script> <script type='text/javascript'>GA_googleFetchAds();</script> <script type='text/javascript' src='http://partner.googleadservices.com/gampad/google_service.js'></script> <script type='text/javascript'>GS_googleAddAdSenseService("ca-pub-4992640591282735");
    GS_googleEnableAllServices();</script> <script type='text/javascript'>GA_googleAddSlot("ca-pub-4992640591282735", "R_Article_bottom");</script> <script type='text/javascript'>GA_googleFetchAds();</script> <script type='text/javascript' src='http://partner.googleadservices.com/gampad/google_service.js'></script> <script type='text/javascript'>GS_googleAddAdSenseService("ca-pub-4992640591282735");
	GS_googleEnableAllServices();</script> <script type='text/javascript'>GA_googleAddSlot("ca-pub-4992640591282735", "R_Top_Banner");</script> <script type='text/javascript'>GA_googleFetchAds();</script>
	<script type='text/javascript'>
	GA_googleAddSlot("ca-pub-4992640591282735", "R_Medium_Banner");
	</script>

	<link href="http://cdn.tsn.s3.amazonaws.com/video-js/video-js.css" rel="stylesheet" />
	<script src="http://cdn.tsn.s3.amazonaws.com/video-js/video.js"></script>
</head>
<body class="container">
<!--Header-->

<hr class="half spacer" />

{% include 'gryphon/main/ads/leaderboard.tpl' %}

<hr class="half spacer" />

<header id="main-header">

	<div class="row">
		<div class="span12" id="top-ticker">
			<div class="row">
				<div class="span6"><div class="half box">
					<time>
						{{ now|date('M d, Y') }} | <img src="{{ ('assets/images/weathericons/'~weather.icon)|asset }}" alt="{{ weather }}" style="position:relative;top:-2px;" /> {{ weather }} {{ weather.temp }}&deg; F | <a href="{{ weather.url }}" target="_blank">7-Day Forecast</a> | Charlottesville, VA
					</time>
				</div></div>
				<div class="span6"><div class="half box text-right">
					<ul>
						<li><a href="{{ 'page/donate'|url }}">Donate</a></li>
						<li><a href="{{ 'page/advertise'|url }}">Advertise</a></li>
						<li><a href="{{ 'classifieds'|url }}">Classifieds</a></li>
						<li><a href="{{ 'page/about'|url}}">About</a></li>
						<li><a href="{{ 'page/join'|url}}">Join</a></li>
						<!--<li><a href="#">Buy a Photo</a></li>-->
						<li><a href="https://maps.google.com/maps/ms?msid=203628694697111603824.0004b86d9f371ba923e3d&msa=0" target="_blank">Find a Paper</a></li>
						<li><a href="{{ 'page/feeds'|url }}"><img src="{{ 'assets/images/rss.png'|asset }}" style="width:12px;" />RSS</a></li>
					</ul>
				</div></div>
			</div> {# / .row #}
		</div> {# / .span12 #}
	</div> {# / .row #}

	<div id="flag">
		<div class="row">
			<div class="span6">
				<a href="{{ '/'|url }}"><img src="{{ 'assets/images/CDBanner.png'|asset }}" alt="Banner" id="main-flag" class="flex-image" /></a>
			</div>
			<div class="span6"><div class="text-right">
				{% include 'gryphon/main/ads/fullbanner.tpl' %}
			</div></div>
		</div>
	</div>

	<div class="navbar">
	  <div class="navbar-inner">
		<div class="container">

		  <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
		  <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </a>

		  <!-- Everything you want hidden at 940px or less, place within here -->
		  <div class="nav-collapse">
			<ul class="nav">
				<li{% if not active or active == 'home' %} class="selected"{% endif %} ><a href="{{ '/'|url }}" rel="home"><i class="icon-home icon-white"></i></a>
				</li><li{% if active == 'news' %} class="selected"{% endif %}><a href="{{ 'section/news'|url }}" rel="news">News</a>
				</li><li{% if active == 'sports' %} class="selected"{% endif %}><a href="{{ 'section/sports'|url }}" rel="sports">Sports</a>
				</li><li{% if active == 'opinion' %} class="selected"{% endif %}><a href="{{ 'section/opinion'|url }}" rel="opinion">Opinion</a>
				</li><li{% if active == 'aande' %} class="selected"{% endif %}><a href="{{ 'section/ae'|url }}" rel="aande">A&amp;E</a>
				</li><li{% if active == 'life' %} class="selected"{% endif %}><a href="{{ 'section/life'|url }}" rel="life">Life</a>
				</li><li{% if active == 'weeklies' %} class="selected"{% endif %}><a href="{{ 'section/weeklies'|url }}" rel="weeklies">Weeklies</a>
				</li><li{% if active == 'comics' %} class="selected"{% endif %}><a href="{{ 'section/comics'|url }}" rel="home">Comics</a>
				</li><li{% if active == 'blogs' %} class="selected"{% endif %}><a href="{{ 'blog'|url }}" rel="blogs">Blogs</a>
				</li><li{% if active == 'multimedia' %} class="selected"{% endif %}  data-dropnav-source="{{ 'section/dropnav'|url(['t':'multimedia']) }}"><a href="{{ 'multimedia'|url }}" rel="multimedia">Multimedia</a>
				</li><li{% if active == 'issuu' %} class="selected"{% endif %}><a href="http://issuu.com/cavalierdaily" rel="issuu">Print Edition</a>
				</li>
			</ul>
			<div class="pull-right">
				<form class="form-inline" method="get" action="{{ 'gryphon:search'|url }}">
					<div class="input-append">
						<input type="text" class="input-medium" placeholder="Search..." name="q" style="width:100px;"/>
						<a href="#" class="btn"><i class="icon-search"></i></a>
					</div>
				</form>
			</div>
		  </div>
		</div>
	  </div>
	</div>
	<div class="subnav">
		<ul id="sub-home"{% if not active or active == 'home' %} class="selected"{% endif %}>
			<li><span>Serving the University of Virginia community since 1890</span></li>
		</ul>
		<ul id="sub-news"{% if active == 'news' %} class="selected"{% endif %}>
			<li><a href="{{ 'section/grounds'|url }}">Grounds</a></li>
			<li><a href="{{ 'section/local'|url }}">Local</a></li>
			<li><a href="{{ 'section/state'|url }}">State</a></li>
			<li><a href="{{ 'section/higher-education'|url }}">Higher Ed</a></li>
		</ul>
		<ul id="sub-sports"{% if active == 'sports' %} class="selected"{% endif %}>
	      <li><a href="{{ 'section/swim-and-dive'|url }}">Swim and Dive</a></li>
		    <li><a href="{{ 'section/mens-basketball'|url }}">Men's Basketball</a></li>
		    <li><a href="{{ 'section/womens-basketball'|url }}">Women's Basketball</a></li>
		    <li><a href="{{ 'section/tennis'|url }}">Tennis</a></li>
		    <li><a href="{{ 'section/wrestling'|url }}">Wrestling</a></li>
            <li class="dropdown" id="offseason"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Off-season<b class="caret"></b></a>
            <div class="offseason">
              <ul class="dropdown-menu" id="offseason">
                  <li><a href="{{ 'section/baseball'|url }}">Baseball</a></li>
                  <li><a href="{{ 'section/football'|url }}">Football</a></li>
                  <li><a href="{{ 'section/mens-lacrosse'|url }}">Men's Lacrosse</a></li>
                  <li><a href="{{ 'section/mens-soccer'|url }}">Men's Soccer</a></li>
                  <li><a href="{{ 'section/womens-lacrosse'|url }}">Women's Lacrosse</a></li>
                  <li><a href="{{ 'section/womens-soccer'|url }}">Women's Soccer</a></li>
            </ul>
          </div>
	    </li>
	  </ul>
		<ul id="sub-opinion"{% if active == 'opinion' %} class="selected"{% endif %}>
			<li><a href="{{ 'section/columns'|url }}">Columns</a></li>
			<li><a href="{{ 'section/editorial-cartoons'|url }}">Editorial Cartoons</a></li>
			<li><a href="{{ 'section/lead-editorial'|url }}">Lead Editorials</a></li>
			<li><a href="{{ 'section/letters'|url }}">Letters to the Editor</a></li>
		</ul>
		<ul id="sub-aande"{% if active == 'aande' %} class="selected"{% endif %}>
			<li><a href="{{ 'section/art'|url }}">Art</a></li>
			<li><a href="{{ 'section/movies'|url }}">Movies</a></li>
			<li><a href="{{ 'section/music'|url }}">Music</a></li>
			<li><a href="http://cdtablog.tumblr.com/">Arts &amp; Entertainment Blog</a></li>
			<li><a href="{{ 'section/tv'|url }}">TV</a></li>
			<li><a href="{{ 'section/books'|url }}">Books</a></li>
			<li><a href="{{ 'section/the-local'|url }}">The Local</a></li>
		</ul>
		<ul id="sub-life"{% if active == 'life' %} class="selected"{% endif %}>
			<li><a href="{{ 'section/life-columns'|url }}">Columns</a></li>
			<li><a href="{{ 'section/love-connection'|url }}">Love Connection</a></li>
			<li><a href="{{ 'page/love-connection-survey'|url }}">Love Connection Survey</a></li>
		</ul>
		<ul id="sub-weeklies"{% if active == 'weeklies' %} class="selected"{% endif %}>
			<li><a href="{{ 'section/focus'|url }}">Focus</a></li>
			<li><a href="{{ 'section/health-science'|url }}">Health &amp; Science</a></li>
		</ul>
		{% fetch blogs from blog with [
				'where': 'status = 1',
				'order': 'self:modified desc',
				'limit':8
				]
		%}
		<ul id="sub-blogs"{% if active == 'blogs' %} class="selected"{% endif %}>
      {% for b in blogs %}
        <li><a href="{{b.url}}">{{b.name}}</a></li>
      {% endfor %}
		</ul>
		<ul id="sub-multimedia"{% if active =='multimedia' %} class="selected"{% endif %}>
			<li><a href="{{ 'multimedia/video'|url }}">Video</a></li>
			<li><a href="{{ 'multimedia/image'|url }}">Photos</a></li>
			<li><a href="{{ 'multimedia/audio'|url }}">Audio</a></li>
		</ul>
	</div>

	{#<div class="row">
		<nav class="span12">
			<div id="main-navigation"><div class="row">
				<div class="span9"><div class="nav-collapse collapse">
					<ul>
						<li{% if not active or active == 'home' %} class="selected"{% endif %}><a href="{{ '/'|url }}"><i class="icon-home icon-white"></i></a>
							<ul>
								<li><span>Serving the University of Virginia community since 1890</span></li>
							</ul>
						</li><li{% if active == 'news' %} class="selected"{% endif %}><a href="{{ 'section/news'|url }}">News</a>
							<ul>
								<li><a href="{{ 'section/grounds'|url }}">Grounds</a></li>
								<li><a href="{{ 'section/local'|url }}">Local</a></li>
								<li><a href="{{ 'section/state'|url }}">State</a></li>
							</ul>
						</li><li{% if active == 'sports' %} class="selected"{% endif %}><a href="{{ 'section/sports'|url }}">Sports</a>
							<ul>
								<li><a href="{{ 'section/baseball'|url }}">Baseball</a></li>
								<li><a href="{{ 'section/football'|url }}">Football</a></li>
								<li><a href="{{ 'section/mens-basketball'|url }}">Men's Basketball</a></li>
								<li><a href="{{ 'section/mens-lacrosse'|url }}">Men's Lacrosse</a></li>
								<li><a href="{{ 'section/mens-soccer'|url }}">Men's Soccer</a></li>
								<li><a href="{{ 'section/womens-basketball'|url }}">Women's Basketball</a></li>
								<li><a href="{{ 'section/womens-lacrosse'|url }}">Women's Lacrosse</a></li>
								<li><a href="{{ 'section/womens-soccer'|url }}">Women's Soccer</a></li>
								<li><a href="{{ 'section/wrestling'|url }}">Wrestling</a></li>
							</ul>
						</li><li{% if active == 'opinion' %} class="selected"{% endif %}><a href="{{ 'section/opinion'|url }}">Opinion</a>
							<ul>
								<li><a href="{{ 'section/columns'|url }}">Columns</a></li>
								<li><a href="{{ 'section/editorial-cartoon'|url }}">Editorial Cartoons</a></li>
								<li><a href="{{ 'section/lead-editorial'|url }}">Lead Editorials</a></li>
								<li><a href="{{ 'section/letters'|url }}">Letters to the Editor</a></li>
							</ul>
						</li><li{% if active == 'aande' %} class="selected"{% endif %}><a href="{{ 'section/ae'|url }}">A&amp;E</a>
							<ul>
								<li><a href="{{ 'section/art'|url }}">Art</a></li>
								<li><a href="{{ 'section/movies'|url }}">Movies</a></li>
								<li><a href="{{ 'section/music'|url }}">Music</a></li>
								<li><a href="http://cdtablog.tumblr.com/">Arts &amp; Entertainment Blog</a></li>
								<li><a href="{{ 'section/tv'|url }}">TV</a></li>
								<li><a href="{{ 'section/books'|url }}">Books</a></li>
								<li><a href="{{ 'section/the-local'|url }}">The Local</a></li>
							</ul>
						</li><li{% if active == 'life' %} class="selected"{% endif %}><a href="{{ 'section/life'|url }}">Life</a>
							<ul>
								<li><a href="{{ 'section/life-columns'|url }}">Columns</a></li>
								<li><a href="{{ 'section/love-connection'|url }}">Love Connection</a></li>
								<li><a href="{{ 'page/love-connection-survey'|url }}">Love Connection Survey</a></li>
							</ul>
						</li><li{% if active == 'weeklies' %} class="selected"{% endif %}><a href="{{ 'section/weeklies'|url }}">Weeklies</a>
							<ul>
								<li><a href="{{ 'section/focus'|url }}">Focus</a></li>
								<li><a href="{{ 'section/health-science'|url }}">Health &amp; Science</a></li>
							</ul>
						</li><li{% if active == 'comics' %} class="selected"{% endif %}><a href="{{ 'section/comics'|url }}">Comics</a></li><li{% if active == 'blogs' %} class="selected"{% endif %}><a href="{{ 'blog'|url }}">Blogs</a></li><li{% if active == 'multimedia' %} class="selected"{% endif %}><a href="{{ 'multimedia'|url }}">Multimedia</a>
							<ul>
								<li><a href="{{ 'multimedia/video'|url }}">Video</a></li>
								<li><a href="{{ 'multimedia/image'|url }}">Photos</a></li>
								<li><a href="{{ 'multimedia/audio'|url }}">Audio</a></li>
							</ul>
						</li>
					</ul></div>
				</div>
				<div class="span3 text-right">
					<form class="form-inline" method="get" action="{{ 'gryphon:search'|url }}">
						<div class="input-append">
							<input type="text" class="input-medium" placeholder="Search..." name="q" />
							<a href="#" class="btn"><i class="icon-search"></i></a>
						</div>
					</form>
				</div>
			</div></div>
		</nav>
	</div>
	#}
<!--End - Bottom Two Navigation Bars-->
</header>
<!-- End of header -->

{% block content %}{% endblock %}

<!-- Footer -->

<hr class="double spacer" />

<footer>
	<div class="row-fluid">
		<div class="span2">
			<ul class="unstyled">
				<li><h3><a href="{{ 'section/news'|url }}">News</a></h3></li>
				<li><a href="{{ 'section/grounds'|url }}">Grounds</a></li>
				<li><a href="{{ 'section/local'|url }}">Local</a></li>
				<li><a href="{{ 'section/state'|url }}">State</a></li>
			</ul>

			<ul class="unstyled">
				<li><h3><a href="{{ 'section/life'|url }}">Life</a></h3></li>
				<li><a href="{{ 'section/life-columns'|url }}">Columns</a></li>
				<li><a href="{{ 'section/love-connection'|url }}">Love Connection</a></li>
				<li><a href="{{ 'page/love-connection-survey'|url }}">Love Connection Survey</a></li>
			</ul>
		</div>

		<div class="span2">
			<ul class="unstyled">
				<li><h3><a href="{{ 'section/opinion'|url }}">Opinion</a></h3></li>
				<li><a href="{{ 'section/columns'|url }}">Columns</a></li>
				<li><a href="{{ 'section/cartoons'|url }}">Editorial Cartoons</a></li>
				<li><a href="{{ 'section/editorials'|url }}">Lead Editorials</a></li>
				<li><a href="{{ 'section/letters'|url }}">Letters to the Editor</a></li>
			</ul>

			<ul class="unstyled">
				<li><h3><a href="{{ 'blog'|url }}" class="footer-header">Blogs</a></h3></li>
			</ul>

			<ul class="unstyled">
				<li><h3><a href="{{ 'section/ae'|url }}">A&amp;E</a></h3></li>
				<li><a href="{{ 'section/art'|url }}">Art</a></li>
				<li><a href="{{ 'section/movies'|url }}">Movies</a></li>
				<li><a href="{{ 'section/music'|url }}">Music</a></li>
				<li><a href="#">Arts &amp; Entertainment Blog</a></li>
			</ul>
		</div>

		<div class="span2">
			<ul class="unstyled">
				<li><h3><a href="{{ 'section/sports'|url }}">Sports</a></h3></li>
				<li><a href="{{ 'section/baseball'|url }}">Baseball</a></li>
				<li><a href="{{ 'section/football'|url }}">Football</a></li>
				<li><a href="{{ 'section/mens-basketball'|url }}">Men's Basketball</a></li>
				<li><a href="{{ 'section/mens-lacrosse'|url }}">Men's Lacrosse</a></li>
				<li><a href="{{ 'section/mens-soccer'|url }}">Men's Soccer</a></li>
				<li><a href="{{ 'section/womens-basketball'|url }}">Women's Basketball</a></li>
				<li><a href="{{ 'section/womens-lacrosse'|url }}">Women's Lacrosse</a></li>
				<li><a href="{{ 'section/womens-soccer'|url }}">Women's Soccer</a></li>
				<li><a href="{{ 'section/wrestling'|url }}">Wrestling</a></li>
			</ul>
		</div>

		<div class="span2">
			<ul class="unstyled">
				<li><h3><a href="{{ 'section/weeklies'|url }}">Weeklies</a></h3><li>
				<li><a href="{{ 'section/focus'|url }}">Focus</a></li>
				<li><a href="{{ 'section/health-science'|url }}">Health &amp; Science</a></li>
			</ul>

			<ul class="unstyled">
				<li><h3><a href="{{ 'multimedia'|url }}">Multimedia</a></h3></li>
				<li><a href="{{ 'multimedia/video'|url }}">Video</a></li>
				<li><a href="{{ 'multimedia/image'|url }}">Photos</a></li>
				<li><a href="{{ 'multimedia/audio'|url }}">Audio</a></li>
			</ul>

			<ul class="unstyled">
				<li><h3><a href="{{ 'page/about'|url }}">About &amp; History</a></h3></li>
				<li><a href="{{ 'page/staff'|url }}"">Contact</a></li>
				<li><a href="{{ 'page/corrections'|url }}"">Corrections</a></li>
				<li><a href="{{ 'page/join'|url }}"">Join</a></li>
				<li><a href="{{ 'page/comment-policy'|url }}">Comment Policy</a></li>
			</ul>
		</div>

		<div class="span2">
			<p>
				The Cavalier Daily is the independent student newspaper of the University of Virginia, published since 1890.
			</p>
			<p>
				Please see our <a href="{{ 'page/about'|url }}">about page</a> for more information.
			</p>
		</div>

		<div class="span2"><div class="text-center">
			{#% fetch pdf from media with [
				'where': 'status = 1',
				'order': 'created desc',
				'withTags': ['front page']
			] %#}
			{#
			{% if pdf.length %}
			<a href="{{ pdf[0].urlOriginal }}"><img src="{{ pdf[0].urlPreview }}" style="max-width:180px;" class="flex-image" /></a>
			<br />
			<span class="small"><a href="{{ pdf[0].urlOriginal }}">Download PDF</a></span>
			{% endif %}
			#}
			{% helper issuuDoc %}

			<a href="{{ issuuDoc.recent.link }}"><img src="{{ issuuDoc.recent.thumb }}" style="max-width:180px;" class="flex-image" /></a>
			<br />
			<span class="small"><a href="{{ issuuDoc.recent.link }}">Download PDF</a></span>

		</div></div>
	</div>

	<div class="text-center">
		<p>All Content &copy; Copyright {{ now|date('Y') }}, The Cavalier Daily</p>
		<hr class="spacer" />

	</div>
</footer>

<div id="snworks-bug">
	Powered by <a href="http://getsnworks.com" target="_blank"><img src="http://cdn.thesn.net/gAssets/SNworks_gray.png" alt="powered by SNworks" title="powered by SNworks" /></a> Solutions by The State News
</div>
<!-- End of footer-->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="{{ 'assets/js/vendor/fancybox/jquery.fancybox.js'|asset }}"></script>
<script type="text/javascript" src="{{ 'assets/js/vendor/fancybox/helpers/jquery.fancybox-buttons.js'|asset }}"></script>
<script type="text/javascript" src="{{ 'assets/js/vendor/fancybox/helpers/jquery.fancybox-thumbs.js'|asset }}"></script>

{% block scripts %}{% endblock %}
<script type="text/javascript" src="{{ 'assets/dist/bootstrap.min.js'|asset }}"></script>
<script type="text/javascript" src="{{ 'assets/dist/cavdaily.js'|asset }}"></script>
<script type="text/javascript" src="{{ 'assets/js/jquery.dropdown.js'|asset }}" />
<script type="text/javascript" src="{{ 'assets/js/fb-popover.js'|asset }}" ></script>
{# include 'gryphon/main/tracker.tpl' #}

<script type="text/javascript" src="//assets.pinterest.com/js/pinit.js"></script>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=139321646130471";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>



</body>
</html>
