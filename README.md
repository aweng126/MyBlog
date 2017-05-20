# 关于MyBlog项目

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
   6. 尽量使用迁移来进行数据库的更改，而不是直接用mysql命令行窗口
   7. 版本迁移 rake db:migrate     版本回退rake db:rollback
   
4. 要遵从rails的两大原则，DRY 和 惯例优先于配置
   所以尽量用写好的脚手架，不要自行去一步一步写，不要自行去拼凑我们的前端代码，对于url尽量使用路由助手。
   
5. rubymine 有一个快捷键一定要知道   ctrl+alt+G 实际上就是rails  generate 命令，具体自行体会就好。
  
      
   小感受
   1. 对于一个初等教程来说越过某些步骤然后在视频中还不说明这就过分了哈。
   2. 文档太多不是好事情，容易看花眼。
   3. stackover 是一个好网站。


6. 在学习过程中觉得有用的部分资料
 <li><a href="http://www.linuxidc.com/Linux/2015-10/124373.htm">windows系统环境安装</a></li>
        <li><a href="http://rubyinstaller.org/">window-rubyinstaller</a></li>
        <li><a href="http://huacnlee.com/blog/how-to-start-learning-ruby-on-rails/">如何从零开始学会 Ruby on Rails?</a></li>
        <li><a href="http://cutesunshineriver.iteye.com/blog/809562">Rails入门</a></li>
        <li><a href="http://www.bagualu.net/wordpress/archives/6396">rails模型</a></li>
        <li><a href="https://rubygems.org/">rubygems</a></li>
        <li><a href="http://api.rubyonrails.org/">rails API</a></li>
        <li><a href="https://guides.ruby-china.org/">rails guides</a></li>
        <li><a href="https://www.jetbrains.com/help/ruby/2016.3/quick-start-guide.html">IDE - rubymine</a></li>
        <li><a href="https://rails-practice.com/content/">书籍 - rails实践</a></li>
        <li><a href="https://railstutorial-china.org/book/">书籍 - rails教程</a></li>
        <li><a href="https://ihower.tw/rails/environments-and-bundler.html">书籍 - Ruby on Rails 實戰聖經</a></li>

7. 在本项目写作过程中碰到的问题和部分文章已经发表在[简书]（http://www.jianshu.com/u/4a05ba219654）上，需要的话可以自行查看

