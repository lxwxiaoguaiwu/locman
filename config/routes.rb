Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index, :show,:update]
      resources :posts
      resources :shows
      resources :sermen
      resources :tags
      resources :swipper
      resources :quxians, only:[:show,:index]
      resources :shangquans, only:[:show, :index]
      resources :xiaoqus, only:[:show, :index]
      resources :wesessions
      resources :weixins
      resources :events
      resources :passes
      resources :applies
      resources :exchanges
      resources :thumbsups
      # resources :comments



      get 'session/login', to: 'sessions#onlogin'
      post 'session', to: 'sessions#create'
      post 'comments/shows', to: 'comments#showscreate'
      post 'comments/posts', to: 'comments#postscreate'
      post 'comments/sermen', to: 'comments#sermencreate'
      post 'comments/weixins', to: 'comments#weixincreate'
      post 'comments/passes', to: 'comments#passescreate'

      get 'comments/shows/*showid', to: 'comments#showsindex'
      get 'comments/posts/*postid', to: 'comments#postsindex'
      get 'comments/weixins/*weixinid', to: 'comments#weixindex'
      get 'comments/passes/*passid', to: 'comments#passesindex'

      get 'session/lastrecord', to: 'sessions#haslast'
      get 'users/allcomments/*id', to: 'users#allcomment'
      get 'users/allposts/*id', to: 'users#allposts'
      get 'users/allsermen/*id', to: 'users#allsermen'
      post 'users/onlogin', to: 'users#onlogin'

      post 'posts/like',to: 'posts#postlike'
      post 'posts/saveimgs',to: 'posts#saveimgs'
      post 'events/saveimgs',to: 'events#saveimgs'
      post 'weixins/saveimgs',to: 'weixins#saveimgs'



    end

    namespace :v2 do
      resources :childimgs
      resources :childlaps
      resources :children
      resources :equipment
      resources :laps
      resources :teachers
      resources :lapresults

      post 'upload', to: 'lapresults#initRecord'

    end

    namespace :v3 do
      resources :gradevins
      resources :gradgoods
      resources :webgoods
      resources :swipper
      resources :gradorders
      resources :alcoholusers
      resources :weborders
      resources :alcoaddresses
      resources :alcrecords
      resources :alcscores

      get 'orders',to: 'alcoholusers#allorders'
      post 'wx/response', to: 'gradorders#weixinorder'
      post 'web/response', to: 'weborders#weixinorder'
    end

    namespace :v4 do
      resources :users, only: [:create, :index, :show,:update]
      resources :sermen
      get 'serman',to: 'sermen#findbyphone'
      get 'sumserman', to: 'sermen#sumserman'
    end
  end
end
