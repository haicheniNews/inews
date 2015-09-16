<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta content="text/html;charset=utf-8" http-equiv="Content-Type" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="renderer" content="webkit" />
<title>新闻详情</title>
<base href="./" /><!--[if IE]></base><![endif]-->
<link href="./static/css/default/ico/favicon.ico?v=20140930" rel="shortcut icon" type="image/x-icon" />

<link rel="stylesheet" type="text/css" href="./static/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="./static/css/icon.css" />

<link href="./static/css/default/common.css?v=20140930" rel="stylesheet" type="text/css" />
<link href="./static/css/default/link.css?v=20140930" rel="stylesheet" type="text/css" />
<link href="./static/js/plug_module/style.css?v=20140930" rel="stylesheet" type="text/css" />


<script type="text/javascript">
	var _5B57224276837C7BEA61B7B667408617='';
	var G_POST_HASH=_5B57224276837C7BEA61B7B667408617;
	var G_INDEX_SCRIPT = '';
	var G_SITE_NAME = 'Laravel中文网问答社区';
	var G_BASE_URL = '.';
	var G_STATIC_URL = './static';
	var G_UPLOAD_URL = './uploads';
	var G_USER_ID = '';
	var G_USER_NAME = '';
	var G_UPLOAD_ENABLE = 'N';
	var G_UNREAD_NOTIFICATION = 0;
	var G_NOTIFICATION_INTERVAL = 100000;
	var G_CAN_CREATE_TOPIC = '';
	
	</script>
<script src="./static/js/jquery.2.js?v=20140930" type="text/javascript"></script>
<script src="./static/js/jquery.form.js?v=20140930" type="text/javascript"></script>
<script src="./static/js/plug_module/plug-in_module.js?v=20140930" type="text/javascript"></script>
<script src="./static/js/aws.js?v=20140930" type="text/javascript"></script>
<script src="./static/js/aw_template.js?v=20140930" type="text/javascript"></script>
<script src="./static/js/app.js?v=20140930" type="text/javascript"></script>
<script type="text/javascript" src="./static/js/compatibility.js"></script>
<!--[if lte IE 8]>
	<script type="text/javascript" src="./static/js/respond.js"></script>
<![endif]-->
</head>
<noscript unselectable="on" id="noscript">
    <div class="aw-404 aw-404-wrap container">
        <img src="./static/common/no-js.jpg">
        <p>你的浏览器禁用了JavaScript, 请开启后刷新浏览器获得更好的体验!</p>
    </div>
</noscript>
<body>
	<div class="aw-top-menu-wrap">
		<div class="container">
			<!-- logo -->
			<div class="aw-logo hidden-xs">
				<a href="."></a>
			</div>
			<!-- end logo -->
			<!-- 搜索框 -->
			<div class="aw-search-box  hidden-xs hidden-sm">
				<form class="navbar-search" action="./search/" id="global_search_form" method="post">
					<input class="form-control search-query" type="text" placeholder="搜索问题、话题或人" autocomplete="off" name="q" id="aw-search-query" />
					<span title="搜索" id="global_search_btns" onClick="$('#global_search_form').submit();"><i class="icon icon-search"></i></span>
					<div class="aw-dropdown">
						<div class="mod-body">
							<p class="title">输入关键字进行搜索</p>
							<ul class="aw-dropdown-list hide"></ul>
							<p class="search"><span>搜索:</span><a onClick="$('#global_search_form').submit();"></a></p>
						</div>
						<div class="mod-footer">
							<a href="" onClick="$('#header_publish').click();" class="pull-right btn btn-mini btn-success publish">发起问题</a>
						</div>
					</div>
				</form>
			</div>
			<!-- end 搜索框 -->
			<!-- 导航 -->
			<div class="aw-top-nav navbar">
				<div class="navbar-header">
			      <button  class="navbar-toggle pull-left">
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			    </div>
				<nav role="navigation" class="collapse navbar-collapse bs-navbar-collapse">
			      <ul class="nav navbar-nav">
			      	                    <li><a href="" class=""><i class="icon icon-ul"></i> 发现</a></li>

					<!-- <li><a href="./question/" class="">问题</a></li>

					<li><a href="./article/" class="active">文章</a></li> -->

					<li><a href="./topic/" ><i class="icon icon-topic"></i> 话题</a></li>

								      </ul>
			    </nav>
			</div>
			<!-- end 导航 -->
			<!-- 用户栏 -->
			<div class="aw-user-nav">
				<!-- 登陆&注册栏 -->
									<span>
						<a class="register btn btn-normal btn-success" href="./register.html">注册</a>
						<a class="login btn btn-normal btn-primary" href="./login.html">登录</a>
					</span>
								<!-- end 登陆&注册栏 -->
			</div>
			<!-- end 用户栏 -->
			<!-- 发起 -->
						<!-- end 发起 -->
		</div>
	</div>
			
<div class="aw-container-wrap">
	<div class="container">
		<div class="row">
			<div class="aw-content-wrap clearfix">
				<div class="col-sm-12 col-md-9 aw-main-content aw-article-content">
					<div class="aw-mod aw-topic-bar" id="question_topic_editor" data-type="article" data-id="302">
						<div class="tag-bar clearfix">
																					<span class="topic-tag">
								<a class="text" href="./topic/%E7%BB%B4%E6%8A%A4" data-id="953">维护</a>
							</span>
														
													</div>
					</div>
					<div class="aw-mod aw-question-detail">
						<div class="mod-head">
							<h1>
								呃，分享个网站开关的代码 - laravel 5.0以上版本							</h1>

													</div>
						<div class="mod-body">
							<div class="content markitup-box">
								昨天没事写了个后台功能，正好写到网站开启和关闭，拿来给大伙分享下。<br />
php artisan down 和 php artisan up<br />
关闭维护模式 和 开启维护模式<br />
虽然好用，但是在正式项目上线时你会发现，使用 php artisan down时laravel会把所有路由都指向503，这样会很尴尬的，因为你连后台都无法进入的。<br />
最好的解决办法就是将不想关闭维护的路由隔离开即可，开始上代码了~<br />
<br />
我们使用laravel强大 Artisan 控制台<br />
<pre class="prettyprint">Artisan::call('down');<br />
</pre><br />
先启动【关闭维护模式】<br />
<br />
这个是【开启维护模式】<br />
<pre class="prettyprint">Artisan::call('up');<br />
</pre><br />
然后创建一个中间件<br />
<pre class="prettyprint">php&nbsp;artisan&nbsp;make:middleware&nbsp;CheckForMaintenanceMode<br />
</pre><br />
CheckForMaintenanceModel.php<br />
<pre class="prettyprint">&lt;?php<br />
namespace&nbsp;App\Http\Middleware;<br />
/**<br />
*&nbsp;开启和关闭站点&nbsp;-&nbsp;中间件<br />
*&nbsp;User:&nbsp;shineforce<br />
*&nbsp;Date:&nbsp;2015/8/25<br />
*&nbsp;Time:&nbsp;20:32<br />
*/<br />
<br />
use&nbsp;Closure;<br />
use&nbsp;Illuminate\Contracts\Foundation\Application;<br />
use&nbsp;Illuminate\Http\Request;<br />
use&nbsp;Symfony\Component\HttpKernel\Exception\HttpException;<br />
<br />
class&nbsp;CheckForMaintenanceMode<br />
{<br />
protected&nbsp;$request;<br />
protected&nbsp;$app;<br />
<br />
public&nbsp;function&nbsp;__construct(Application&nbsp;$app,&nbsp;Request&nbsp;$request)<br />
{<br />
&nbsp;&nbsp;&nbsp;&nbsp;$this-&gt;app&nbsp;=&nbsp;$app;<br />
&nbsp;&nbsp;&nbsp;&nbsp;$this-&gt;request&nbsp;=&nbsp;$request;<br />
}<br />
<br />
/**<br />
&nbsp;*&nbsp;Handle&nbsp;an&nbsp;incoming&nbsp;request.<br />
&nbsp;*<br />
&nbsp;*&nbsp;@param&nbsp;&nbsp;\Illuminate\Http\Request&nbsp;$request<br />
&nbsp;*&nbsp;@param&nbsp;&nbsp;\Closure&nbsp;$next<br />
&nbsp;*&nbsp;@return&nbsp;mixed<br />
&nbsp;*/<br />
public&nbsp;function&nbsp;handle($request,&nbsp;Closure&nbsp;$next)<br />
{<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;//使用$request-&gt;is&nbsp;隔离出不需要关闭的路由<br />
&nbsp;&nbsp;&nbsp;&nbsp;//使用isDownForMaintenance获取网站已经启用&nbsp;【关闭维护模式】<br />
&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(!$request-&gt;is('admin/*')&nbsp;&amp;&amp;&nbsp;$this-&gt;app-&gt;isDownForMaintenance())&nbsp;{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;throw&nbsp;new&nbsp;HttpException(503);<br />
&nbsp;&nbsp;&nbsp;&nbsp;}<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;$next($request);<br />
}<br />
}<br />
</pre><br />
然后到 app > Http > Kernel.php 的 protected $middleware中 添加<br />
<pre class="prettyprint">\App\Http\Middleware\CheckForMaintenanceMode::class,<br />
</pre><br />
并且将原始的<br />
<pre class="prettyprint">\Illuminate\Foundation\Http\Middleware\CheckForMaintenanceMode::class,<br />
</pre><br />
删除掉即可。
								
															</div>
							<div class="meta clearfix">
								<div class="aw-article-vote pull-left disabled">
									<a href="javascript:;" class="agree" onclick="AWS.User.article_vote($(this), 302, 1);"><i class="icon icon-agree"></i> <b>0</b></a>
																	</div>

								<span class="pull-right  more-operate">
									
									
									<a class="text-color-999 dropdown-toggle" data-toggle="dropdown">
										<i class="icon icon-share"></i> 分享									</a>
									<div aria-labelledby="dropdownMenu" role="menu" class="aw-dropdown shareout pull-right">
										<ul class="aw-dropdown-list">
											<li><a onclick="AWS.User.share_out('tsina');"><i class="icon icon-weibo"></i> 新浪微博</a></li>
											<li><a onclick="AWS.User.share_out('qzone');"><i class="icon icon-qzone"></i> QZONE</a></li>
											<li><a onclick="AWS.User.share_out('weixin');"><i class="icon icon-wechat"></i> 微信</a></li>
										</ul>
									</div>

									<em class="text-color-999">2015-08-30</em>
								</span>



							</div>
						</div>
						<div class="mod-footer">
													</div>
					</div>

					<!-- 文章评论 -->
					<div class="aw-mod">
						<div class="mod-head common-head">
							<h2>0 个评论</h2>
						</div>

						
						
											</div>
					<!-- end 文章评论 -->

					<!-- 回复编辑器 -->
					<div class="aw-mod aw-article-replay-box">
						<a name="answer_form"></a>
												<p align="center">要回复文章请先<a href="./login/">登录</a>或<a href="./account/register/">注册</a></p>
											</div>
					<!-- end 回复编辑器 -->
				</div>
				<!-- 侧边栏 -->
				<div class="col-sm-12 col-md-3 aw-side-bar hidden-sm hidden-xs">
					<!-- 发起人 -->
										<div class="aw-mod user-detail">
						<div class="mod-head">
							<h3>发起人</h3>
						</div>
						<div class="mod-body">
							<dl>
								<dt class="pull-left aw-border-radius-5">
									<a href="./people/shineforce"><img alt="shineforce" src="./uploads/avatar/000/00/05/21_avatar_mid.jpg" /></a>
								</dt>
								<dd class="pull-left">
									<a class="aw-user-name" href="./people/shineforce" data-id="521">shineforce</a>																		<p></p>
								</dd>
							</dl>
						</div>
						<div class="mod-footer clearfix">
													</div>
					</div>
										<!-- end 发起人 -->

					
										<!-- 相关问题 -->
					<div class="aw-mod aw-text-align-justify question-related-list">
						<div class="mod-head">
							<h3>相关问题</h3>
						</div>
						<div class="mod-body">
							<ul>
																<li><a href="./question/1338">吐槽一下laravel问答系统</a></li>
																<li><a href="./question/4">关于Laravel教程的一些调研</a></li>
																<li><a href="./question/101">laravel现在有什么现成的案例吗</a></li>
																<li><a href="./question/1048">Laravel 到底哪优雅了？</a></li>
																<li><a href="./question/336">我想使用laravel的时间戳</a></li>
																<li><a href="./question/746">laravel 安装如何选择低版本问题</a></li>
																<li><a href="./question/452">@安正超 @王赛 @FiveSay @JohnLui @码农,几位大神 发布些laravel原理的高级教程吧！</a></li>
																<li><a href="./question/1089">Laravel 5.0的自带的Auth和七牛云的包 Qiniu\Auth产生冲突怎么办？</a></li>
																<li><a href="./question/479">laravel配置apache问题</a></li>
																<li><a href="./question/328">利用laravel administrator如何导入excel数据？</a></li>
																<li><a href="./question/146">laravel jenssegers/laravel-mongodb slice 操作怎么写</a></li>
															</ul>
						</div>
					</div>
					<!-- end 相关问题 -->
									</div>
				<!-- end 侧边栏 -->
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function () {
		if ($('.aw-article-vote.disabled').length)
		{
			$('.aw-article-vote.disabled a').attr('onclick', '');
		}

    	AWS.at_user_lists('#wmd-input');

    	AWS.Init.init_article_comment_box($('.aw-article-comment'));
	});
</script>

<div class="aw-footer-wrap">
	<div class="aw-footer">
		Copyright © 2015, All Rights Reserved</span>

		<span class="hidden-xs">Powered By <a href="http://www.wecenter.com/?copyright" target="blank">WeCenter 3.0 Beta 2</a></span>
		
			</div>
</div>



<a class="aw-back-top hidden-xs" href="javascript:;" onclick="$.scrollTo(1, 600, {queue:true});"><i class="icon icon-up"></i></a>

<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fc8d13872a523d9c286aa7affbe0921f1' type='text/javascript'%3E%3C/script%3E"));
</script>
<!-- DO NOT REMOVE -->
<div id="aw-ajax-box" class="aw-ajax-box"></div>
<div style="display:none;" id="__crond">
	<script type="text/javascript">
		$(document).ready(function () {
			$('#__crond').html(unescape('%3Cimg%20src%3D%22' + G_BASE_URL + '/crond/run/1441806038%22%20width%3D%221%22%20height%3D%221%22%20/%3E'));
		});
	</script>
</div>

<!-- Escape time: 0.029392957687378 --><!-- / DO NOT REMOVE -->

</body>
</html>