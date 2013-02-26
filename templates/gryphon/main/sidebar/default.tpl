<div id="main-sidebar" class="hidden-phone">
	<div id="social-buttons">
		<a href="http://www.facebook.com/CavalierDaily"><img src="{{ 'assets/images/icons/facebook_box.png'|asset }}" class="flex-image" /></a>
      	<a href="https://twitter.com/intent/user?screen_name=cavalierdaily"><img src="{{ 'assets/images/icons/twitter_box.png'|asset }}" class="flex-image" width="40px" height="40px"/></a>
      	<a href="http://www.youtube.com/user/CavalierDaily"><img src="{{ 'assets/images/icons/youtube_box2.jpg'|asset }}" class="flex-image" /></a>
      	<a href="{{ 'page/feeds'|url }}"><img src="{{ 'assets/images/icons/RSS_Feed_box.png'|asset }}" class="flex-image" /></a>
	</div>


	<hr class="double hairline" />

    <div class="well">
      <h4>Subscribe to our email edition</h3>

      <p>
          Get The Cavalier Daily delivered to your inbox every morning.
      </p>

      <a href="http://eepurl.com/uMcV5" class="btn btn-primary">Subscribe now!</a>
    </div>

    <hr class="double hairline" />

	{% include 'gryphon/main/ads/rectangle.tpl' %}

	<hr class="double harline" />

    {% include 'gryphon/main/modules/calendar.tpl' %}

    <hr class="double harline" />

	{% include 'gryphon/main/modules/recent.tpl' %}

</div>
