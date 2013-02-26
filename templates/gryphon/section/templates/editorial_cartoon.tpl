{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ section.name }}{% endblock %}
{% block activeNav %}{{ active }}{% endblock %}

{% block links %}
<link rel="alternate" type="application/rss+xml" title="{{ config.get('gryphon:publication:name') }} :: {{ section.name }}" href="{{ (section.url~'.xml')|url }}" />
{% endblock %}

{% block content %}

{% import "macros/article.tpl" as articleRender %}
{% import "macros/meta.tpl" as metaRender %}

	<div class="row">
		<div class="span8">

            <h1>{{ section.name }}</h1>

            <hr class="spacer" />

            {% fetch images from media with [
                'order': 'created desc',
                'where': 'status = 1',
                'limit': 20,
                'withTags': section.tags.splat('name')
            ] %}
            {% set author = images[0].authors[0].name %}
            {% for image in images %}
                <div style="display:block;text-align:center;"><img src="{{ image.url }}" /></div>
                <br />
                {% if author.length %}By {{author.name }}&nbsp;&nbsp;&nbsp;&nbsp;{% endif %}Published {{ image.created|timeSince }}
                <br />
                <hr />
            {% endfor %}

            <h2><a href="{{ 'search'|url(['a':1,'tg':'Editorial Cartoons']) }}">More {{ section.name }}</a></h2>
            <br />

		</div>
		<div class="span4">

			{% include 'gryphon/main/sidebar/default.tpl' %}
		</div>
	</div>


{% endblock content %}