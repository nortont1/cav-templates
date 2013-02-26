{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ article.headline }}{% endblock %}
{% block activeNav %}{{ active }}{% endblock %}

{% block links %}
<link rel="canonical" type="text/html" href="{{ shortUrl }}" />
<link rel="alternate shorter" type="text/html" href="{{ shortUrl }}" />
<link rel="alternate" type="application/rss+xml" title="{{ article.headline }} : Comments" href="{{ article.url }}.xml" />

<meta property="og:type"                 content="article">
<meta property="og:locale"               content="en_US">
<meta property="og:title" content="{{ article.headline }}"/>
<meta property="og:url" content="{{ article.url }}"/>

	{% if article.media.grab('type', 'image').length %}
    	<meta property="og:image" content="{{ article.media.grab('type', 'image')[0].urlPreview }}">
	{% else %}
    	<meta property="og:image" content="{{ 'assets/images/fb-cavdaily-logo.jpg'|asset }}">
    	<meta property="og:image:width" content="120" />
    	<meta property="og:image:height" content="120" />
	{% endif %}

<meta property="og:title"                content="{{ article.headline }}">
<meta property="og:description"          content="{{ article.abstract_formatted|striptags }}">
<meta property="article:published_time"  content="{{ article.created|date('Y-m-d H:i:s') }}">
<meta property="article:modified_time"   content="{{ article.modified|date('Y-m-d H:i:s') }}">
	
{% endblock %}

{% block content %}

	{% helper dswSync %}
	{% helper commentHelper %}
	{% import "macros/meta.tpl" as metaRender %}
	{% import "macros/render.tpl" as mediaRender %}

	{% set mugShot = article.media.grab('meta', 'mugshot', true) %}
	{% set images = article.media.grab('type', 'image', true) %}

	{% set video = article.media.grab('type', 'video', true) %}
	{% set audio = article.media.grab('type', 'audio', true) %}
	{% set slides = article.media.grab('type', 'soundSlide', true) %}
	{% set interactives = article.media.grab('type', 'flash', true) %}
	{% set pdfs = article.media.grab('type', 'pdf', true) %}

	{% set sections = article.sections %}

	<div class="row">
		<div class="span8">
			<article class="article">

				{% if commentHelper.userHasSession() %}
					<a href="{{ article.getEditURL() }}" class="btn btn-danger" target="_gedit">EDIT THIS</a>
					<br /><br />
				{% endif %}

				<h1>{{ article.headline }}</h1>
				{% if article.subhead %}
					<h3>{{ article.subhead }}</h3>
				{% endif %}

				<aside class="byline">
					By {{ article.authors.splat('name')|join(', ') }} |
					{{ article.created|date('M d') }}
				</aside>

				{% if 'Comics'|in(article.tags.splat('name')) %}

					<div class="media">
						<div class="fb-like" data-send="false" data-layout="button_count" data-width="150" data-show-faces="false"></div>
						<hr class="spacer" />
						<a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>
						<hr class="spacer" />
						<a href="http://pinterest.com/pin/create/button/?url={{ article.url|url }}" class="pin-it-button" count-layout="horizontal"><img border="0" src="//assets.pinterest.com/images/PinExt.png" title="Pin It" /></a>
						<hr class="spacer" />
					</div>
					
					<img src="{{ images[0].url }}" alt="{{ images[0].base_name }}" class="float:left;" />
					
					<br />
					<aside>
						Published {{ images[0].created|timeSince }}
					</aside>

				{% else %}

					<div class="media">
						<div class="fb-like" data-send="false" data-layout="button_count" data-width="150" data-show-faces="false"></div>
						<hr class="spacer" />
						<a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>
						<hr class="spacer" />
						<a href="http://pinterest.com/pin/create/button/?url={{ article.url|url }}" class="pin-it-button" count-layout="horizontal"><img border="0" src="//assets.pinterest.com/images/PinExt.png" title="Pin It" /></a>
						<hr class="spacer" />
						
					{% for image in images %}
						<a href="{{ image.url }}" rel="article" class="fancybox">
							<img src="{{ image.urlPreview }}" alt="{{ image.base_name }}" style="max-width:100%" />
						</a>

						<aside class="byline">
							{{ metaRender.smCred(image) }}
						</aside>
						<div class="caption">
							{{ image.caption_formatted }}
						</div>

						<hr class="spacer" />

					{% endfor %}

						{% if video.length or audio.length or slides.length or interactives.length or pdfs.length %}
							<hr class="half hairline" />

							{% for item in audio %}
								<h5><i class="icon-music"></i> {{ item.title }}</h5>
								{{ mediaRender.media(item) }}
								<hr class="double hairline" />
							{% endfor %}

							{% for item in pdfs %}
								<h5><i class="icon-file"></i> {{ item.title }}</h5>
								<a class="offset" href="{{ item.urlOriginal }}">Download PDF</a>
								<hr class="double hairline" />
							{% endfor %}

							{% for item in video %}
								<h5><i class="icon-film"></i> {{ item.title }}</h5>
								<a href="{{ item.urlDefault }}" class="offset">
									<img src="{{ item.urlPreview }}" />
								</a>
								<hr class="double hairline" />
							{% endfor %}

						{% endif %}

					</div>
				{% endif %}

				{{ article.copy_formatted }}

				<hr class="double hairline" />

				<div class="well">
					Published {{ article.created|date('F j, Y') }}

					{% if sections.length %}
						{% set limit = sections.length %}
						{% if config.get('gryphon:default:section')|in(sections.splat('slug')) %}
							{% set limit = limit-1 %}
						{% endif %}

						{% if limit %}in {% endif %}

						{% for section in sections %}
							{% if section.slug == config.get('gryphon:default:section') %}
							{% else %}
								<a href="{{ section.url }}">{{ section.name }}</a>{% if loop.index < limit %}, {% endif %}
							{% endif %}
						{% endfor %}
					{% endif %}
				</div>

			</article>
		</div>
		<div class="span4">
			{% include 'gryphon/main/sidebar/default.tpl' %}
		</div>
	</div>

	<hr class="spacer" />

	<div class="row">
		<div class="span8">
			{{ disqus.list(article) }}
		</div>
		<div class="span4">

		</div>
	</div>

{% endblock %}
