class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
  	@users = User.all
    @post = Book.new
  end

  def follow_list
   @user = User.find(params[:id])
  end

  def follower_list
    @user = User.find(params[:id])
  end 

  def show
  	@user = User.find(params[:id])
    @post = Book.new

    
  end

  def edit
  	@user = User.find(params[:id])
    if @user != current_user
      redirect_to current_user
    end
  end


  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = "successfully"
  	redirect_to user_path(@user)
   else
    render :edit
   end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image) 
 end
end
