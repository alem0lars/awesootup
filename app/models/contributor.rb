class Contributor < ActiveRecord::Base
  attr_accessible :name, :email, :website, :contributions
end
