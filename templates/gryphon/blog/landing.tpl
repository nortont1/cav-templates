{% extends "gryphon/base.tpl" %}
{% block title %} :: Blogs{% endblock %}
{% block activeNav %}blogs{% endblock %}
{% block flag %}Blogs{% endblock %}
{% block content %}
{% import 'macros/meta.tpl' as metaRender %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}

<div class="row">
	<div class="span8">
		<h1>{{ config.get('publication:name') }} Blogs</h1>

		<div class="mmb"> </div>

		<div class="body-copy boot mmb">
			<p>Opinions expressed in blog posts are those of the authors, and not of {{ config.get('publication:name') }}.</p>
		</div>

		{% for blog in blogs %}
			{% set posts = blog.blogPosts %}
			<h4 class="mmb"><a href="{{ blog.url }}.xml"><img src="{{ 'assets/images/icons/rss-57.png'|asset }}" style="max-width:16px;position:relative;top:-2px;" alt="(RSS)" /></a>&nbsp;&nbsp; <a href="{{ blog.url }}">{{ blog.name }}</a></h4>

			{% set image = blog.media.grab('type', 'image', true).shift() %}
			{% if image %}
				<div class="image mb">
					<a href="{{ blog.url }}"><img src="{{ image.urlOriginal }}" alt="{{ blog.slug }}" /></a>
				</div>
			{% endif %}

			<div class="caption">
				{{ blog.description_formatted }}
			</div>

			{% set post = blog.mostRecent %}
			{% if post %}
				<hr class="spacer" />
				<h2><a href="{{ post.url }}">{{ post.headline }}</a></h2>
				<hr class="half spacer" />
				{{ post.abstract_formatted }}
				<a href="{{ post.url }}">Read more</a>

			{% endif %}

			<hr class="mb" />

		{% endfor %}
	</div>
	<div class="span4">
		{% include 'gryphon/main/sidebar/default.tpl' %}
	</div>
</div>
{% endblock content %}