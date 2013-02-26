{% helper request %}
{% if request.get('t', 'alnum') == 'multimedia' %}
	{% fetch mm from gryphon:media with [
		'order': 'created desc',
		'limit': 4,
		'where': 'status = 1',
		'withTags': ['multimedia|multimedia_box']
	] %}
	<div class="span10">
		<div class="row-fluid">
			{% for item in mm %}
				<div class="span3 divide-line-right">
					<article>
						<div class="photo-wrap" style="width:100%;height:150px;">
							<a href="{% if item.gallery %}{{ item.gallery.urlDefault }}{% else %}{{ item.urlDefault }}{% endif %}">
								<img src="{{ item.urlPreview }}" />
							</a>
						</div>
						<h4><a href="{% if item.gallery %}{{ item.gallery.urlDefault }}{% else %}{{ item.urlDefault }}{% endif %}" style="max-height:150px;">{{ item.title }}</a></h4>
					</article>
				</div>
			{% endfor %}
		</div>
	</div>
	<div class="span2">
		{% set slug = request.get('t', 'alnum') %}
		<ul class="unstyled">
			<li>More:</li>
			<li><a href="{{ 'multimedia/video'|url }}"><i class="icon-chevron-right"></i> Video</a></li>
			<li><a href="{{ 'gallery'|url }}"><i class="icon-chevron-right"></i> Galleries</a></li>
			<li><a href="{{ 'multimedia/audio'|url }}"><i class="icon-chevron-right"></i> Audio</a></li>
			<li><a href="{{ 'multimedia/flash'|url }}"><i class="icon-chevron-right"></i> Interactives</a></li>
		</ul>
	</div>
<!_____________________________________________________>
{% elseif request.get('t', 'alnum') == 'blog' %}
		{% fetch blogs from blog with [
				'where': 'status = 1',
				'order': 'self:modified desc'
				]
		%}
	<div class="span6">
		<div class="row-fluid">
		{% set cnt = 0 %}
		{% for i in 0..1 %}
			<div class="span6">
				<article class="divide-line-right">
					{% set loopIndex = 1 %}
					
					{% for B in blogs %}
						{% if B.media[0] %}
							{% if loopIndex > cnt  and loopIndex < (cnt+4) %}
								<div class="photo-wrap" style="width:100%;height:65px">
									<a href="{{ B.url }}" alt="{{ B.name }}" title="{{ B.name }}"><img src="{{ B.media[0].url }}" alt="{{ B.name }}" title="{{ B.name }}" style="border:0;"/></a>
								</div>
							{% endif %}
							{% set loopIndex = loopIndex + 1 %}
						{% endif %}
					{% endfor %}
					
				</article>
			</div>
			{% set cnt = cnt + 3 %}
		{% endfor %}
		</div>
		
	</div>
	<!**********************************>
	<div class="span6">
		<div class="row_fluid dropnav-blogs">
			<h6 style="color: #595959">LATEST BLOG ENTRIES:</h6>
			{% for blog in blogs.shift(4) %}
				{% set post = blog.mostRecent %}
					<div>
						<ul class="unstyled">
							<li><a href="{{ post.url }}">{{ post.headline }}</a></li>
							<li><a class="gray-blog-link" href="{{ blog.url }}">{{ blog.name }}</a></li>
						</ul>
					</div>	
			{% endfor %}
		</div>
	</div>
			
{% else %}
	{% fetch articles from article with [
		'where': 'status = 1',
		'order': 'weight desc, created desc',
		'limit': '8',
		'withTags': [request.get('t', 'alnum')]
	] %}
	<div class="span5">
		<div class="row-fluid">
			<div class="span6">
				{% set article = articles.shift() %}
				{% set topMedia = article.media.grab('type', 'image')[0] %}
				<article>
					{% if topMedia %}
						<div class="photo-wrap" style="width:100%;height:150px;">
							<a href="{{ article.url }}"><img src="{{ topMedia.urlPreview }}" style="max-height:150px;"/></a>
						</div>
					{% endif %}
					<h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
					<aside>
						{% if article.authors.length %}
							By {{ article.authors.splat('name')|join(', ') }}
						{% else %}
							&nbsp;
						{% endif %}
					</aside>
					{% if not topMedia %}
						<p class="copy">{{ article.abstract_formatted|clip(200) }}</p>
					{% endif %}

				</article>
			</div>
			<div class="span6">
				{% set article = articles.shift() %}
				{% set topMedia = article.media.grab('type', 'image')[0] %}
				<article>
					{% if topMedia %}
						<div class="photo-wrap" style="width:100%;height:150px;">
							<a href="{{ article.url }}"><img src="{{ topMedia.urlPreview }}" style="max-height:150px;" /></a>
						</div>
					{% endif %}
					<h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
					<aside>
						{% if article.authors.length %}
							By {{ article.authors.splat('name')|join(', ') }}
						{% else %}
							&nbsp;
						{% endif %}
					</aside>
					{% if not topMedia %}
						<p class="copy">{{ article.abstract_formatted|clip(100) }}</p>
					{% endif %}

				</article>
			</div>
		</div>
	</div>
	<div class="span5">
		<div class="row-fluid">
			<div class="span6">
				{% for article in articles.shift(3) %}
					<article>
						<h6><a href="{{ article.url }}">{{ article.headline }}</a></h6>
						<aside>
							{% if article.authors.length %}
								By {{ article.authors.splat('name')|join(', ') }}
							{% else %}
								&nbsp;
							{% endif %}
						</aside>
					</article>
					<hr class="half spacer" />
				{% endfor %}
			</div>
			<div class="span6">
				{% for article in articles.shift(3) %}
					<article>
						<h6 class="make-it-green"><a href="{{ article.url }}">{{ article.headline }}</a></h6>
						<aside>
							{% if article.authors.length %}
								By {{ article.authors.splat('name')|join(', ') }}
							{% else %}
								&nbsp;
							{% endif %}
						</aside>
					</article>
					<hr class="half spacer" />
				{% endfor %}
			</div>
		</div>
	</div>
	<div class="span2">
		{% set slug = request.get('t', 'alnum') %}
		<ul class="unstyled">
			{% if not slug or slug == 'top_stories' %}
				<li>More:</li>
				<li><a href="{{ 'page/puzzles'|url }}"><i class="icon-chevron-right"></i> Puzzles</a></li>
				<li><a href="{{ 'classified'|url }}"><i class="icon-chevron-right"></i> Classified</a></li>
				<li><a href="{{ 'page/religious'|url }}"><i class="icon-chevron-right"></i> Religious Guide</a></li>
			{% elseif slug == 'news' %}
				<li>More:</li>
				<li><a href="{{ 'section/city'|url }}"><i class="icon-chevron-right"></i> City</a></li>
				<li><a href="{{ 'section/campus'|url }}"><i class="icon-chevron-right"></i> Campus</a></li>
				<li><a href="{{ 'section/police_briefs'|url }}"><i class="icon-bullhorn"></i> Police Briefs</a></li>
			{% elseif slug == 'sports' %}
				<li>More:</li>
				<li><a href="{{ 'section/football'|url }}"><i class="icon-chevron-right"></i> Football</a></li>
				<li><a href="{{ 'section/basketball'|url }}"><i class="icon-chevron-right"></i> Basketball</a></li>
				<li><a href="{{ 'section/ice_hockey'|url }}"><i class="icon-chevron-right"></i> Ice Hockey</a></li>
				<li><a href="{{ 'section/soccer'|url }}"><i class="icon-chevron-right"></i> Soccer</a></li>
				<li><a href="{{ 'section/baseball'|url }}"><i class="icon-chevron-right"></i> Baseball</a></li>
				<li><a href="{{ 'section/softball'|url }}"><i class="icon-chevron-right"></i> Softball</a></li>
				<!--<li><a href="{{ 'section/team'|url }}"><i class="icon-chevron-right"></i> More Teams</a></li>-->
			{% elseif slug == 'opinion' %}
				<li>More:</li>
				<li><a href="{{ 'section/editorials'|url }}"><i class="icon-chevron-right"></i> Editorials</a></li>
				<li><a href="{{ 'section/columns'|url }}"><i class="icon-chevron-right"></i> Columns</a></li>
				<li><a href="{{ 'section/letters'|url }}"><i class="icon-chevron-right"></i> Letters</a></li>
			{% elseif slug == 'features' %}
				<li>More:</li>
				<li><a href="{{ 'calendar'|url }}"><i class="icon-chevron-right"></i> Event Calendar</a></li>
				<li><a href="{{ 'page/puzzles'|url }}"><i class="icon-chevron-right"></i> Puzzles</a></li>
			{% endif %}
		</ul>
	</div>
{% endif %}