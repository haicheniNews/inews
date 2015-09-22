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
<title>新闻</title>
<base href="./" /><!--[if IE]></base><![endif]-->
<link href="./static/css/default/ico/favicon.ico?v=20140930" rel="shortcut icon" type="image/x-icon" />

<link rel="stylesheet" type="text/css" href="./static/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="./static/css/icon.css" />

<link href="./static/css/default/common.css?v=20140930" rel="stylesheet" type="text/css" />
<link href="./static/css/default/link.css?v=20140930" rel="stylesheet" type="text/css" />
<link href="./static/js/plug_module/style.css?v=20140930" rel="stylesheet" type="text/css" />


<script type="text/javascript">
	var _230B6BEED30A4526AF797590B918214C='';
	var G_POST_HASH=_230B6BEED30A4526AF797590B918214C;
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
			      	                    <li><a href="" class="active"><i class="icon icon-ul"></i> 发现</a></li>

					<!-- <li><a href="./question/" class="">问题</a></li>

					<li><a href="./article/" class="">文章</a></li> -->

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
				<div class="col-sm-12 col-md-9 aw-main-content">
					<!-- 新消息通知 -->
					<div class="aw-mod aw-notification-box hide" id="index_notification">
						<div class="mod-head common-head">
							<h2>
								<span class="pull-right"><a href="./setting/privacy/#notifications" class="text-color-999"><i class="icon icon-setting"></i> 通知设置</a></span>
								<i class="icon icon-bell"></i>新通知<em class="badge badge-important" name="notification_unread_num"></em>
							</h2>
						</div>
						<div class="mod-body">
							<ul id="notification_list"></ul>
						</div>
						<div class="mod-footer clearfix">
							<a href="javascript:;" onclick="AWS.Message.read_notification(false, 0, false);" class="pull-left btn btn-mini btn-gray">我知道了</a>
							<a href="./notifications/" class="pull-right btn btn-mini btn-success">查看所有</a>
						</div>
					</div>
					<!-- end 新消息通知 -->
					<!-- tab切换 -->
					<ul class="nav nav-tabs aw-nav-tabs active hidden-xs">
						<li><a href="./sort_type-unresponsive">等待回复</a></li>
						<li><a href="./sort_type-hot__day-7" id="sort_control_hot">热门</a></li>
						<li><a href="./is_recommend-1">推荐</a></li>
						<li class="active"><a href="">最新</a></li>

						<h2 class="hidden-xs"><i class="icon icon-list"></i> 发现</h2>
					</ul>
					<!-- end tab切换 -->

					
					<div class="aw-mod aw-explore-list">
						<div class="mod-body">
							<div class="aw-common-list">


<!-- 新闻列表页开始 -->
<div class="aw-item " data-topic-id="306,">
	<a class="aw-user-name hidden-xs" data-id="1759" href="./people/kanjiushi" rel="nofollow"><img src="./static/common/avatar-max-img.png" alt="" /></a>	
	<div class="aw-question-content">
		<h4>
			<a href="./detail.html">这是新闻列表也.</a>
		</h4>
			<div class="pull-right hidden-xs contribute">
			<span class="pull-right text-color-999">贡献</span>	    
		    	<a class="aw-user-name" data-id="75" href="./people/nidedd" rel="nofollow"><img src="./uploads/avatar/000/00/00/75_avatar_mid.jpg" alt="" /></a>
		    	<a class="aw-user-name" data-id="101" href="./people/cuevven" rel="nofollow"><img src="./uploads/avatar/000/00/01/01_avatar_mid.jpg" alt="" /></a>
		    </div>
				
		<p>
			<a href="./people/cuevven" class="aw-user-name" data-id="101">cuevven</a> 
			<span class="text-color-999">
			回复了问题 • 3 人关注 • 3 个回复 • 445 次浏览 • 2015-08-30 14:17
			</span>
			<span class="text-color-999 related-topic hide"> •  来自相关话题</span>
		</p>
	</div>
</div>
<div class="aw-item " data-topic-id="306,">
	<a class="aw-user-name hidden-xs" data-id="1759" href="./people/kanjiushi" rel="nofollow"><img src="./static/common/avatar-max-img.png" alt="" /></a>	
	<div class="aw-question-content">
		<h4>
			<a href="./detail.html">这是新闻列表也.</a>
		</h4>
			<div class="pull-right hidden-xs contribute">
			<span class="pull-right text-color-999">贡献</span>	    
		    	<a class="aw-user-name" data-id="75" href="./people/nidedd" rel="nofollow"><img src="./uploads/avatar/000/00/00/75_avatar_mid.jpg" alt="" /></a>
		    	<a class="aw-user-name" data-id="101" href="./people/cuevven" rel="nofollow"><img src="./uploads/avatar/000/00/01/01_avatar_mid.jpg" alt="" /></a>
		    </div>
				
		<p>
			<a href="./people/cuevven" class="aw-user-name" data-id="101">cuevven</a> 
			<span class="text-color-999">
			回复了问题 • 3 人关注 • 3 个回复 • 445 次浏览 • 2015-08-30 14:17
			</span>
			<span class="text-color-999 related-topic hide"> •  来自相关话题</span>
		</p>
	</div>
</div>
<div class="aw-item " data-topic-id="306,">
	<a class="aw-user-name hidden-xs" data-id="1759" href="./people/kanjiushi" rel="nofollow"><img src="./static/common/avatar-max-img.png" alt="" /></a>	
	<div class="aw-question-content">
		<h4>
			<a href="./detail.html">这是新闻列表也.</a>
		</h4>
			<div class="pull-right hidden-xs contribute">
			<span class="pull-right text-color-999">贡献</span>	    
		    	<a class="aw-user-name" data-id="75" href="./people/nidedd" rel="nofollow"><img src="./uploads/avatar/000/00/00/75_avatar_mid.jpg" alt="" /></a>
		    	<a class="aw-user-name" data-id="101" href="./people/cuevven" rel="nofollow"><img src="./uploads/avatar/000/00/01/01_avatar_mid.jpg" alt="" /></a>
		    </div>
				
		<p>
			<a href="./people/cuevven" class="aw-user-name" data-id="101">cuevven</a> 
			<span class="text-color-999">
			回复了问题 • 3 人关注 • 3 个回复 • 445 次浏览 • 2015-08-30 14:17
			</span>
			<span class="text-color-999 related-topic hide"> •  来自相关话题</span>
		</p>
	</div>
</div>
<div class="aw-item " data-topic-id="306,">
	<a class="aw-user-name hidden-xs" data-id="1759" href="./people/kanjiushi" rel="nofollow"><img src="./static/common/avatar-max-img.png" alt="" /></a>	
	<div class="aw-question-content">
		<h4>
			<a href="./detail.html">这是新闻列表也.</a>
		</h4>
			<div class="pull-right hidden-xs contribute">
			<span class="pull-right text-color-999">贡献</span>	    
		    	<a class="aw-user-name" data-id="75" href="./people/nidedd" rel="nofollow"><img src="./uploads/avatar/000/00/00/75_avatar_mid.jpg" alt="" /></a>
		    	<a class="aw-user-name" data-id="101" href="./people/cuevven" rel="nofollow"><img src="./uploads/avatar/000/00/01/01_avatar_mid.jpg" alt="" /></a>
		    </div>
				
		<p>
			<a href="./people/cuevven" class="aw-user-name" data-id="101">cuevven</a> 
			<span class="text-color-999">
			回复了问题 • 3 人关注 • 3 个回复 • 445 次浏览 • 2015-08-30 14:17
			</span>
			<span class="text-color-999 related-topic hide"> •  来自相关话题</span>
		</p>
	</div>
</div>
<div class="aw-item " data-topic-id="306,">
	<a class="aw-user-name hidden-xs" data-id="1759" href="./people/kanjiushi" rel="nofollow"><img src="./static/common/avatar-max-img.png" alt="" /></a>	
	<div class="aw-question-content">
		<h4>
			<a href="./detail.html">这是新闻列表也.</a>
		</h4>
			<div class="pull-right hidden-xs contribute">
			<span class="pull-right text-color-999">贡献</span>	    
		    	<a class="aw-user-name" data-id="75" href="./people/nidedd" rel="nofollow"><img src="./uploads/avatar/000/00/00/75_avatar_mid.jpg" alt="" /></a>
		    	<a class="aw-user-name" data-id="101" href="./people/cuevven" rel="nofollow"><img src="./uploads/avatar/000/00/01/01_avatar_mid.jpg" alt="" /></a>
		    </div>
				
		<p>
			<a href="./people/cuevven" class="aw-user-name" data-id="101">cuevven</a> 
			<span class="text-color-999">
			回复了问题 • 3 人关注 • 3 个回复 • 445 次浏览 • 2015-08-30 14:17
			</span>
			<span class="text-color-999 related-topic hide"> •  来自相关话题</span>
		</p>
	</div>
</div>
<div class="aw-item " data-topic-id="306,">
	<a class="aw-user-name hidden-xs" data-id="1759" href="./people/kanjiushi" rel="nofollow"><img src="./static/common/avatar-max-img.png" alt="" /></a>	
	<div class="aw-question-content">
		<h4>
			<a href="./detail.html">这是新闻列表也.</a>
		</h4>
			<div class="pull-right hidden-xs contribute">
			<span class="pull-right text-color-999">贡献</span>	    
		    	<a class="aw-user-name" data-id="75" href="./people/nidedd" rel="nofollow"><img src="./uploads/avatar/000/00/00/75_avatar_mid.jpg" alt="" /></a>
		    	<a class="aw-user-name" data-id="101" href="./people/cuevven" rel="nofollow"><img src="./uploads/avatar/000/00/01/01_avatar_mid.jpg" alt="" /></a>
		    </div>
				
		<p>
			<a href="./people/cuevven" class="aw-user-name" data-id="101">cuevven</a> 
			<span class="text-color-999">
			回复了问题 • 3 人关注 • 3 个回复 • 445 次浏览 • 2015-08-30 14:17
			</span>
			<span class="text-color-999 related-topic hide"> •  来自相关话题</span>
		</p>
	</div>
</div>
<div class="aw-item " data-topic-id="306,">
	<a class="aw-user-name hidden-xs" data-id="1759" href="./people/kanjiushi" rel="nofollow"><img src="./static/common/avatar-max-img.png" alt="" /></a>	
	<div class="aw-question-content">
		<h4>
			<a href="./detail.html">这是新闻列表也.</a>
		</h4>
			<div class="pull-right hidden-xs contribute">
			<span class="pull-right text-color-999">贡献</span>	    
		    	<a class="aw-user-name" data-id="75" href="./people/nidedd" rel="nofollow"><img src="./uploads/avatar/000/00/00/75_avatar_mid.jpg" alt="" /></a>
		    	<a class="aw-user-name" data-id="101" href="./people/cuevven" rel="nofollow"><img src="./uploads/avatar/000/00/01/01_avatar_mid.jpg" alt="" /></a>
		    </div>
				
		<p>
			<a href="./people/cuevven" class="aw-user-name" data-id="101">cuevven</a> 
			<span class="text-color-999">
			回复了问题 • 3 人关注 • 3 个回复 • 445 次浏览 • 2015-08-30 14:17
			</span>
			<span class="text-color-999 related-topic hide"> •  来自相关话题</span>
		</p>
	</div>
</div>

<!-- 新闻列表页结束 -->
					</div>
						</div>
						<div class="mod-footer">
							<div class="page-control"><ul class="pagination pull-right"><li class="active"><a href="javascript:;">1</a></li><li><a href="./sort_type-new__day-0__is_recommend-0__page-2">2</a></li><li><a href="./sort_type-new__day-0__is_recommend-0__page-3">3</a></li><li><a href="./sort_type-new__day-0__is_recommend-0__page-4">4</a></li><li><a href="./sort_type-new__day-0__is_recommend-0__page-2">&gt;</a></li><li><a href="./sort_type-new__day-0__is_recommend-0__page-35">&gt;&gt;</a></li></ul></div>						</div>
					</div>
				</div>

				<!-- 侧边栏 -->
				<div class="col-sm-12 col-md-3 aw-side-bar hidden-xs hidden-sm">
					<div class="aw-mod">
	<div class="mod-head">
		<h3>专题</h3>
	</div>
	<div class="mod-body">
		<ul>
							<li><a href="./feature/1">Composer中国镜像</a></li>
					</ul>
	</div>
</div>
					<div class="aw-mod aw-text-align-justify">
	<div class="mod-head">
		<a href="./topic/channel-hot" class="pull-right">更多 &gt;</a>
		<h3>热门话题</h3>
	</div>
	<div class="mod-body">
							<dl>
				<dt class="pull-left aw-border-radius-5">
					<a href="./topic/laravel"><img alt="" src="./static/common/topic-mid-img.png" /></a>
				</dt>
				<dd class="pull-left">
					<p class="clearfix">
						<span class="topic-tag">
							<a href="./topic/laravel" class="text" data-id="57">laravel</a>
						</span>
					</p>
					<p><b>160</b> 个问题, <b>22</b> 人关注</p>
				</dd>
			</dl>
					<dl>
				<dt class="pull-left aw-border-radius-5">
					<a href="./topic/Models"><img alt="" src="./static/common/topic-mid-img.png" /></a>
				</dt>
				<dd class="pull-left">
					<p class="clearfix">
						<span class="topic-tag">
							<a href="./topic/Models" class="text" data-id="187">Models</a>
						</span>
					</p>
					<p><b>3</b> 个问题, <b>1</b> 人关注</p>
				</dd>
			</dl>
					<dl>
				<dt class="pull-left aw-border-radius-5">
					<a href="./topic/Laravel教程"><img alt="" src="./static/common/topic-mid-img.png" /></a>
				</dt>
				<dd class="pull-left">
					<p class="clearfix">
						<span class="topic-tag">
							<a href="./topic/Laravel教程" class="text" data-id="3">Laravel教程</a>
						</span>
					</p>
					<p><b>14</b> 个问题, <b>6</b> 人关注</p>
				</dd>
			</dl>
					<dl>
				<dt class="pull-left aw-border-radius-5">
					<a href="./topic/lumen 安装"><img alt="" src="./static/common/topic-mid-img.png" /></a>
				</dt>
				<dd class="pull-left">
					<p class="clearfix">
						<span class="topic-tag">
							<a href="./topic/lumen 安装" class="text" data-id="962">lumen 安装</a>
						</span>
					</p>
					<p><b>1</b> 个问题, <b>1</b> 人关注</p>
				</dd>
			</dl>
					<dl>
				<dt class="pull-left aw-border-radius-5">
					<a href="./topic/数据列编辑"><img alt="" src="./static/common/topic-mid-img.png" /></a>
				</dt>
				<dd class="pull-left">
					<p class="clearfix">
						<span class="topic-tag">
							<a href="./topic/数据列编辑" class="text" data-id="961">数据列编辑</a>
						</span>
					</p>
					<p><b>1</b> 个问题, <b>1</b> 人关注</p>
				</dd>
			</dl>
					</div>
</div>
					<div class="aw-mod aw-text-align-justify">
	<div class="mod-head">
		<a href="./people/" class="pull-right">更多 &gt;</a>
		<h3>热门用户</h3>
	</div>
	<div class="mod-body">
					
		<dl>
			<dt class="pull-left aw-border-radius-5">
				<a href="./people/digitalpro"><img alt="" src="./static/common/avatar-mid-img.png" /></a>
			</dt>
			<dd class="pull-left">
				<a href="./people/digitalpro" data-id="1909" class="aw-user-name">digitalpro						</a>
				<p class="signature"></p>
				<p><b>6</b> 个问题, <b>1</b> 次赞同</p>
			</dd>
		</dl>
			
		<dl>
			<dt class="pull-left aw-border-radius-5">
				<a href="./people/lumen"><img alt="" src="./static/common/avatar-mid-img.png" /></a>
			</dt>
			<dd class="pull-left">
				<a href="./people/lumen" data-id="2213" class="aw-user-name">lumen						</a>
				<p class="signature"></p>
				<p><b>4</b> 个问题, <b>0</b> 次赞同</p>
			</dd>
		</dl>
			
		<dl>
			<dt class="pull-left aw-border-radius-5">
				<a href="./people/bantes"><img alt="" src="./uploads/avatar/000/00/01/76_avatar_mid.jpg" /></a>
			</dt>
			<dd class="pull-left">
				<a href="./people/bantes" data-id="176" class="aw-user-name">萧晔离<i class="icon-v" title="个人认证"></i>						</a>
				<p class="signature"></p>
				<p><b>15</b> 个问题, <b>6</b> 次赞同</p>
			</dd>
		</dl>
			
		<dl>
			<dt class="pull-left aw-border-radius-5">
				<a href="./people/%E7%BB%86%E4%BD%AC%E8%99%AB%E8%99%AB"><img alt="" src="./uploads/avatar/000/00/04/31_avatar_mid.jpg" /></a>
			</dt>
			<dd class="pull-left">
				<a href="./people/%E7%BB%86%E4%BD%AC%E8%99%AB%E8%99%AB" data-id="431" class="aw-user-name">细佬虫虫						</a>
				<p class="signature"></p>
				<p><b>13</b> 个问题, <b>7</b> 次赞同</p>
			</dd>
		</dl>
			
		<dl>
			<dt class="pull-left aw-border-radius-5">
				<a href="./people/%E4%B9%A0%E6%83%AF%E5%AD%A4%E7%8B%AC"><img alt="" src="./static/common/avatar-mid-img.png" /></a>
			</dt>
			<dd class="pull-left">
				<a href="./people/%E4%B9%A0%E6%83%AF%E5%AD%A4%E7%8B%AC" data-id="466" class="aw-user-name">习惯孤独						</a>
				<p class="signature"></p>
				<p><b>8</b> 个问题, <b>1</b> 次赞同</p>
			</dd>
		</dl>
					</div>
</div>				</div>
				<!-- end 侧边栏 -->
			</div>
		</div>
	</div>
</div>

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
			$('#__crond').html(unescape('%3Cimg%20src%3D%22' + G_BASE_URL + '/crond/run/1441805824%22%20width%3D%221%22%20height%3D%221%22%20/%3E'));
		});
	</script>
</div>

<!-- Escape time: 0.094851016998291 --><!-- / DO NOT REMOVE -->

</body>
</html>