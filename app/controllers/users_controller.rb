class UsersController < ApplicationController
  before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
    # user = User.first
    # user.posts.create(title: "sample")
  end

  def user_params
    params.expect(user: [ :first_name, :last_name, :other_stuff ])
  end

  private

  def require_login
    if current_user.logged_in?
    # allow the user to perform the action they wanted
    else
      redirect_to login_path
    end
  end
end
