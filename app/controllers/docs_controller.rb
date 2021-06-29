class DocsController < ApplicationController
  before_action :set_doc, only: [:show, :edit, :update]

  def index
    if params[:query].present?
      user_docs = Doc.joins(:userdocs).where("userdocs.user_id = ?", current_user).order(created_at: :desc)
      @docs = user_docs.search_by_title(params[:query])
    else
      @docs = Doc.joins(:userdocs).where(["userdocs.user_id = ? and final = ?", current_user, false]).order(created_at: :desc)
    end
  end

  def final
    @docs = Doc.joins(:userdocs).where(["userdocs.user_id = ? and final = ?", current_user, true])
    # @docs_final = @docs.where(final: true)
  end

  def show
    @new_userdoc = Userdoc.new
    @userdocs = @doc.userdocs
    @userdoc = Userdoc.where(doc_id: @doc, user_id: current_user).last
  end

  def new
    @doc = Doc.new
    # @doc.userdocs.build
  end

  def create
    @doc = Doc.new(doc_params)
    @userdoc = Userdoc.new(doc: @doc, user: current_user, owner: true)
    @version = Version.new(rich_body: @doc.rich_body, user: current_user, doc: @doc, accepted: true)
    if @doc.save && @userdoc.save && @version.save
      redirect_to @doc
    else
      render :new
    end
  end

  def edit;end

  def update
    @doc.update(doc_params)
    redirect_to @doc
  end

  private

  def doc_params
    params.require(:doc).permit(:title, :text, :rich_body, :locked)
    # params.require(:doc).permit(:title, :text, userdocs_attributes: [:doc, :owner, user: []])
  end

  def set_doc
    @doc = Doc.find(params[:id])
  end
end
