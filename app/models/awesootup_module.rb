class AwesootupModule < ActiveRecord::Base

  attr_accessible :name, :desc

  belongs_to :author

  has_and_belongs_to_many :provides,
      :class_name => 'AwesootupModuleFeature',
      :join_table => 'awesootup_modules_provides'

  has_and_belongs_to_many :pre_reqs,
      :class_name => 'AwesootupModuleFeature',
      :join_table => 'awesootup_modules_pre_reqs'

  has_and_belongs_to_many :post_reqs,
      :class_name => 'AwesootupModuleFeature',
      :join_table => 'awesootup_modules_post_reqs'

end
