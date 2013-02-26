{% extends "gryphon/base.tpl" %}
{% block title %} :: RSS Feeds{% endblock %}
{% block activeNav %}home{% endblock %}

{% block content %}
{% import "macros/meta.tpl" as metaRender %}


{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
	<div class="row">
		<div class="span8">
			<h1>Classified</h1>

			<div id="Partner_API_CampusAve" partnerid="542" partnerdomain="http://cavalierdaily.campusave.com/">
			loading content...
			</div>
			<script type="text/javascript" src="http://cavalierdaily.campusave.com/includes/api.js"></script>

		</div>
		<div class="span4">
			{% include 'gryphon/main/sidebar/default.tpl' %}

		</div>
	</div>
{% endblock content %}
