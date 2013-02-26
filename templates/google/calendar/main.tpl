{% extends "gryphon/base.tpl" %}
{% block title %} :: Event Calendar{% endblock %}
{% block activeNav %}events{% endblock %}
{% block flag %}Events{% endblock %}

{% block content %}

<div class="row">
	<div class="span8 calendar-list">
		<h1>{% if timestamp %}Events for {{ timestamp|date('l, F d, Y') }}{% else %}Upcoming Events{% endif %}</h1>

		<hr class="double spacer" />

		{% if events.length %}
			{% for event in events %}

				<h2 class="row">
					<div class="span1">
						<span class="label label-success" style="background-color:{{ event.calendar.color }};">{{ event.calendar.title }}</span>
					</div>
					<div class="span5">
						<a href="{{ event.url }}">{{ event.title }}</a>
					</div>
					<div class="span2 text-right">
						<span class="small">
							{% if event.allDay %}
								All day
							{% elseif event.start_time == event.end_time %}
								{{ event.start_time|date('g:ia m/d/y') }}
							{% else %}
								{{ event.start_time|date('g:ia') }} - {{ event.end_time|date('g:ia m/d/y') }}
							{% endif %}
						</span>
					</div>
				</h2>

				<div class="row">
					<div class="span7 offset1">
						<p>{{ event.abstract }}</p>

						{% if event.location %}
							<hr class="spacer" />

							<p>{{ event.location }}</p>
						{% endif %}
					</div>
				</div>
				<hr />
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
		{% else %}
			<p>No events found for this day and/or category.</p>
		{% endif %}

		<div class="mb"></div>
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
