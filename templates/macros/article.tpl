{% macro dom(article) %}
	{% import "macros/disqus.tpl" as disqus %}
    {% import "macros/render.tpl" as render %}
	<article class="abstract five-column">
		{% set images = article.media.grab('type', 'image', true) %}
		{% set video = article.media.grab('type', 'video', true) %}

		{% if (video.length and images.length and video[0].weight > images[0].weight) or video.length and not images.length %}
		<div class="box">
			{{ render.media(video[0]) }}
		</div>
		<hr class="spacer" />
		{% elseif images.length %}
		<div class="box">
			<a href="{{ article.url }}"><img src="{{ images[0].url }}" class="block flex-image" /></a>
			<aside>
				{{ images[0].authors.splat('name')|join(' and') }} - {{ images[0].source }}
			</aside>
		</div>
		<hr class="spacer" />
		{% endif %}
		<h1><a href="{{ article.url }}">{{ article.headline }}</a></h1>
		<aside class="by-line">
		 by {{ article.authors.splat('name')|join(' and ') }} | {{ article.created|timeSince }} | {{ disqus.countlink(article) }}
		</aside>
		<p>
			{{ article.abstract|strip }}
			<br />
			<a href="{{ article.url }}">read more <i class="icon-chevron-right"></i></a>
		</p>
	</article>
{% endmacro %}

{% macro threeCol(article) %}
	{% import "macros/disqus.tpl" as disqus %}
	<article class="three-column abstract">
		<h2><a href="{{ article.url }}">{{ article.headline }}</a></h2>
		<aside class="by-line">
		 by {{ article.authors.splat('name')|join(' and ') }} | {{ article.created|timeSince }} | {{ disqus.countlink(article) }}
		</aside>
		<p>
			{% if article.media[0].type == 'image' %}
				<a href="{{ article.url }}"><img src="{{ article.media[0].urlThumbnail }}" style="max-width:100px" /></a>
			{% endif %}
			{{ article.abstract|strip }}
			<br />
			<a href="{{ article.url }}">read more <i class="icon-chevron-right"></i></a>
		</p>
	</article>

{% endmacro %}

{% macro fourCol(article) %}
	{% import "macros/disqus.tpl" as disqus %}
	<article class="four-column abstract">
		<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>
		<aside class="by-line">
		 by {{ article.authors.splat('name')|join(' and ') }} | {{ article.created|timeSince }} | {{ disqus.countlink(article) }}
		</aside>
		<p>
			{% if article.media[0].type == 'image' %}
				<a href="{{ article.url }}"><img src="{{ article.media[0].urlThumbnail }}" style="max-width:100px" /></a>
			{% endif %}
			{{ article.abstract|strip|clip(150) }}
			<br />
			<a href="{{ article.url }}">read more <i class="icon-chevron-right"></i></a>
		</p>
	</article>

{% endmacro %}

{% macro fiveCol(article) %}
	{% import "macros/disqus.tpl" as disqus %}
	<article class="abstract five-column">
		<h2><a href="{{ article.url }}">{{ article.headline }}</a></h2>
		<aside class="by-line">
		 by {{ article.authors.splat('name')|join(' and ') }} | {{ article.created|timeSince }} | {{ disqus.countlink(article) }}
		</aside>
		<p>
			{% if article.media[0].type == 'image' %}
				<a href="{{ article.url }}"><img src="{{ article.media[0].urlThumbnail }}" style="max-width:100px" /></a>
			{% endif %}
			{{ article.abstract|strip }}
			<br />
			<a href="{{ article.url }}">read more <i class="icon-chevron-right"></i></a>
		</p>
	</article>

{% endmacro %}

