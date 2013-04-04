class LibrariesController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!
  respond_to :json, :only => [:add_book]

  def create
    @library = Library.new params[:library]
    @library.owner = current_user
    if @library.save
      redirect_to @library
    else
      render :action => :new
    end
  end

  def update
    @library = current_user.libraries.find params[:id]
    if @library.update_attributes params[:library]
      redirect_to @library
    else
      render :action => :edit
    end
  end

  def add_book
    @library = current_user.libraries.find params[:id]
    @book = Book.find_or_populate_by_isbn(params[:isbn])
    @library.books << @book unless @library.books.include? @book
    redirect_to @library
  end

  def remove_book
    @library = current_user.libraries.find params[:library_id]
    @library.books.delete @library.books.find(params[:id])
    redirect_to @library
  end

  def all
    @libraries = Library.page params[:page]
    render
  end

protected
  def begin_of_association_chain
    current_user
  end
  def library_books
    @library.books.order("id desc").page params[:page]
  end
  helper_method :library_books
end
