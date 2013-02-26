{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ page.title }}{% endblock %}
{% block activeNav %}home{% endblock %}

{% block content %}

<div class="row">
	<div class="span8">
		<h1>{{ page.title }}</h1>

		{{ page.content_formatted }}
	</div>

	<div class="span4">
		{% include 'gryphon/main/sidebar/default.tpl' %}
	</div>
</div>
{% endblock content %}