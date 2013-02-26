{% extends "gryphon/base.tpl" %}
{% block title %} :: Search{% endblock %}
{% block flag %}Search{% endblock %}


{% block content %}

<div class="row">
	<div class="span8">
		<a href="{{ 'search/?a=1'|url }}">Advanced Search</a>

		<h1>{{ pagination.total|int2noun('result') }} for <em>{{ query }}</em></h1>

		<hr class="spacer"/>

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
		</ul></div>

		<hr class="spacer" />

		{% for item in hits %}
			{% if item.type == 'media' %}
				<div class="thumb mb" style="overflow:hidden;"><a href="{{ item.url|url }}">
					<img src="{{ item.misc.urlThumbnail }}" alt="{{ item.title }}" />
				</a></div>
			{% endif %}
			<div>
				<h3 class="mmb"><a href="{{ item.url|url }}">{{ item.title }}</a></h3>

				<p>{{ item.description }}</p>

				<div class="aside mmb"><em><a href="{{ item.url|url }}">{{ item.url|qualifiedUrl }}</a></em></div>
			</div>
			<div class="caption mb">Published {{ item.created|date('F j, Y') }}</div>

			<div class="clear"> </div>
			<hr class="mmb" />
		{% endfor %}

		<hr class="spacer" />

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
		</ul></div>

	</div>

	<div class="span4">
		{% include 'gryphon/main/sidebar/default.tpl' %}
	</div>

</div>
{% endblock content %}