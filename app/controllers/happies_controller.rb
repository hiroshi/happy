class HappiesController < ApplicationController
  def create
    @host = Person.find_by_identity_url(params[:identity_url])
    @happy = @host.host_happies.build((params[:happy] || {}).merge(:guest_person_id => current_guest.id))
    if @happy.save
      redirect_to host_path(:site_url => @happy.url, :identity_url => params[:identity_url])
    else
      # TODO: What shall we do if save is failed...
    end
  end
end
