{% helper calendar %}
{{ calendar.setTime(timestamp) }}


<h3 class="text-center calendar-header">
	<a href="{{ 'google:calendar'|url(['time': calendar.previousTime]) }}" class="prev"><i class="icon-chevron-left"></i></a>
	{{ calendar.name }}
	<a href="{{ 'google:calendar'|url(['time': calendar.nextTime]) }}" class="next"><i class="icon-chevron-right"></i></a>
</h3>

<hr class="double spacer" />

<table id="calendar" cellspacing="0">
	<tbody>
		<tr class="day">
		{% for day in ['Su', 'M', 'Tu', 'W', 'Th', 'F', 'Sa'] %}
			<th{% if loop.index0 == calendar.now|date('w') %} class="selected"{% endif %}>{{ day }}</th>
		{% endfor %}
		</tr>
		{% for week in calendar.weeks %}
			<tr>
			{% for day in week.days %}
				{% if day.isCurrentMonth() %}
					<td{% if day.isCurrent() %} class="active"{% elseif week.isCurrent() %} class="currentweek"{% endif %}><a href="{{ 'google:calendar'|url(['time':day.time]) }}">{{ day.date }}</a></td>
				{% else %}
					<td class="inactive">{{ day.date }}</td>
				{% endif %}
			{% endfor %}
			</tr>
		{% endfor %}
	</tbody>
</table>

<hr class="double spacer" />

<h3 class="text-center">Categories</h3>
<ul class="unstyled">
	{% fetch calendars from google:calendar with [
		'order': 'title asc'
	] %}
	{% for calendar in calendars %}
		<li>
			<span class="label label-success" style="background-color:{{ calendar.color }};">&nbsp;&nbsp;</span> <a href="{{ calendar.url }}?time={{ timestamp }}">{{ calendar.name }}</a>
			<hr class="half spacer" />
		</li>
	{% endfor %}
</ul>
