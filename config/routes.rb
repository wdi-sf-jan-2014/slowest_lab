SlowestLab::Application.routes.draw do
  root :to => "dashboard#show"
  resources :users, :only => [:create, :show, :index]
  resources :sessions, :only => [:create, :destroy, :new]
  resources :venues, :only => [:create, :show, :index]
  resources :shows, :only => [:create, :show, :index] do
    resources :attendances, :only => [:create, :destroy, :index]
  end
  resources :follows, :only => [:create, :destroy]
end
