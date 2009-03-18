class HappiesController < ApplicationController
  def home
  end

  def loader
  end

  def index
    @guest = Person.find_or_create_by_session_key(session[:session_id])
    @site = Site.find_or_create_by_uri(params[:uri] || request.referer)
    @count = @site.happies.count
  end

  def create
    @guest = Person.find_or_create_by_session_key(session[:session_id])
    @site = Site.find_or_create_by_uri(params[:uri])
    @happy = @site.happies.build((params[:happy] || {}).merge(:person_id => @guest.id))
    if @happy.save
      redirect_to happies_path(:uri => @site.uri)
    else
      # TODO: What shall we do if save is failed...
    end
  end
end
