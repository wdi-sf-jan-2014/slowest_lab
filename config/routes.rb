SlowestLab::Application.routes.draw do
  root :to => "dashboard#show"
  resources :users, :only => [:create, :show, :index]
  resources :sessions, :only => [:create, :new]
  delete '/sessions', :to => 'sessions#destroy', :as => :signout
  resources :venues, :only => [:show, :index]
  resources :shows, :only => [:show, :index] do
    resources :attendances, :only => [:create, :destroy]
  end
  resources :follows, :only => [:create, :destroy]
end
