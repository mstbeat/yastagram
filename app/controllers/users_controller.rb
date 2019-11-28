class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order('created_at DESC')
    @post = Post.find_by(id: params[:id])
    @followers = @user.followers
    @following = @user.following
  end
end
