class BooksController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!
  respond_to :html, :json, :xml

  def create
    @book = Book.new params[:book]
    if @book.save
      redirect_to @book
    else
      render :action => :new
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes params[:book]
      redirect_to @book
    else
      render :action => :edit
    end
  end

end
