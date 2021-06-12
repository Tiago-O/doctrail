class UserdocsController < ApplicationController
  def create
    @userdoc = Userdoc.new(userdoc_params)
    @userdoc.owner = false
    if @userdoc.save!
      flash[:notice] = 'saved!'
      redirect_to @userdoc.doc
    else
      flash[:alert] = 'not saved!'
      redirect_to @userdoc.doc, fallback: docs_path
    end
  end

  private

  def userdoc_params
    params.require(:userdoc).permit(:user_id, :doc_id)
  end
end
