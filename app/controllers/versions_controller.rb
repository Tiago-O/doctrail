class VersionsController < ApplicationController
  before_action :set_version, only: %i[show edit update]

  def index
    @versions = Version.all
  end

  def show; end

  def new
    @version = Version.new
    @doc = Doc.find(params[:doc_id])
  end

  def create
    @version = Version.new(version_params)
    @doc = Doc.find(params[:doc_id])
    @user = current_user
    @version.doc = @doc
    @version.user = @user
    if @version.save
      redirect_to @version
    else
      render :new
    end
  end

  def edit; end

  def update
    @version.update(version_params)
    redirect_to @version
  end

  private

  def set_version
    @version = Version.find(params[:id])
  end

  def version_params
    params.require(:version).permit(:text, :user_id, :doc_id)
  end
end
