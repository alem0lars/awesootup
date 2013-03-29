class Author < ActiveRecord::Base
  attr_accessible :email, :name, :website

  has_many :awesootup_modules
end
