{% extends "gryphon/base.tpl" %}
{% block title %} :: Advanced Search{% endblock %}
{% block flag %}Search{% endblock %}

{% block content %}

{% set months = [
	'01': 'January',
	'02': 'February',
	'03': 'March',
	'04': 'April',
	'05': 'May',
	'06': 'June',
	'07': 'July',
	'08': 'August',
	'09': 'September',
	'10': 'October',
	'11': 'November',
	'12': 'December'
] %}

{% set types = [
	'article',
	'media',
	'page',
	'section',
	'comment'
] %}

<div class="row">
	<div class="span8">
		<h1>Archive search</h1>


		<p>Use the form below to search our archives{% if config.get('dsw:archivedate') %} dating back to {{ config.get('dsw:archivedate') }}{% endif %}.</p>

		<hr class="spacer" />

		<form method="get" action="{{ 'search'|url }}" class="form-horizontal">
			<input type="hidden" name="a" value="1" />
			<fieldset>
				<div class="control-group">
					<label for="input_search" class="control-label">Find</label>
					<div class="controls">
						<input type="text" id="input_search" name="s" class="input-xlarge" value="{{ query.subject }}" />
					</div>
				</div>
				<div class="control-group">
					<label for="input_title" class="control-label">Headline</label>
					<div class="controls">
						<input type="text" id="input_title" name="ti" class="input-xlarge" value="{{ query.title }}" />
					</div>
				</div>
				<div class="control-group">
					<label for="input_author" class="control-label">Writer/Photographer</label>
					<div class="controls">
						<input type="text" id="input_author" name="au" class="input-large" value="{{ query.author }}" />
					</div>
				</div>
				<div class="control-group">
					<label for="input_tag" class="control-label">Tagged</label>
					<div class="controls">
						<input type="text" id="input_tag" name="tg" class="input-large" value="{{ query.tag }}" />
					</div>
				</div>

				<div class="control-group">
					<label for="input_startDate" class="control-label">From</label>
					<div class="controls">
						<select name="ts_month" class="span2">
							<option value="0">Month</option>
							{% for val,label in months %}
								<option value="{{ val }}"{% if query.time_startMonth == val %} selected="selected"{% endif %}>{{ label }}</option>
							{% endfor %}
						</select>
						<select name="ts_day" class="span1">
							<option value="0">Day</option>
							{% for i in 1..31 %}
								<option value="{{ i }}"{% if query.time_startDay == i %} selected="selected"{% endif %}>{{ i }}</option>
							{% endfor %}
						</select>
						<select name="ts_year" class="span1">
							<option value="0">Year</option>
							{% if config.get('dsw:archivedate') %}
								{% set b = config.get('dsw:archivedate') %}
							{% else %}
								{% set b = 2000 %}
							{% endif %}
							{% set n = now|date('Y') %}

							{% for i in b..n %}
								<option value="{{ i }}"{% if query.time_startYear == i %} selected="selected"{% endif %}>{{ i }}</option>
							{% endfor %}
						</select>
					</div>
				</div>

				<div class="control-gorup">
					<label for="input_endDate" class="control-label">To</label>
					<div class="controls">
						<select name="te_month" class="span2">
							<option value="0">Month</option>
							{% for val,label in months %}
								<option value="{{ val }}"{% if query.time_endMonth == val %} selected="selected"{% endif %}>{{ label }}</option>
							{% endfor %}
						</select>
						<select name="te_day" class="span1">
							<option value="0">Day</option>
							{% for i in 1..31 %}
								<option value="{{ i }}"{% if query.time_endDay == i %} selected="selected"{% endif %}>{{ i }}</option>
							{% endfor %}
						</select>
						<select name="te_year" class="span1">
							{% if config.get('dsw:archivedate') %}
								{% set b = config.get('dsw:archivedate') %}
							{% else %}
								{% set b = 2000 %}
							{% endif %}
							{% set n = now|date('Y') %}

							<option value="0">Year</option>
							{% for i in b..n %}
								<option value="{{ i }}"{% if query.time_endYear == i %} selected="selected"{% endif %}>{{ i }}</option>
							{% endfor %}
						</select>
					</div>
				</div>

				<div class="control-group">
					<label for="input_type" class="control-label">Type</label>
					<div class="controls">
						<select name="ty" id="input_type" class="span2">
							<option value="0">Any</option>
							{% for val in types %}
								<option value="{{ val }}"{% if query.type == val %} selected="selected"{% endif %}>{{ val }}</option>
							{% endfor %}
						</select>
					</div>
				</div>

				<div class="control-group">
					<label for="input_order" class="control-label">Sort by</label>
					<div class="controls">
						<select name="o" id="input_order" class="span1">
							<option value="date"{% if query.order == 'date' %} selected="selected"{% endif %}>Date</option>
							<option value="title"{% if query.order == 'title' %} selected="selected"{% endif %}>Title</option>
						</select>
					</div>
				</div>
			</fieldset>

			<hr class="spacer" />

			<input type="submit" value="Search" class="btn btn-primary btn-large" />
		</form>

		<hr class="mb" />

		{% if hits %}
			<h2 class="mmb">{{ pagination.total|int2noun('result') }}</h2>

			<hr class="mmb" />

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

			<div class="clear mb"></div>

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

			<div class="clear mb"></div>

			<div class="clear"> </div>
		{% elseif query.subject or query.title or query.author or query.tag or query.type or query.time_startMonth %}
			<p class="body-copy">Sorry! No results were found.</p>
		{% endif %}

	</div>

	<div class="span4">
		{% include 'gryphon/main/sidebar/default.tpl' %}
	</div>

</div>
{% endblock content %}