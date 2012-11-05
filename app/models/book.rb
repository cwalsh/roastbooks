class Book < ActiveRecord::Base
  attr_accessible :authors, :isbn, :isbn13, :publisher, :publisher_id, :title, :title_long
  has_and_belongs_to_many :libraries
  require 'web_service_clients/isbndb_client'
  def self.find_or_populate_by_isbn isbn
    Book.find_by_isbn(isbn) || Book.create(::WebServiceClients::IsbndbClient.find(isbn))
  end
end
