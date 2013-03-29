class CreateKnowledgeBases < ActiveRecord::Migration
  def change

    create_table :knowledge_bases do |t|
      t.string :name
      t.text :value

      t.timestamps
    end

  end
end
