<video id="video_{{ media.uid }}" class="video-js vjs-default-skin" controls
  preload="auto" width="100%" height="320" poster="{{ media.url }}"
  data-setup="{}">
  <source src="{{ media.urlOriginalMp4 }}" type='video/mp4'>
  <source src="{{ media.urlOriginalWebm }}" type='video/webm'>
</video>