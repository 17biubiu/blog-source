<!doctype html>

{% set html_class = 'theme-next ' + theme.scheme %}
{% if theme.use_motion %}
  {% set html_class = html_class + ' use-motion' %}
{% endif %}

<html class="{{ html_class | lower }}" lang="{{ config.language }}">
<head>
  {% include '_partials/head.swig' %}
  <!-- <title>{% block title %}{% endblock %}</title> -->
  <title>17biu的博客</title>
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="{{ page.lang || page.language || config.language }}">
<a href="https://github.com/proshuai/proshuai.github.io" style="display: inline-block; width: 149px; height: 149px; border: none;"><img style="position: absolute; top: 0; left: 0; border: 0;" src="https://camo.githubusercontent.com/82b228a3648bf44fc1163ef44c62fcc60081495e/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f6c6566745f7265645f6161303030302e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_left_red_aa0000.png"></a>

  {% include '_third-party/analytics/index.swig' %}

  {% set container_class = "container " %}
  {% if theme.sidebar.position %}
    {% set container_class = container_class + 'sidebar-position-' + theme.sidebar.position %}
  {% endif %}
  <div class="{{ container_class }} {% block page_class %}{% endblock %} ">
    <!-- <div class="headband"></div> -->

    <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
      <div class="header-inner"> {%- include '_partials/header.swig' %} </div>
    </header>

    <main id="main" class="main">
      <div class="main-inner">
        <div class="content-wrap">
          <div id="content" class="content">
            {% block content %}{% endblock %}
          </div>
          {% include '_third-party/duoshuo-hot-articles.swig' %}
          {% include '_partials/comments.swig' %}
        </div>
        {% if theme.sidebar.display !== 'remove' %}
          {% block sidebar %}{% endblock %}
        {% endif %}
      </div>
    </main>

    <footer id="footer" class="footer">
      <div class="footer-inner">
        {% include '_partials/footer.swig' %}
        {% include '_third-party/analytics/busuanzi-counter.swig' %}
        {% block footer %}{% endblock %}
      </div>
    </footer>

    {% if not theme.sidebar.b2t %}
      <div class="back-to-top">
        <i class="fa fa-arrow-up"></i>
        {% if theme.sidebar.scrollpercent %}
          <span id="scrollpercent"><span>0</span>%</span>
        {% endif %}
      </div>
    {% endif %}

  </div>

  {% include '_scripts/vendors.swig' %}
  {% include '_scripts/commons.swig' %}

  {% set scheme_script = '_scripts/schemes/' + theme.scheme | lower + '.swig' %}
  {% include scheme_script %}

  {% block script_extra %}{% endblock %}

  {% include '_scripts/boostrap.swig' %}

  {% include '_third-party/comments/index.swig' %}
  {% include '_third-party/search/index.swig' %}
  {% include '_third-party/analytics/lean-analytics.swig' %}
  {% include '_third-party/seo/baidu-push.swig' %}
  {% include '_third-party/mathjax.swig' %}
  {% include '_third-party/exturl.swig' %}

  
  <div class="bg_content">
    <canvas id="canvas" width="1920" height="983"></canvas>
  </div>
  
<script>

  class Circle {
      //创建对象
      //以一个圆为对象
      //设置随机的 x，y坐标，r半径，_mx，_my移动的距离
      //this.r是创建圆的半径，参数越大半径越大
      //this._mx,this._my是移动的距离，参数越大移动
      constructor(x, y) {
          this.x = x;
          this.y = y;
          this.r = Math.random() * 10 ;
          this._mx = Math.random() ;
          this._my = Math.random() ;

      }

      //canvas 画圆和画直线
      //画圆就是正常的用canvas画一个圆
      //画直线是两个圆连线，为了避免直线过多，给圆圈距离设置了一个值，距离很远的圆圈，就不做连线处理
      drawCircle(ctx) {
          ctx.beginPath();
          //arc() 方法使用一个中心点和半径，为一个画布的当前子路径添加一条弧。
          ctx.arc(this.x, this.y, this.r, 0, 360)
          ctx.closePath();
          ctx.fillStyle = 'rgba(204, 204, 204, 0.3)';
          ctx.fill();
      }

      drawLine(ctx, _circle) {
          let dx = this.x - _circle.x;
          let dy = this.y - _circle.y;
          let d = Math.sqrt(dx * dx + dy * dy)
          if (d < 150) {
              ctx.beginPath();
              //开始一条路径，移动到位置 this.x,this.y。创建到达位置 _circle.x,_circle.y 的一条线：
              ctx.moveTo(this.x, this.y);   //起始点
              ctx.lineTo(_circle.x, _circle.y);   //终点
              ctx.closePath();
              ctx.strokeStyle = 'rgba(204, 204, 204, 0.3)';
              ctx.stroke();
          }
      }

      // 圆圈移动
      // 圆圈移动的距离必须在屏幕范围内
      move(w, h) {
          this._mx = (this.x < w && this.x > 0) ? this._mx : (-this._mx);
          this._my = (this.y < h && this.y > 0) ? this._my : (-this._my);
          this.x += this._mx / 2;
          this.y += this._my / 2;
      }
  }
  //鼠标点画圆闪烁变动
  class currentCirle extends Circle {
      constructor(x, y) {
          super(x, y)
      }

      drawCircle(ctx) {
          ctx.beginPath();
          //注释内容为鼠标焦点的地方圆圈半径变化
          //this.r = (this.r < 14 && this.r > 1) ? this.r + (Math.random() * 2 - 1) : 2;
          this.r = 8;
          ctx.arc(this.x, this.y, this.r, 0, 360);
          ctx.closePath();
          //ctx.fillStyle = 'rgba(0,0,0,' + (parseInt(Math.random() * 100) / 100) + ')'
          ctx.fillStyle = 'rgba(255, 77, 54, 0.3)'
          ctx.fill();

      }
  }
  //更新页面用requestAnimationFrame替代setTimeout
  window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame;

  let canvas = document.getElementById('canvas');
  let ctx = canvas.getContext('2d');
  let w = canvas.width = canvas.offsetWidth;
  let h = canvas.height = canvas.offsetHeight;
  let circles = [];
  let current_circle = new currentCirle(0, 0)

  let draw = function () {
      ctx.clearRect(0, 0, w, h);
      for (let i = 0; i < circles.length; i++) {
          circles[i].move(w, h);
          circles[i].drawCircle(ctx);
          for (j = i + 1; j < circles.length; j++) {
              circles[i].drawLine(ctx, circles[j])
          }
      }
      if (current_circle.x) {
          current_circle.drawCircle(ctx);
          for (var k = 1; k < circles.length; k++) {
              current_circle.drawLine(ctx, circles[k])
          }
      }
      requestAnimationFrame(draw)
  }

  let init = function (num) {
      for (var i = 0; i < num; i++) {
          circles.push(new Circle(Math.random() * w, Math.random() * h));
      }
      draw();
  }
  window.addEventListener('load', init(60));
  window.onmousemove = function (e) {
      e = e || window.event;
      current_circle.x = e.clientX;
      current_circle.y = e.clientY;
  }
  window.onmouseout = function () {
      current_circle.x = null;
      current_circle.y = null;

  };
</script>

</body>
</html>
