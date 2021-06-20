class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
    @docs_final = Doc.joins(:userdocs).where(["userdocs.user_id = ? and final = ?", current_user, true]).order(created_at: :desc)
    @docs_not_final = Doc.joins(:userdocs).where(["userdocs.user_id = ? and final = ?", current_user, false])
  end

  def edit; end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :phone_number, :company, :email, :photo)
  end
end
