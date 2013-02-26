{% extends "gryphon/base.tpl" %}
{% block activeNav %}home{% endblock %}

{% block content %}

{% set centerStories = articles.shift(2) %}
{% import "macros/article.tpl" as articleRender %}

	<div class="row">
		<div class="span3">
			<h3>Recent News:</h3>

			{% for article in articles %}
				{{ articleRender.threeCol(article) }}
				<hr class="spacer" />
			{% endfor %}

			<hr class="spacer" />

			{% include 'gryphon/main/modules/calendar.tpl' %}

		</div>
		<div class="span5 mobile-push-top">
            {% fetch hoos from blog with [
                'where': 'slug = "football-blog"',
                'limit': 1
            ] %}
            {% set topPost = hoos[0].mostRecent %}

            <h4>Special Coverage from <a href="{{ hoos[0].url }}">{{ hoos[0].name }}</a></h4>

   			{{ articleRender.dom(topPost) }}

            <hr class="spacer" />

            <h5>More from <a href="{{ hoos[0].url }}">{{ hoos[0].name }}</a></h5>

            {% fetch posts from blogPost with [
                'where': 'status = 1 and blog_id = '~hoos[0].uid~' and uid != '~topPost.uid,
                'order': 'created desc',
                'limit': 10
            ] %}

            <ul class="item-list">
            {% for post in posts %}
                <li><h4><a href="{{ post.url }}">{{ post.headline }}</a><span> | {{ post.created|date('M d') }}</span></h4></li>
            {% endfor %}
            </ul>

    		<hr class="hairline double spacer" />

			{% for article in centerStories %}
				{{ articleRender.fiveCol(article) }}
				<hr class="spacer" />
			{% endfor %}

			<hr class="hairline spacer" />

			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<div class="span6">
							<h3><a href="{{ 'section/sports'|url }}">Sports</a></h3>
							<ul class="item-list">
							{% fetch sports from article with [
								'where': 'status = 1',
								'order': 'weight desc, created desc',
								'limit': 4,
								'withTags': ['sports']
							]%}
							{% for article in sports %}
								<li><h4><a href="{{ article.url }}">{{ article.headline }}</a><span> | {{ article.created|date('M d') }}</span></h4></li>
							{% endfor %}
							</ul>
						</div>
						<div class="span6">
							<h3><a href="{{ 'section/ae'|url }}">A&amp;E</a></h3>
							<ul class="item-list">
							{% fetch ae from article with [
								'where': 'status = 1',
								'order': 'weight desc, created desc',
								'limit': 4,
								'withTags': ['tableau']
							]%}
							{% for article in ae %}
								<li><h4><a href="{{ article.url }}">{{ article.headline }}</a><span> | {{ article.created|date('M d') }}</span></h4></li>
							{% endfor %}
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<div class="span6">
							<h3><a href="{{ 'section/opinion'|url }}">Opinion</a></h3>
							<ul class="item-list">
							{% fetch opinion from article with [
								'where': 'status = 1',
								'order': 'weight desc, created desc',
								'limit': 4,
								'withTags': ['opinion']
							]%}
							{% for article in opinion %}
								<li><h4><a href="{{ article.url }}">{{ article.headline }}</a><span> | {{ article.created|date('M d') }}</span></h4></li>
							{% endfor %}
							</ul>
						</div>
						<div class="span6">
							<h3><a href="{{ 'section/life'|url }}">Life</a></h3>
							<ul class="item-list">
							{% fetch life from article with [
								'where': 'status = 1',
								'order': 'weight desc, created desc',
								'limit': 4,
								'withTags': ['life']
							]%}
							{% for article in life %}
								<li><h4><a href="{{ article.url }}">{{ article.headline }}</a><span> | {{ article.created|date('M d') }}</span></h4></li>
							{% endfor %}
							</ul>
						</div>
					</div>
				</div>
			</div>

			<hr class="hairline double spacer" />

			{% include 'gryphon/main/modules/featured-mm.tpl' %}

		</div>

		<div class="span4">
			<div id="main-sidebar" class="hidden-phone">
				<div id="social-buttons">
					<a href="http://www.facebook.com/CavalierDaily"><img src="{{ 'assets/images/icons/facebook-57.png'|asset }}" class="flex-image" /></a>
					<a href="https://twitter.com/cavalierdaily"><img src="{{ 'assets/images/icons/twitter-57.png'|asset }}" class="flex-image" /></a>
					<a href="http://www.youtube.com/user/CavalierDaily"><img src="{{ 'assets/images/icons/youtube-57.png'|asset }}" class="flex-image" /></a>
					<a href="{{ 'page/feeds'|url }}"><img src="{{ 'assets/images/icons/rss-57.png'|asset }}" class="flex-image" /></a>
				</div>
				<hr class="double hairline" />

				{% include 'gryphon/main/ads/rectangle.tpl' %}

				<hr class="double harline" />

				{% include 'gryphon/main/modules/recent.tpl' %}

				<hr class="double spacer" />

				{% include 'gryphon/main/modules/twitter_feed.tpl' %}

				<hr class="double spacer" />

				{% include 'gryphon/main/modules/fb_like.tpl' %}
			</div>
		</div>
	</div>


{% endblock content %}
