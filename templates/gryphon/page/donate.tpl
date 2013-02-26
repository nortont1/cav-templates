{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ page.title }}{% endblock %}
{% block activeNav %}home{% endblock %}

{% block content %}

<div class="row">
	<div class="span6">
		<h1>Donate to The Cavalier Daily</h1>

		<hr class="spacer" />

		<p>Cavalier Daily readers,</p>

		<p>We appreciate all the support which you have offered our organization during the past several weeks, including queries about how to make a donation.</p>

		<p>Because The Cavalier Daily is a financially independent, non-profit corporation which receives no funding from the University, we must earn enough money ourselves to cover numerous expenses including rent, printing, courier services, debt repayment and digital maintenance. Contributions are welcome, especially given the major projects we are undertaking to expand our coverage in the fall semester. Among these are a comprehensive website redesign and the establishment of a Cavalier Daily multimedia section for the first time in the organization's history.</p>

		<p>You can make a tax-deductible donation by clicking the button below, which takes you to our secure PayPal account. The page is set up to receive contributions in whatever amount you designate. We look forward to using the money we raise to further our mission of providing honest and accurate information to students, faculty, staff, alumni and others in the general public.</p>

		<p>
			Sincerely,<br />
			Matthew Cameron<br />
			Editor-in-Chief
		</p>


	</div>
	<div class="span2">
		<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
		<input type="hidden" name="cmd" value="_s-xclick">
		<input type="hidden" name="hosted_button_id" value="426KW9M24GJES">
		<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
		<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
		</form>
	</div>

	<div class="span4">
		{% include 'gryphon/main/sidebar/default.tpl' %}
	</div>
</div>
{% endblock content %}