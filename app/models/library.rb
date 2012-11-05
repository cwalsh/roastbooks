class Library < ActiveRecord::Base
  belongs_to :owner, :class_name => "User", :inverse_of => :libraries
  attr_accessible :description, :location, :name
  validates :owner, :presence => true
  has_and_belongs_to_many :books
end
