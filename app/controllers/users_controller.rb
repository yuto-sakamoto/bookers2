class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_count_today = @books.created_today.count
    @book_count_1days_ago = @books.created_1days_ago.count
    @book_count_2days_ago = @books.created_2days_ago.count
    @book_count_3days_ago = @books.created_3days_ago.count
    @book_count_4days_ago = @books.created_4days_ago.count
    @book_count_5days_ago = @books.created_5days_ago.count
    @book_count_6days_ago = @books.created_6days_ago.count
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end