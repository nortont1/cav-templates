
{% fetch galleries from gallery with [
	'order': 'created desc',
	'limit': 3,
	'where': 'status = 1',
	'withTags': section.tags.splat('name')
] %}

{% set mmName = section.name %}

{% if not galleries.length %}
	{% fetch galleries from gallery with [
		'order': 'created desc',
		'limit': 3,
		'where': 'status = 1'
	] %}
	{% set mmName = False %}
{% endif %}

{% set top = galleries.shift %}
{% set gallery = gallery.shift(2) %}
{% import "macros/render.tpl" as render %}

<div class="row">
{% if top %} 
<div class="wrap mmb" style="text-align:center;">
	<h3>{% if mmName %}{{ mmName }} {% endif %}Galleries and multimedia</h3>
</div>
<div class="span3">
{% if top.media_type == 'Gallery' %}
	<div class="boot mmb">
		<div class="mmb"><a href="{{ top.urlDefault }}"><img src="{{ top.urlPreview }}" alt="{{ top.slug }}" /></a></div>
		
		<div class="mmb">
			<h4><a href="{{ top.urlDefault }}">{{ top.title }}</a></h4>
			<div>{{ metaRender.dateLine(top.created) }} <span class="dateline sm">| {{ top.media.length|int2noun('image')|upper }}</span></div>
			
			<div class="caption">
				{{ top.description_formatted }}
			</div>
		</div>
	</div>
{% else %} 
	{{ render.section(top) }}
{% endif %}
</div>
<div class="span2">
{% for item in galleries %}
	{% if item.media_type == 'Gallery' %}
		<div class="boot mmb">
			<div class="thumb mmb">
				<a href="{{ item.urlDefault }}"><img src="{{ item.urlThumbnail }}" alt="{{ item.slug }}" /></a>
			</div>
			
			<div class="mmb">
				<h4><a href="{{ item.urlDefault }}">{{ item.title }}</a></h4>
				<div>{{ metaRender.dateLine(item.created) }} <span class="sm dateline">| {{ item.media.length|int2noun('image')|upper }}</span></div>
			</div>
			<div class="clear"> </div>
		</div>
	{% endif %}
	<hr class="double spacer">
{% endfor %}
<div class="clear mb"></div>
</div>
{% endif %}

</div>