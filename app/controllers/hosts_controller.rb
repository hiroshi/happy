class HostsController < ApplicationController
  def index
  end

  def show
    @host = Person.find_by_identity_url(params[:identity_url])
  end
end
