# == Schema Information
#
# Table name: users
#
# *id*::            <tt>integer, not null, primary key</tt>
# *name*::          <tt>string(255)</tt>
# *email*::         <tt>string(255)</tt>
# *website*::       <tt>string(255)</tt>
# *contribs_misc*:: <tt>string(255)</tt>
# *created_at*::    <tt>datetime, not null</tt>
# *updated_at*::    <tt>datetime, not null</tt>
#--
# == Schema Information End
#++

# A user is a member of awesootup
# It is authenticated through `services` (using the `omniauth` gem)
# It can be a contributor:
# - Generic contributions under the field `contribs_misc`
# - `AwesootupModule` contributions under the field `awesootup_modules`
class User < ActiveRecord::Base
  attr_accessible :name,         # The name (can be everything, i don't care)
                  :email,        # The email
                  :website,      # The website
                  :contribs_misc # Contributions which doesn't fit anywhere else

  # Services used to authenticate the user
  has_many :services

  # The awesootup modules which the user has been contributed
  has_many :awesootup_modules
end
