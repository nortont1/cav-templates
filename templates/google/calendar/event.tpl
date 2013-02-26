{% extends "gryphon/base.tpl" %}
{% block title %} :: Event Calendar : {{ event.title }}{% endblock %}
{% block activeNav %}events{% endblock %}
{% block flag %}Events{% endblock %}

{% block scripts %}
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyDpda3abfKhNmVOLO-WtRgvAbg98PxfMjU"></script>
{% endblock %}

{% block content %}
<div class="row">
	<div class="span8">

		<h1>
			<span class="label label-success" style="background-color:{{ event.calendar.color }};">{{ event.calendar.title }}</span>
			{{ event.title }}
		</h1>
		<hr />

		<aside class="small">
			{% if event.allDay %}
				All day
			{% elseif event.start_time == event.end_time %}
				{{ event.start_time|date('g:ia m/d/y') }}
			{% else %}
				{{ event.start_time|date('g:ia') }} - {{ event.end_time|date('g:ia m/d/y') }}
			{% endif %}
		</aside>

		<hr class="spacer" />

		<p>
			{{ event.content_formatted }}
		</p>
		{% if event.location %}
			<hr class="spacer" />

			<p>{{ event.location }}</p>
		{% endif %}

		<hr class="spacer" />

		<div id="calendar-map" data-coordinates="{{ config.get('google:coordinates')|join(',') }}"{% if event.location %} data-location="{{ event.location }}"{% endif %}></div>

		<hr class="double spacer" />

		{{ disqus.list(event) }}

	</div>

	<div class="span4">
		{% include 'google/calendar/calendar.tpl' %}

		<hr class="mb" />
		<p>Are we missing something?</p>
		<a href="{{ 'google:calendar/submit'|url }}" class="btn btn-primary">Submit an event listing <i class="icon-calendar"></i></a>

		<hr class="mb" />

		{% include 'gryphon/main/sidebar/default.tpl' %}
	</div>
</div>
{% endblock content %}