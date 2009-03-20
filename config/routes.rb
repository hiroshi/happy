ActionController::Routing::Routes.draw do |map|
  map.resource :session

  map.resources :people

  map.resources :sites

  map.resources :happies, :only => [:index, :create]
  map.root :controller => "happies", :action => "home"
  map.loader "loader.js", :controller => "happies", :action => "loader", :format => :js
end
