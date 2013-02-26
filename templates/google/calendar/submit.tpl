{% extends "gryphon/base.tpl" %}
{% block title %} :: Event Calendar : Submit{% endblock %}
{% block activeNav %}events{% endblock %}
{% block flag %}Events{% endblock %}

{% block content %}

<div class="row">
	<div class="span8">
		<h1>Submit an event listing</h1>

		<hr class="spacer" />

		<div class="body-copy boot mb">
			{% if error %}
				<ul class="error mb">
				{% for item in error %}
					<li>{{ item }}</li>
				{% endfor %}
				</ul>
				<hr class="mb" />
			{% elseif success %}
				<p><strong class="alert">Thanks!</strong></p>

				<p>This event will be reviewed for addition to the Event Calendar.</p>
				<hr class="mb" />
			{% endif %}

			<p>Submit your event listings using the form below. Events will be held for approval by an administrator before appearing on the site.</p>

			<p>If you have a big list of events you'd like considered, or to provide an iCal-formatted feed for us to import, please <a href="{{ 'page/about_us'|url }}">contact us</a> for more information.</p>
		</div>

		<form method="post" action="{{ 'google:calendar/submit'|url }}" class="form-horizontal" id="form_eventSubmit">
			<fieldset>
				<legend>Event Information</legend>
				<div class="control-group">
					<label class="control-label" for="title">Event title</label>
					<div class="controls">
						<input type="text" name="title" size="30" class="input-xlarge" value="{{ posted.title }}" />
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">Date</label>
					<div class="controls">
						<input name="start" type="text" size="12" id="input_dateStart" class="input-medium" placeholder="Start Date" value="{{ posted.start }}" /> <span class="help-inline">mm/dd/yyyy</span>
						<hr class="half spacer" />
						<input name="end" type="text" size="12" id="input_dateEnd" class="input-medium" placeholder="End Date" value="{{ posted.end }}" /> <span class="help-inline">mm/dd/yyyy</span>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">Starts</label>
					<div class="controls">
						<select name="startHour" class="span1">
							<option value="false"></option>
						{% for i in 1..12 %}
							<option value="{{ i }}"{% if i == posted.startHour %} selected="selected"{% endif %}>{{ i }}</option>
						{% endfor %}
						</select>
						:
						<select name="startMinute" class="span1">
							<option value="false"></option>
							<option value="00">00</option>
							<option value="15"{% if posted.startMinute == 15 %} selected="selected"{% endif %}>15</option>
							<option value="30"{% if posted.startMinute == 30 %} selected="selected"{% endif %}>30</option>
							<option value="45"{% if posted.startMinute == 45 %} selected="selected"{% endif %}>45</option>
						</select>
						<select name="startAP" class="span1">
							<option value="false"></option>
							<option value="a"{% if posted.startAP == 'a' %} selected="selected"{% endif %}>am</option>
							<option value="p"{% if posted.AP == 'p' %} selected="selected"{% endif %}>pm</option>
						</select>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">Ends</label>
					<div class="controls">

						<select name="endHour" class="span1">
							<option value="false"></option>
							{% for i in 1..12 %}
								<option value="{{ i }}">{{ i }}</option>
							{% endfor %}
						</select>
						:
						<select name="endMinute" class="span1">
							<option value="false"></option>
							<option value="00">00</option>
							<option value="15"{% if posted.endMinute == 15 %} selected="selected"{% endif %}>15</option>
							<option value="30"{% if posted.endMinute == 30 %} selected="selected"{% endif %}>30</option>
							<option value="45"{% if posted.endMinute == 45 %} selected="selected"{% endif %}>45</option>
						</select>
						<select name="endAP" class="span1">
							<option value="false"></option>
							<option value="a"{% if posted.endAP == 'a' %} selected="selected"{% endif %}>am</option>
							<option value="p"{% if posted.endAP == 'p' %} selected="selected"{% endif %}>pm</option>
						</select>
					</div>
				</div>

				<div class="control-group">
					<label for="description" class="control-label">Description</label>
					<div class="controls">
						<textarea name="description" cols="50" rows="5" style="width:100%;">{{ posted.description }}</textarea>
						<p class="help-block">Tell us about it. Does it repeat? How often?</p>
					</div>
				</div>

				<div class="control-group">
					<label for="location" class="control-label">Location</label>
					<div class="controls">
						<textarea name="location" cols="50" rows="5" style="width:100%;">{{ posted.location }}</textarea>
						<p class="help-block">Include the address if possible.</p>
					</div>
				</div>
			</fieldset>

			<fieldset>
				<legend>Contact Information&nbsp;&nbsp;&nbsp;<span class="label label-warning">All are fields required</span></legend>

				<div class="control-group">
					<label for="sendername" class="control-label">Your name</label>
					<div class="controls">
						<input type="text" name="sendername" size="30" class="input-xlarge" value="{{ posted.sendername }}" />
						<p class="help-block">
							Required but not published
						</p>
					</div>
				</div>

				<div class="control-group">
					<label for="senderemail" class="control-label">Your email</label>
					<div class="controls">
						<input type="text" name="senderemail" size="30" class="input-xlarge" value="{{ posted.senderemail }}" />
						<p class="help-block">
							Required but not published
						</p>
					</div>
				</div>

				<div class="control-group">
					<label for="answer" class="control-label">Verification</label>
					<div class="controls">
						<script type="text/javascript">
						var RecaptchaOptions = {
							theme : 'white'
						};
						</script>
						{% if turing %}
							{{ turing }}
						{% endif %}
					</div>
				</div>
			<fieldset>

			<hr />

			<input type="submit" class="btn btn-primary" value="Submit my event" />

		</form>
	</div>

	<div class="span4">
		{% include 'gryphon/main/sidebar/calendar.tpl' %}
	</div>

</div>
{% endblock content %}