{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ section.name }}{% endblock %}
{% block activeNav %}{{ active }}{% endblock %}

{% block links %}
<link rel="alternate" type="application/rss+xml" title="{{ config.get('gryphon:publication:name') }} :: {{ section.name }}" href="{{ (section.url~'.xml')|url }}" />
{% endblock %}

{% block content %}
{% set topStory = articles.shift(5) %}
{% set secondary = articles.shift(4) %}

{% import "macros/article.tpl" as articleRender %}
{% import "macros/meta.tpl" as metaRender %}

	<div class="row">
		<div class="span8">
			<div class="row">
				<div class="span4">
					{% for article in topStory %}
						<article class="abstract four-column">
							<h1><a href="{{ article.url }}">{{ article.headline }}</a></h1>
							{% set images = article.media.grab('type', 'image', true) %}
							{% if images.length %}
							<div class="box">
								<a href="{{ article.url }}"><img src="{{ images[0].url }}" class="block flex-image" /></a>
							</div>
							{% endif %}
							<aside class="by-line">
							 by {{ article.authors.splat('name')|join(' and ') }} | {{ article.created|timeSince }} | <a href="{{ article.url }}"><i class="icon-comment"></i></a>
							</aside>
						</article>
						<hr class="double spacer" />
					{% endfor %}

				</div>
				<div class="span4">
					{% for article in secondary %}
						<article class="abstract four-column">
							<h1><a href="{{ article.url }}">{{ article.headline }}</a></h1>
							{% set images = article.media.grab('type', 'image', true) %}
							{% if images.length %}
							<div class="box">
								<a href="{{ article.url }}"><img src="{{ images[0].url }}" class="block flex-image" /></a>
							</div>
							{% endif %}
							<aside class="by-line">
							 by {{ article.authors.splat('name')|join(' and ') }} | {{ article.created|timeSince }} | <a href="{{ article.url }}"><i class="icon-comment"></i></a>
							</aside>
						</article>
						<hr class="double spacer" />
					{% endfor %}
				</div>
			</div>

		</div>
		<div class="span4">

			{% include 'gryphon/main/sidebar/default.tpl' %}
		</div>
	</div>


{% endblock content %}