class RegistrationsController < Devise::RegistrationsController
  
  def following
    @title = "フォロー中"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end
 
  def followers
    @title = "フォロワー"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
  
  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
  
  def after_update_path_for(resource)
    user_path(resource)
  end
  
end