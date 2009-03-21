ActionController::Routing::Routes.draw do |map|
  map.root :controller => "hosts"
  map.resources :hosts, :except => :show
  map.host "host", :controller => "hosts", :action => "show"
  map.host_loader "loader.js", :controller => "hosts", :action => "loader", :format => :js

  map.resource :session

  map.resources :people

  map.resources :sites

  map.resources :happies, :only => [:create]
end
