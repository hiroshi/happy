class SessionsController < ApplicationController
  def new
  end

  def create
#    if using_open_id?
      open_id_authentication
#     else
#       password_authentication(params[:name], params[:password])
#     end
  end

  protected

#   def password_authentication(name, password)
#     if @current_user = @account.users.authenticate(params[:name], params[:password])
#       successful_login
#     else
#       failed_login "Sorry, that username/password doesn't work"
#     end
#   end

  def open_id_authentication
    session[:site_url] = params[:site_url] if params[:site_url]
    authenticate_with_open_id(params[:openid_identifier]) do |result, identity_url|
      if result.successful?
        # Find identitied person first,
        if @guest = Person.find_by_identity_url(identity_url)
        elsif @guest = Person.find_by_session_key(session[:session_id])
          # or temporary session user already exists use this,
          @guest.update_attributes!(:identity_url => identity_url, :session_id => nil)
        else
          @guest = Person.create_by_identity_url(identity_url)
        end
        successful_login
#         else
#           failed_login "Sorry, no person by that identity URL exists (#{identity_url})"
#         end
      else
        failed_login result.message
      end
    end
    # If you're fine with the result messages above and don't need individual logic on a per-failure basis,
    # you can collapse the case into a mere boolean:
#     authenticate_with_open_id do |result, identity_url|
#       if result.successful? && @current_user = @account.users.find_by_identity_url(identity_url)
#         successful_login
#       else
#         failed_login(result.message || "Sorry, no user by that identity URL exists (#{identity_url})")
#       end
#     end
  end

  private

  def successful_login
    session[:guest_id] = @guest.id
    redirect_to session[:site_url]
  end

  def failed_login(message)
    flash[:error] = message
    redirect_to(new_session_url)
  end
end
