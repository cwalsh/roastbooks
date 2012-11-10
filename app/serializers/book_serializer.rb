class BookSerializer < ActiveModel::Serializer
  attributes :id, :isbn, :isbn13, :publisher, :publisher_id, :title, :title_long, :authors
end
