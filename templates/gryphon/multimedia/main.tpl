{% extends "gryphon/base.tpl" %}
{% block title %} :: Multimedia : {{ media[0].title }}{% endblock %}
{% block description %}{{ media[0].caption_formatted|striptags }}{% endblock %}
{% block activeNav %}multimedia{% endblock %}

{% block scripts %}
    <script>
        $(function() {
            $('[data-action="launch-gallery"]').click(function(e) {
                e.preventDefault();
                $.fancybox($('.fancybox-thumb'), {
                    prevEffect	: 'none',
                    nextEffect	: 'none',
                    closeBtn    : false,
                    helpers	: {
                        buttons	: {},
                        thumbs	: {
                            width	: 50,
                            height	: 50
                        }
                    }
                });
            });

            $(".fancybox-thumb").fancybox({
                prevEffect	: 'none',
                nextEffect	: 'none',
                closeBtn    : false,
                helpers	: {
                    buttons	: {},
                    thumbs	: {
                        width	: 50,
                        height	: 50
                    }
                }
            });
        });
    </script>
{% endblock %}

{% block content %}
{% import "macros/meta.tpl" as metaRender %}
{% import "macros/render.tpl" as render %}

{% set top = media.shift() %}
<div class="row">
	<div class="span8">

		<div class="row">
			<div class="span6">
			{% if top %}

				<article class="abstract">
					{% if top.type == 'image' and top.gallery %}
    					<h1><a href="{{ top.urlDefault }}" data-action="launch-gallery">Gallery: {{ top.gallery.title }}</a></h1>
                        <hr class="spacer" />
                        <div class="box">
                            <a class="fancybox-thumb" rel="fancybox-thumb" href="{{ top.url }}" title="{{ top.title }}">
                                <img src="{{ top.url }}" alt="" />
                            </a>
                            <h3><a href="#" data-action="launch-gallery">Launch Gallery</ha></h3>

                            <div class="thumbnails hidden">
                                {% for item in top.gallery.mediaOrdered %}
                                <a class="fancybox-thumb" rel="fancybox-thumb" href="{{ item.url }}" title="{{ item.title }}">
                                    <img src="{{ item.urlThumbnail }}" style="max-height:50px;max-width:50px" />
                                </a>
                                {% endfor %}
                            </div>

                        </div>
					{% else %}
                        <h1><a href="{{ top.urlDefault }}">{{ top.title }}</a></h1>
                        <hr class="spacer" />
                        <div class="box">
        					{{ render.media(top) }}
    					</div>
    				{% endif %}
				</article>

			{% endif %}
			</div>

			<div class="span2">

				{% set toolitem = top %}
				{% include 'gryphon/multimedia/tools.tpl' %}

				<article class="abstract">
					<hr class="spacer" />

					<aside class="by-line">
					 by {{ top.authors.splat('name')|join(' and ') }}<br />
					 {{ top.created|timeSince }} | <a href="{{ top.urlDefault }}#disqus-thread"><i class="icon-comment"></i></a>
					</aside>
					<p>
						{{ top.caption_formatted|strip }}
					</p>
				</article>


				{% if top.articles.length %}
				<div class="mb">
					<div class="caption aside"><strong>Related:</strong></div>
					{% for article in top.articles %}
					<div class="aside mmb"><a href="{{ article.url }}">{{ article.headline }}</a></div>
					{% endfor %}
				</div>
				{% endif %}
			</div>
		</div>

		<hr class="spacer">

		<div class="row">
			<div class="span8">
			    <h4>More Multimedia:</h4>
				<ul class="thumbnails">
					{% for item in media %}
					<li class="span2" style="height:220px;">
					    <div class="thumbnail">
    						<a href="{{ item.urlDefault }}"><img src="{{ item.urlPreview }}" class="flex-image" style="max-height:150px;" /></a>
    						<br />
    						<h5><small style="font-size:0.8em;">{{ item.type }}:</small> <a href="{{ item.urlDefault }}">{{ item.title }}</a></h5>
    					</div>
					</li>
					{% endfor %}
				</ul>
			</div>

			<hr class="spacer" />
			<div class="span8">
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
				</ul></div>
			</div>

			{% if allowComment %}
				<hr class="spacer" />
				<div class="span8">
					{{ disqus.list(top) }}
				</div>
			{% endif %}
		</div>

	</div>

	<div class="span4">
		{% include 'gryphon/main/sidebar/default.tpl' %}
	</div>

</div>
{% endblock content %}