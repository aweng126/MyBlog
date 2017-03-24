# 关于MyBlog项目

手动的去写博客，预计时间为3天。

##记录要点

1. 使用bootstap对应的博客主题，可以直接将对应代码放到view/layouts/application.html.erb中
   关于样式，最简单粗暴的方式是用博客的地址替换原来html相对路径中的../..

   RubyMine替换的快捷键ctrl+r

   注意href也要进行替换，直接引用对应网站对应博客的css资源
   类似这样 **href="https://getbootstrap.com/examples/blog/blog.css" rel="stylesheet"**

2. 主体部分和细节部分视图
   讲网页主体样式放到./view/layouts/application.html.erb中，而对应中间的变化的内容要分离出来。
   放到对应的的活动对应的视图。注意在application.html中使用的是 <%= yield %>来决定要插入的位置，
   一般为中间内容部分的container对应的div

3. 

