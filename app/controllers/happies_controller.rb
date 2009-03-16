class HappiesController < ApplicationController
  def home
  end

  def loader
  end

  def index
    @count = Happy.count
  end

  def create
    @happy = Happy.new(params[:happy])
    if @happy.save
      redirect_to happies_path
    else
      # TODO: What shall we do if save is failed...
    end
  end
end
