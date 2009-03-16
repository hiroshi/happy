class SitesController < ApplicationController
  def index
    @sites = Site.find(:all)
  end
end
