class KnowledgeBase < ActiveRecord::Base
  attr_accessible :name, :value
  serialize :value, Hash

  def self.ask(name)
    where('name = ?', name).first[:value]
  end

end
