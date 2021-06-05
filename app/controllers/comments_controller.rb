class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def create
    @comment = Comment.new(comment_params)
    @version = Version.find(params[:version_id])
    @user = current_user
    @comment.version = @version
    @comment.user = @user

    if @comment.save
      redirect_to @version
    else
      render 'version/show'
    end
  end

  def edit; end

  def update
    @comment.update(comments_params)
    redirect_to version_path(current_user)
  end

  def destroy
    @comment.destroy
    redirect_to version_path(current_user)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text, :user_id, :version_id)
  end
end
