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

3. 关于数据库问题
   1. 初步了解数据库对应关系，以及在ruby on rail 中使用封装好的语句进行查询
   2. 使用**DbBrowerForSQLite**来直接打开ruby项目中的development.sqlite3文件进行操作
   3. 在html中使用ruby集成的标签进行展示数据，发送数据
   4. rails c 进入rails console界面，从而可以对数据进行一定的查询和处理，比如Post.all可以查询
   posts表中所有数据，使用Category.create(name:tag)创建一条新的category记录等。
   5. 在run界面可以看到对应的数据请求，可以通过这个来进行bug的查找和排除。比如看接收的参数，进行的处理等
   同时在代码中使用puts输出的命令会在运行窗口出现。
   
   存在问题：
   1. 电脑本身没有安装sqlite3 也能通过develop来进行操作。原因未知
   2. 如何利用console来处理development项目过程中的数据，
      关键是如何优雅的使用sql语句来进行进一步的查询
      
   小感受
   1. 对于一个初等教程来说越过某些步骤然后在视频中还不说明这就过分了哈。
   2. 文档太多不是好事情，容易看花眼。
   3. stackover 是一个好网站。

4. 存在问题，创建post文章time.now什么时候创建并添加到参数里面？
    回复：当成功创建之后，然后通过find找到。然后设定之后重新进行保存

5. 放弃使用sqlite ，集成mysql ;放弃麦子学院教程，自行突破。



