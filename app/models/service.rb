# == Schema Information
#
# Table name: services
#
# *id*::         <tt>integer, not null, primary key</tt>
# *user_id*::    <tt>integer</tt>
# *provider*::   <tt>string(255)</tt>
# *uid*::        <tt>string(255)</tt>
# *created_at*:: <tt>datetime, not null</tt>
# *updated_at*:: <tt>datetime, not null</tt>
#--
# == Schema Information End
#++

# A `Service` is used by a `User` to authenticate himself using `omniauth`
class Service < ActiveRecord::Base
  belongs_to :user
end
