class Book < ActiveRecord::Base
  attr_accessible :authors, :isbn, :isbn13, :publisher, :publisher_id, :title, :title_long
end
