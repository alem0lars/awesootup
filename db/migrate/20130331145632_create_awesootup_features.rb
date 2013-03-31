class CreateAwesootupFeatures < ActiveRecord::Migration
  def change

    create_table :awesootup_features do |t|
      t.string :name
      t.text :content

      t.timestamps
    end

  end
end
