Rails.application.routes.draw do
  get 'posts/index' => 'posts#index'

  get 'posts/:id/edit' => 'posts#edit'

  post 'posts/create' => 'posts#create'

  get 'posts/:id/show' => 'posts#show'

  post "posts/:id/destroy" => "posts#destroy"

  post 'posts/:id/update' => 'posts#update'

  get '/' => 'home#top'
end
