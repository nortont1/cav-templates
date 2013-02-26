{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ section.name }}{% endblock %}
{% block activeNav %}{{ active }}{% endblock %}

{% block links %}
<link rel="alternate" type="application/rss+xml" title="{{ config.get('gryphon:publication:name') }} :: {{ section.name }}" href="{{ (section.url~'.xml')|url }}" />
{% endblock %}

{% block content %}
{% set topStory = articles.shift() %}
{% set secondary = articles.shift(3) %}

{% import "macros/article.tpl" as articleRender %}
{% import "macros/meta.tpl" as metaRender %}

{% fetch cartoons from media with [
	'order': 'created desc',
	'where': 'status = 1',
	'withTags': ['cartoon'],
	'limit': 2
] %}

	<div class="row">
		<div class="span8">
			<div class="row">
				<div class="span5">
					{{ articleRender.dom(topStory) }}

					<hr class="hairline double spacer" />

					<h3>Editorial Cartoon</h3>

					<div id="edit-cartoon-carousel" class="carousel">
						<div class="carousel-inner">
							{% for cartoon in cartoons %}
							<div class="{% if loop.first %}active {% endif %}item">
								<a href="{{ cartoon.urlDefault }}"><img src="{{ cartoon.url }}" /></a>
								<div class="carousel-caption">
									<h4>{{ cartoon.title }}</h4>
								</div>
							</div>
							{% endfor %}
						</div>

						<a class="carousel-control left" href="#edit-cartoon-carousel" data-slide="prev">&lsaquo;</a>
						<a class="carousel-control right" href="#edit-cartoon-carousel" data-slide="next">&rsaquo;</a>
					</div>

				</div>
				<div class="span3">

					{% for article in secondary %}
						{{ articleRender.fourCol(article) }}
						<hr class="spacer" />
					{% endfor %}
				</div>
			</div>

			<hr class="half hairline" />

			<h3>More {{ section.name }}</h3>

			<hr class="half spacer" />
			<div class="row">
				<div class="span4">
					<ul class="item-list">
					{% for article in articles.shift((articles.length/2)-1) %}
						<li>
							<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>
							<aside class="byline">
							 by {{ article.authors.splat('name')|join(' and ') }} | {{ article.created|timeSince }} | <a href="{{ article.url }}"><i class="icon-comment"></i> </a>
							</aside>
						</li>
					{% endfor %}
					</ul>
				</div>
				<div class="span4">
					<ul class="item-list">
					{% for article in articles %}
						<li>
							<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>
							<aside class="byline">
							 by {{ article.authors.splat('name')|join(' and ') }} | {{ article.created|timeSince }} | <a href="{{ article.url }}"><i class="icon-comment"></i> </a>
							</aside>
						</li>
					{% endfor %}
					</ul>
				</div>
			</div>
		</div>
		<div class="span4">

			{% include 'gryphon/main/sidebar/default.tpl' %}
		</div>
	</div>


{% endblock content %}