class UsersController < ApplicationController

  def index
    @notifications = Notification.where(user_id:current_user)
  end

  def show
    @notifications = Notification.where(user_id:current_user)
    @user = User.find(params[:id])
  end

  def update
    current_user.update(role: params[:user][:role])
    redirect_to '/'
  end


# Oauth/Signup routes

  CLIENT_ID = "336184733554-fpkrdqv8iis7hfifcoq6rq2b4ln3kn4c.apps.googleusercontent.com"
  CLIENT_SECRET = "_MYiDzimywN_PUPp-2VyWuXM"

  def client
    client ||= OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, {
              :site => 'https://accounts.google.com',
              :authorize_url => "/o/oauth2/auth",
              :token_url => "/o/oauth2/token"
            })
  end

  def auth
    redirect_to client.auth_code.authorize_url(:redirect_uri => 'http://localhost:3000/callback',:scope => 'https://www.googleapis.com/auth/userinfo.email',:access_type => "offline")
  end

  def callback
    #Gets the Access Token for the User Signed In and Stores it
    access_token = client.auth_code.get_token(params[:code], :redirect_uri => 'http://localhost:3000/callback')
    #Stores all the Information that Google Sends Back In Variable For Later Use
    response = access_token.get('https://www.googleapis.com/oauth2/v1/userinfo?alt=json')
    #Gets the Info Specifically About the signed in User
    user_info = JSON.parse(response.body)
    #Using the Information Google Sent Back Look for or create the User
    previous_size = User.all.size
    @user = User.find_or_create_by(email: user_info["email"])
    @user.update(name: user_info["name"] , email: user_info["email"], photo: user_info["picture"], oauthtoken: access_token.token, oauthrefresh: access_token.refresh_token)
    session[:user_id] = @user.id
    # If this is a newly created user, let them assign their type. Else render homepage.
    if previous_size < User.all.size
      redirect_to "/type"
    else
      redirect_to '/'
    end
  end

  def type
    @user = current_user
    render :type
  end

  def destroy
    user_token = current_user.oauthtoken
    current_user.destroy
    session.clear
    # This line should goto google and remove our privlidges.
    # redirect_to 'https://accounts.google.com/o/oauth2/revoke?token={#{user_token}}'
    redirect_to '/'
  end

end
