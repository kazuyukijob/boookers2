class UsersController < ApplicationController
  before_action :ensure_current_user, {only: [:edit, :update]}
  def show
     @user = User.find(params[:id])
     @books = @user.books
     @book = Book.new
     @book_comment = BookComment.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "successfully"
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def ensure_current_user
    if current_user.id != params[:id].to_i
    flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to user_path(current_user.id)
    end
  end
end
