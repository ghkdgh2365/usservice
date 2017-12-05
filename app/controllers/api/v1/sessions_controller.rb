class Api::V1::SessionsController < Devise::SessionsController
  acts_as_token_authentication_handler_for User
  
  skip_before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token
  skip_before_filter :verify_signed_out_user, only: :destroy
  respond_to :json

  def create
      warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
      render :status => 200,
            :json => { :success => true,
                        :info => "Logged in",
                        :data => { :auth_token => current_user.authentication_token, :user_id => current_user.id } }
  end

  def destroy
    user = User.find_by(authentication_token: params[:auth_token])
    unless user.nil?
    puts current_user
    puts 'a'
      # current_user.update_column(:authentication_token, nil)
    end
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged out",
                      :data => {} }
  end

  def failure
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Failed",
                      :data => {} }
  end
  
  def verify_token
    @user = User.find_by(authentication_token: params[:token])
    if  @user != nil && @user.cards != []
      render json: { user_id: @user.id, 
                     email: @user.email, 
                     username: @user.username,
                     univ_id: @user.univ_id,
                     college_id: @user.college_id,
                     major_id: @user.major_id,
                     info: "Logged in"
      }  
      puts current_user
    elsif @user != nil && @user.cards == []
      render json: {
                     user_id: @user.id, 
                     email: @user.email, 
                     username: @user.username,
                     univ_id: @user.univ_id,
                     college_id: @user.college_id,
                     major_id: @user.major_id, 
                     info: "Card Registered"
      }
    else
      render json: {
                     info: "Not Logged in"
      }
      puts current_user
    end
    
  end
  
end