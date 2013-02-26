{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ page.title }}{% endblock %}
{% block activeNav %}home{% endblock %}

{% block content %}

<div class="row">
	<div class="span8">
		<h1>Love Connection Survey</h1>

		<hr class="spacer" />

		<p>Want to find your soul mate? One night stand? New best friend? Person you awkwardly wave to? Sign up for the Cavalier Daily's Love Connection. Fill out a questionnaire and then we'll match you based on the compatibility of your answers.</p>

		<p>E-mail your completed survey to <a href="mailto:loveconnection@cavalierdaily.com">loveconnection@cavalierdaily.com</a></p>

		<h3><a href="http://cdn.cav.s3.amazonaws.com/assets/documents/LoveConnectionSurvey.docx">Download Survey</a></h3>

	</div>

	<div class="span4">
		{% include 'gryphon/main/sidebar/default.tpl' %}
	</div>
</div>
{% endblock content %}