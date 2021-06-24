class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def dashboard
    @docs_final = Doc.joins(:userdocs).where(["userdocs.user_id = ? and final = ?", current_user, true]).order(created_at: :desc)
    @docs_not_final = Doc.joins(:userdocs).where(["userdocs.user_id = ? and final = ?", current_user, false])
  end

  def home; end

  def about; end
end
