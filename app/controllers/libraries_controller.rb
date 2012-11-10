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
    @resource = Book.find_or_populate_by_isbn(params[:isbn])
    current_user.libraries.find(params[:id]).books << @resource
  end

protected
  def begin_of_association_chain
    current_user
  end
end
