class UserdocsController < ApplicationController
  before_action :set_userdoc, only: %i[update]

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

  def update
    if @userdoc.update(userdoc_params)
      if @userdoc.doc.zero_happy?
        @userdoc.doc.final = true
        @userdoc.doc.locked = true
        @userdoc.doc.save
      end
      redirect_to @userdoc.doc
    else
      flash[:alert] = 'update failed'
      render docs_path
    end
  end

  private

  def set_userdoc
    @userdoc = Userdoc.find(params[:id])
  end

  def userdoc_params
    params.require(:userdoc).permit(:user_id, :doc_id, :happy)
  end
end
