class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def create
    @comment = Comment.new(comments_params)
    @doc = Doc.find(params[:id])
    @user = current_user
    @comment.doc = @doc
    @comment.user = @user

    if comment.save
      redirect_to @doc
    else
      render 'doc/show'
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

  def comments_params
    params.require(:comment).permit(:text, :user_id, :version_id)
  end
end
