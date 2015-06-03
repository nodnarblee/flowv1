Flowv1::Application.routes.draw do
  root "pages#home"
  get "home", to: "pages#home", as: "home"
  get "favourites", to: "pages#favourites", as: "favourites"
  get "/contact", to: "pages#contact", as: "contact"
  post "/emailconfirmation", to: "pages#email", as: "email_confirmation"

  get "posts", to: "pages#posts", as: "posts"
  get "posts/:id", to: "pages#show_post", as: "post"
  devise_for :users

  #create an article/favourite
  post "favourites/favourite_article", to: "favourites#favourite_article"

  #destroy an article/favourite
  delete "articles/destroy/:id", to: "articles#destroy"

  namespace :admin do
    root "base#index"
    resources :users
    get "posts/drafts", to: "posts#drafts", as: "posts_drafts"
    get "posts/dashboard", to: "posts#dashboard", as: "posts_dashboard"
    resources :posts
  end

end
