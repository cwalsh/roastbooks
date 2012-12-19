class Book < ActiveRecord::Base
  attr_accessible :authors, :isbn, :isbn13, :publisher, :publisher_id, :title, :title_long
  has_and_belongs_to_many :libraries
  require 'web_service_clients/isbndb_client'
  def self.find_or_populate_by_isbn isbn
    Book.find_by_isbn(isbn) ||
    Book.create_from_google_books(isbn) ||
    Book.create(::WebServiceClients::IsbndbClient.find(isbn))
  end

  def self.create_from_google_books(isbn)
    found = GoogleBooks.search(isbn).first
    self.create! title: found.title,
      title_long: found.title,
      authors: found.authors,
      publisher: found.publisher,
      isbn: found.isbn_10 || found.isbn_13,
      isbn13: found.isbn_13
  end
end

#TODO:
#published_date
#description
#page_count
#print_type
#categories Returns all categories as a comma delimited string
#average_rating
#ratings_count
#language
#preview_link
#info_link
#image_link
