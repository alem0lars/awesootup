# == Schema Information
#
# Table name: awesootup_features
#
# *id*::         <tt>integer, not null, primary key</tt>
# *name*::       <tt>string(255)</tt>
# *content*::    <tt>text</tt>
# *created_at*:: <tt>datetime, not null</tt>
# *updated_at*:: <tt>datetime, not null</tt>
#--
# == Schema Information End
#++

class AwesootupFeature < ActiveRecord::Base
  attr_accessible :name, :content
end
