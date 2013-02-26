{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ section.name }}{% endblock %}
{% block activeNav %}{{ active }}{% endblock %}

{% block links %}
<link rel="alternate" type="application/rss+xml" title="{{ config.get('gryphon:publication:name') }} :: {{ section.name }}" href="{{ (section.url~'.xml')|url }}" />
{% endblock %}

{% block content %}

{% fetch sections from section with [
    'order': 'name asc',
    'where': 'status = 1 and slug != "comics"',
    'withTags': ['Comics']
] %}



{% import "macros/article.tpl" as articleRender %}
{% import "macros/meta.tpl" as metaRender %}

	<div class="row">
		<div class="span8">

            {% if section.slug == 'comics' %}
                {% for sec in sections %}
                    {% fetch image from media with [
                        'order': 'created desc',
                        'limit': 1,
                        'where': 'status = 1',
                        'withTags': sec.tags.splat('name')
                    ] %}
                    {% if image.length %}
                        <h1><a href="{{ sec.url }}">{{ sec.name|default('Comic') }}</a></h1>
                        <a href="{{ sec.url }}"><img src="{{ image[0].url }}" /></a>
                        {% if image[0].authors.length %}
                        <br />
                        By {{ image[0].authors.splat('name')|join(', ') }}
                        {% endif %}
                        <br />
                        <a href="{{ sec.url }}">More {{ sec.name }} &#187;</a>
                        <br /><hr />
                        <br />
                    {% endif %}
                {% endfor %}
            {% else %}
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
                    <img src="{{ image.url }}" />
                    <br />
                    {% if author.uid %}By {{author.name }}&nbsp;&nbsp;&nbsp;&nbsp;{% endif %}Published {{ image.created|timeSince }}
                    <br />
                    <hr />
                {% endfor %}

                <h2><a href="{{ 'search'|url(['a':1,'au':author]) }}">More {{ section.name }}</a></h2>
                <br />
            {% endif %}

		</div>
		<div class="span4">

			{% include 'gryphon/main/sidebar/default.tpl' %}
		</div>
	</div>


{% endblock content %}