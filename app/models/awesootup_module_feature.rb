class AwesootupModuleFeature < ActiveRecord::Base

  attr_accessible :name, :desc

  has_and_belongs_to_many :provided_by,
      :class_name => 'AwesootupModule',
      :join_table => 'awesootup_modules_provides'

  has_and_belongs_to_many :pre_req_of,
      :class_name => 'AwesootupModule',
      :join_table => 'awesootup_modules_pre_reqs'

  has_and_belongs_to_many :post_req_of,
      :class_name => 'AwesootupModule',
      :join_table => 'awesootup_modules_post_reqs'

end
