{% extends "gryphon/base.tpl" %}
{% block title %} :: Blogs : {{ blog.name }}{% endblock %}
{% block description %}{{ blog.description_formatted|striptags }}{% endblock %}
{% block activeNav %}blogs{% endblock %}
{% block flag %}Blogs{% endblock %}

{% block links %}
<link rel="alternate" type="application/rss+xml" title="{{ blog.name }}" href="{{ blog.url }}.xml" />
{% endblock %}

{% block content %}
{% import 'macros/meta.tpl' as metaRender %}
<div class="row">
	<div class="span8">

		<h1><a href="{{ blog.url }}.xml"><img src="{{ 'assets/images/icons/rss-57.png'|asset }}" style="max-width:24px;position:relative;top:-2px;" alt="(RSS)" /></a> {{ blog.name }}</h1>

		<hr class="hairline" />

		{% set image = blog.media.grab('type', 'image', true).shift() %}
		{% if image %}
			<div class="image mb">
				<a href="{{ blog.url }}"><img src="{{ image.urlOriginal }}" alt="{{ blog.slug }}" /></a>
			</div>
		{% endif %}

		<div class="body-copy boot mmb">
			{{ blog.description_formatted }}
		</div>

		{% for post in posts %}
			<article class="article">
				<h1><a href="{{ post.url }}">{{ post.headline }}</a></h1>
				<aside class="byline">
					Posted by {{ post.authors.splat('name')|join(', ') }} on
					{{ post.created|date('M d') }} at {{ post.created|date('g:ia') }}
				</aside>

				<div>
					{{ post.abstract_formatted }}
					<p><a href="{{ post.url }}">Continue reading &raquo;</a></p>
				</div>

				<hr class="mb" />
			</article>
		{% endfor %}

		<div class="pagination"><ul>
		{% if pagination.getPrevious() %}
			<li><a href="{{ pagination.getPrevious().url }}">&laquo;</a></li>
		{% endif %}
		{% for page in pagination.getPages() %}
			{% if page.isCurrent() %}
				<li class="active"><a href="{{ page.url }}">{{ page.label }}</a></li>
			{% else %}
				<li><a href="{{ page.url }}">{{ page.label }}</a></li>
			{% endif %}
		{% endfor %}
		{% if pagination.getNext() %}
			<li><a href="{{ pagination.getNext().url }}">&raquo;</a></li>
		{% endif %}
		</ul>
		<div class="clear"></div></div>
	</div>

	<div class="span4">
		{% include 'gryphon/main/sidebar/default.tpl' %}
	</div>
</div>
<hr class="spacer" />
{% endblock content %}