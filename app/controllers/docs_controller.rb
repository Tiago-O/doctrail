class DocsController < ApplicationController
  before_action :set_doc, only: [:show, :edit, :update]

  def index
    @docs = Doc.all
  end

  def show;end

  def new
    @doc = Doc.new
  end

  def create
    @doc = Doc.new(doc_params)
    if @doc.save
      redirect_to @doc
    else
      render :new
  end

  def edit

  end

  private

  def docs_params
    params.require(:doc).permit(:title, :text)
  end

  def set_doc
    @doc = Doc.find(params[:id])
  end
end
