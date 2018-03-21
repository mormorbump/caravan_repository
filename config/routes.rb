Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/blogs' => 'blogs#index'
  # get '/blogs/new' => 'blogs#new'
  # post '/blogs' => 'blogs#create'
  # get '/blogs/:id' => 'blogs#show', as: "blog"
  # get '/blogs/:id/edit' => 'blogs#edit', as: "edit_blog"
  root "blogs#index"
  # urlを何も指定していない時の初期画面を設定
  resources :blogs
  # resourcesは、よく使うルーティングを自動で定義してくれる便利なメソッド
  # routes.rbで定義したルーティングはターミナルでrake routesと打つと確認できkる。
end
