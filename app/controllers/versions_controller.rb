class VersionsController < ApplicationController
  before_action :set_version, only: %i[show edit update]

  def index
    @versions = Version.all
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(version_id: @version).order(created_at: :desc)
  end

  def new
    @version = Version.new
    @doc = Doc.find(params[:doc_id])
    @version.rich_body = @doc.rich_body
  end

  def create
    @version = Version.new(version_params)
    @doc = Doc.find(params[:doc_id])
    @user = current_user
    @version.doc = @doc
    @version.user = @user
    if @version.save
      @doc.locked = true
      @doc.save
      redirect_to @version
    else
      render :new
    end
  end

  def edit; end

  def update
    doc = @version.doc
    @version.update(version_params)
    if @version.accepted
      doc.locked = false
      doc.rich_body = @version.rich_body
      if doc.save
        redirect_to doc
      end
    else
      flash[:alert] = 'unlocking the document failed'
      render :show
    end
  end

  private

  def set_version
    @version = Version.find(params[:id])
  end

  def version_params
    params.require(:version).permit(:text, :rich_body, :accepted, :user_id, :doc_id)
  end
end
