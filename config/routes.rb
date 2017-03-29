Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #设置对应的资源控制符合rest风格
resources :posts

=begin
通过下面这条语句，来设定主页
localhost：3000访问的主页
=end

root "posts#show"

get "/home",to: "posts#show"

  get "/about",to: "posts#about"

end
