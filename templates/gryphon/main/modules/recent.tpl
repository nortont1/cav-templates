{% helper disqusPopular as popular %}
<h3>Popular</h3>
<hr class="spacer"/>
<div class="tabbable">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#1" data-toggle="tab">Stories</a></li>
		<li><a href="#2" data-toggle="tab">Comments</a></li>
		<li><a href="#3" data-toggle="tab">Posts</a></li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane active" id="1"><div class="well">
			<ul>
			{% for item in popular.threads|shift(5) %}
				<li><a href="{{ item.link }}">{{ item.title }}</a>&nbsp;<span class="aside2">|{{ item.posts|int2noun('comment') }}</span></li>
			{% endfor %}
			</ul>
		</div></div>
		<div class="tab-pane" id="2"><div class="well">
			<ul>
				{% for item in popular.posts|shift(5) %}
					<li style="max-width:230px; overflow:hidden;">{{ item.author.name }} said: <p>{{ item.raw_message|clip(150) }}<br />on <a href="{{ item.thread.link }}">{{ item.thread.title }}</a></p></li>
				{% endfor %}
			</ul>
		</div></div>
		<div class="tab-pane" id="3"><div class="well">
			{% fetch posts from blogPost with [
				'where': 'status = 1',
				'order': 'created desc',
				'limit': 10
			]%}
			<ul>
				{% for post in posts %}
					<li><a href="{{ post.url }}">{{ post.headline }}</a></li>
				{% endfor %}
			</ul>
		</div></div>
	</div>
</div>
