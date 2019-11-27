class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
    @post = Post.find_by(id: params[:id])
  end
end
