class UsersController < ApplicationController
  before_action :set_locale

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.valid?
    render :new, status: :unprocessable_entity
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end
end
