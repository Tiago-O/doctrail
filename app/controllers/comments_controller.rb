class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comments_params)
    @doc = Doc.find(params[:id])
    @user = current_user
    @comment.doc = @doc
    @comment.user = @user

    if comment.save
      redirect_to @doc
    else
      render :new # should be 'docs/show'
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:text)
  end
end
