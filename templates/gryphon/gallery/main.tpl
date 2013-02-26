{% extends "gryphon/base.tpl" %}
{% block title %} :: Multimedia : {{ gallery.title }}{% endblock %}
{% block description %}{{ gallery.description_formatted|striptags }}{% endblock %}
{% block activeNav %}multimedia{% endblock %}
{% block flag %}Multimedia{% endblock %}

{% block content %}
{% import "macros/meta.tpl" as metaRender %}
{% set top = gallery %}
{% fetch galleries from gallery with [
	'limit': 10,
	'order': 'created desc',
	'where': 'status = 1 AND uid != ' ~ top.uid
] %}


<div class="row">
	<div class="span8 gallery-container">
		<h1>{{ gallery.title }}</h1>

		<hr class="spacer" />

		<ul class="pager">
			<li class="previous">
				<a href="#"><i class="icon-arrow-left icon-white"></i></a>
			</li>
			<li class="next">
				<a href="#"><i class="icon-arrow-right icon-white"></i></a>
			</li>
		</ul>

		<div id="gallery_{{ gallery.uid }}">
			<div class="text-center">
				<img src="{{ image.url }}" class="grayborder" />
			</div>
			<hr class="double spacer" />
			<aside class="credit">
				{% if image.authors.length %}
					By {{ image.authors.splat('name')|join(', ') }}
				{% else %}
					&nbsp;
				{% endif %}



				<span class="pull-right">
					{{ image.created|timeSince }}
				</span>
			</aside>
			<p class="copy">
				{{ image.caption_formatted }}
			</p>
		</div>

		<hr class="double spacer clearfix" />

		<ul class="unstyled gallery-list">
		{% for image in gallery.mediaOrdered %}
				<li><a href="{{ image.url }}" class="inline-gallery" rel="gallery_{{ gallery.uid }}" title="<![CDATA[{{ image.caption_formatted|striptags }}]]>" data-author="{{ image.authors.splat('name')|join(', ') }}" data-created="{{ image.created|timeSince }}"><img src="{{ image.urlPreview }}" /></a></li>
		{% endfor %}
		</ul>


	</div>
	<div class="span4">
		{% include 'gryphon/main/sidebar/default.tpl' %}
	</div>

	<hr class="spacer" />
</div>

{% raw %}
<script id="gallery-template" type="text/x-handlebars-template">
	<div class="text-center">
		<img src="{{ url }}" />
		<hr class="double spacer" />
	</div>
	<aside class="credit">
		{{ author }}
		<span class="pull-right">
			{{ created }}
		</span>
	</aside>
	<hr class="spacer" />
	<p class="copy">
		{{ caption }}
	</p>
</script>
{% endraw %}

{% endblock content %}
