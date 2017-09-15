class DocumentsController < ApplicationController
  def index
    @documents =
        if params[:query].present?
          Document.search(params[:query])
        else
          Document.all
        end
    @documents = @documents.page(params[:page])
  end
end
