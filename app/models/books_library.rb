class BooksLibrary < ActiveRecord::Base
  belongs_to :book
  belongs_to :library
  # attr_accessible :title, :body
end
