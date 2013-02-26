{% extends "gryphon/base.tpl" %}
{% block activeNav %}home{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set centerStories = articles.shift(2) %}
{% import "macros/article.tpl" as articleRender %}



<div class="row">
  <div class="span3">
    <h3>Recent News:</h3>

    {% for article in articles %}
      {{ articleRender.threeCol(article) }}
      <hr class="spacer" />
    {% endfor %}

    <hr class="spacer" />


  </div>
  <div class="span5 mobile-push-top">

  {% if breaking %}
      <header class="breaking">
        <h4>BREAKING NEWS | Updated {{ breaking.modified | timeSince }}</h4>
      </header>
      <hr class="half spacer"/>
      <div class="breaking-box">
        <h3><a href="{{ breaking.url }}">{{ breaking.headline }}</a></h3>
      </div>
      <hr class="hairline"/>
      {% endif %}
      {% if developing %}
      <header class="developing">
        <h4>DEVELOPING NEWS | Updated{{ developing.modified | timeSince }}</h4>
      </header>
      <div class="breaking-box">
        <h3><a href="{{ developing.url }}">{{ developing.headline }}</a></h3>
      </div>
      <hr class="hairline"/>
      {% endif %}


  {{ articleRender.dom(topStory) }}

  <hr class="hairline double spacer" />

  {% for article in centerStories %}
  {{ articleRender.fiveCol(article) }}
  <hr class="spacer" />
  {% endfor %}

  <hr class="hairline spacer" />

  <div class="row-fluid">
    <div class="span12">
      <div class="row-fluid">
        <div class="span6">
          <h3><a href="{{ 'section/sports'|url }}">Sports</a></h3>
            <ul class="item-list">
              {% fetch sports from article with [
              'where': 'status = 1',
              'order': 'weight desc, created desc',
              'limit': 4,
              'withTags': ['sports']
              ]%}
              {% for article in sports %}
                <li><h4><a href="{{ article.url }}">{{ article.headline }}</a><span> | {{ article.created|date('M d') }}</span></h4></li>
              {% endfor %}
            </ul>
        </div>
        <div class="span6">
        <h3><a href="{{ 'section/ae'|url }}">A&amp;E</a></h3>
          <ul class="item-list">
            {% fetch ae from article with [
            'where': 'status = 1',
            'order': 'weight desc, created desc',
            'limit': 4,
            'withTags': ['tableau']
            ]%}
            {% for article in ae %}
              <li><h4><a href="{{ article.url }}">{{ article.headline }}</a><span> | {{ article.created|date('M d') }}</span></h4></li>
            {% endfor %}
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="row-fluid">
    <div class="span12">
      <div class="row-fluid">
        <div class="span6">
        <h3><a href="{{ 'section/opinion'|url }}">Opinion</a></h3>
          <ul class="item-list">
          {% fetch opinion from article with [
          'where': 'status = 1',
          'order': 'weight desc, created desc',
          'limit': 4,
          'withTags': ['opinion']
          ]%}
          {% for article in opinion %}
          <li><h4><a href="{{ article.url }}">{{ article.headline }}</a><span> | {{ article.created|date('M d') }}</span></h4></li>
            {% endfor %}
          </ul>
        </div>
        <div class="span6">
        <h3><a href="{{ 'section/life'|url }}">Life</a></h3>
          <ul class="item-list">
          {% fetch life from article with [
          'where': 'status = 1',
          'order': 'weight desc, created desc',
          'limit': 4,
          'withTags': ['life']
          ]%}
          {% for article in life %}
            <li><h4><a href="{{ article.url }}">{{ article.headline }}</a><span> | {{ article.created|date('M d') }}</span></h4></li>
          {% endfor %}
          </ul>
        </div>
      </div>
    </div>
  </div>

  <hr class="hairline double spacer" />

 <!-- {% include 'gryphon/main/modules/featured-mm.tpl' %}-->
 {% include 'gryphon/main/modules/homePage_mm.tpl' %}
  </div>

  <div class="span4">
    <div id="main-sidebar" class="hidden-phone">
      <div id="social-buttons">
      <a href="http://www.facebook.com/CavalierDaily"><img src="{{ 'assets/images/icons/facebook_box.png'|asset }}" class="flex-image" /></a>
      <a href="https://twitter.com/intent/user?screen_name=cavalierdaily"><img src="{{ 'assets/images/icons/twitter_box.png'|asset }}" class="flex-image" width="40px" height="40px"/></a>
      <a href="http://www.youtube.com/user/CavalierDaily"><img src="{{ 'assets/images/icons/youtube_box2.jpg'|asset }}" class="flex-image" /></a>
      <a href="{{ 'page/feeds'|url }}"><img src="{{ 'assets/images/icons/RSS_Feed_box.png'|asset }}" class="flex-image" /></a>
      </div>
      <hr class="double hairline" />

      <div class="well">
        <h4>Subscribe to our email edition</h3>

        <p>
            Get The Cavalier Daily delivered to your inbox every morning.
        </p>

        <a href="http://eepurl.com/uMcV5" class="btn btn-primary">Subscribe now!</a>
      </div>

      <hr class="double hairline" />

      {% include 'gryphon/main/ads/rectangle.tpl' %}

      <hr class="double harline" />

      {% include 'gryphon/main/modules/calendar.tpl' %}

       <hr class="double harline" />

      {% include 'gryphon/main/modules/recent.tpl' %}

      <hr class="double spacer" />

      {% include 'gryphon/main/modules/twitter_feed.tpl' %}

      </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="/twitter-bootstrap/twitter-bootstrap-v2/js/bootstrap-tooltip.js"></script>
<script src="/twitter-bootstrap/twitter-bootstrap-v2/js/bootstrap-popover.js"></script>
<script type="text/javascript" src="{{ 'assets/js/fb-popover.js'|asset }}" ></script>

{% endblock content %}