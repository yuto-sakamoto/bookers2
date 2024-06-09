class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @today_books_count = @books.created_today.count
    @yesterday_books_count = @books.created_yesterday.count
    @this_week_books_count = @books.created_this_week.count
    @last_week_books_count = @books.created_last_week.count
    service = PostCountService.new
    @compare_with_previous_day = service.compare_with_previous(@today_books_count, @yesterday_books_count)
    @compare_with_previous_week = service.compare_with_previous(@this_week_books_count, @last_week_books_count)
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