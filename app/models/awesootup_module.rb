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

  # Find other AwesootupModule objects which have the same pre-requirements and
  # post-requirements
  #
  def equally_satisfied(strict = false)
    pre_reqs_ids = pre_reqs.collect { |pre_req| pre_req.id }
    pre_reqs_ids = pre_reqs.collect { |pre_req| pre_req.id }

    AwesootupModule.all.collect do |mod|
      if mod.id == id
        nil # skip the current field
      elsif strict &&
          ( (mod.pre_reqs.length != pre_reqs.length) ||
            (mod.post_reqs.length != post_reqs.length))
        nil # strict means that they have the same pre_reqs and post_reqs
            # (=> equal lengths)
      else
        mod_pre_reqs_ids = mod.pre_reqs.collect { |mod_pre_req| mod_pre_req.id }
        mod_post_reqs_ids = mod.post_reqs.collect { |mod_post_req| mod_post_req.id }
        pre_reqs_satisfied = true
        post_reqs_satisfied = true

        mod_pre_reqs_ids.each do |mod_pre_req_id|
          unless pre_reqs_ids.include?(mod_pre_req_id)
            pre_reqs_satisfied = false
          end
        end
        mod_post_reqs_ids.each do |mod_post_req_id|
          unless post_reqs_ids.include?(mod_post_req_id)
            post_reqs_satisfied = false
          end
        end

        (pre_reqs_satisfied && post_reqs_satisfied) ? mod : nil
      end
    end.compact
  end

  # Find alternatives to the current AwesootupModule object
  #
  # @param strict
  #   When false: find awesootup modules with the same provides (or more)
  #   When true: find awesootup modules with exactly the same provides
  #
  def alternatives(strict = false)
    provides_ids = provides.collect { |provide| provide.id }

    AwesootupModule.all.collect do |mod|
      if mod.id == id
        nil # skip the current field
      elsif strict && (mod.provides.length != provides.length)
        nil # strict means that they have the same provides (=> equal lengths)
      else
        mod_provides_ids = mod.provides.collect { |mod_provide| mod_provide.id }
        provides_satisfied = true

        provides_ids.each do |provide_id|
          unless mod_provides_ids.include?(provide_id)
            provides_satisfied = false
          end
        end

        provides_satisfied ? mod : nil
      end
    end.compact
  end

end
