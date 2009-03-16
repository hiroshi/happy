class HappiesController < ApplicationController
  def home
  end

  def loader
  end

  def index
    @site = Site.find_or_create_by_uri(params[:uri] || request.referer)
    @count = @site.happies.count
  end

  def create
    @site = Site.find_or_create_by_uri(params[:uri])
    @happy = @site.happies.build(params[:happy])
    if @happy.save
      redirect_to happies_path(:uri => @site.uri)
    else
      # TODO: What shall we do if save is failed...
    end
  end
end
