# A `Service` is used by a `User` to authenticate himself using `omniauth`
class Service < ActiveRecord::Base
  belongs_to :user
end
