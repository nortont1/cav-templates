{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ blog.name }} : {{ post.headline }}{% endblock %}
{% block activeNav %}blogs{% endblock %}
{% block flag %}Blogs{% endblock %}


{% block content %}

{% import "macros/meta.tpl" as metaRender %}
{% helper commentHelper %}

{% set mugShot = post.media.grab('meta', 'mugshot', true) %}
{% set images = post.media.grab('type', 'image', true) %}

{% set video = post.media.grab('type', 'video', true) %}
{% set audio = post.media.grab('type', 'audio', true) %}
{% set slides = post.media.grab('type', 'soundSlide', true) %}
{% set interactives = post.media.grab('type', 'flash', true) %}
{% set pdfs = post.media.grab('type', 'pdf', true) %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}

<div class="row">
	<div class="span8">
			<article class="article">

				{% if commentHelper.userHasSession() %}
					<a href="{{ post.getEditURL() }}" class="btn btn-danger" target="_gedit">EDIT THIS</a>
					<br /><br />
				{% endif %}
				<h5><a href="{{ post.blog.url }}.xml"><img src="{{ 'assets/images/icons/rss-57.png'|asset }}" style="max-width:16px;position:relative;top:-2px;" alt="(RSS)" /></a>&nbsp;&nbsp; <a href="{{ post.blog.url }}">{{ post.blog.name }}</a></h5>
				<h1>{{ post.headline }}</h1>

				<aside class="byline">
					Posted by {{ post.authors.splat('name')|join(', ') }} on
					{{ post.created|date('M d') }} at {{ post.created|date('g:ia') }}
				</aside>

                <div class="row-fluid">
                    <div class="span8">
                        {{ post.copy_formatted }}
                    </div>
                    <div class="span4">
                        <div class="fb-like" data-send="false" data-layout="button_count" data-width="150" data-show-faces="false"></div>
                        <hr class="spacer" />
                        <a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>
                        <hr class="spacer" />
                        <a href="http://pinterest.com/pin/create/button/?url={{ post.url|url }}" class="pin-it-button" count-layout="horizontal"><img border="0" src="//assets.pinterest.com/images/PinExt.png" title="Pin It" /></a>
                        <hr class="spacer" />

                        <hr class="hairline" />

                        {% fetch recently from blogPost with [
                            'where': 'status = 1 and blog_id = ' ~ post.blog_id,
                            'order': 'created desc',
                            'limit': 5
                        ] %}

                        <div class="box">
                            <h3>More from {{ post.blog.name }}</h3>
                            <ul class="item-list">
                                {% for item in recently %}
                                    <li><h4><a href="{{ item.title }}">{{ item.title }}</a> <span> | {{ item.created|date('M d') }}</span></h4></li>
                                {% endfor %}
                            </ul>
                        </div>

                    {% for image in images %}
                        <a href="{{ image.url }}" rel="post" class="fancybox">
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
                </div>

				<hr class="double hairline" />

				<div class="well">
					Posted in <a href="{{ post.blog.url }}">{{ post.blog.name }}</a> on {{ post.created|date('F j, Y') }}

					{% if post.tags.length %}
						{% if limit %}Tagged {% endif %}

						{{ post.tags.splat('name').join(', ') }}
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
			{{ disqus.list(post) }}
		</div>
		<div class="span4">

		</div>
	</div>

{% endblock content %}