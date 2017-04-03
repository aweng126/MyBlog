Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get"/posts/home",to:redirect("/posts")
  get"/posts/about",to:redirect("/about")
  #设置对应的资源控制符合rest风格
  # 在articals资源中创建comments资源，这种方式称为嵌套资源。表明文章和评论之间层级关系的另一种形式。
  resources :posts do
  resource :comments
end

=begin
通过下面这条语句，来设定主页
localhost：3000访问的主页
=end

root "posts#index"

get "/home",to: "posts#index"

  get "/about",to: "posts#about"


=begin
  通过正则表达式进行路由设置
=end



end
