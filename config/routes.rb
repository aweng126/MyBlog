Rails.application.routes.draw do

  # get 'posts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :user
    resource :sessions
    get "",to:"sessions#new"
    post "",to:"sessions#create"
  end


  constraints(id:/\d*/) do
        namespace :admin do
           get 'posts/edit/:id',to:"posts#edit"
           get 'posts/:id',to:"posts#show"
           get 'posts',to:"posts#index"
           resource :posts
          end
 end

  get"/posts/home",to:redirect("/posts")
  get"/posts/about",to:redirect("/about")
          #设置对应的资源控制符合rest风格
          # 在articals资源中创建comments资源，这种方式称为嵌套资源。表明文章和评论之间层级关系的另一种形式。
  resources :posts  do
    resources :comments,only:[:index,:show]
  end


=begin
通过下面这条语句，来设定主页
localhost：3000访问的主页
=end

root "posts#index"

   get "/home",to: "posts#index"

   get "/about",to: "posts#about"

end
