class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: 'Admin was successfully added.'
    else
      flash.now[:alert] = 'Admin could not be created due to errors.'
      render :new
    end
  end

  def destroy
    if User.count > 1
      @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = 'Admin was successfully removed'
      redirect_to users_path
    else
      flash[:alert] = 'Cannot delete the last remaining admin'
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name_first, :name_last, :password_confirmation)
  end
end
