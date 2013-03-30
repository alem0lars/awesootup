class CreateAwesootupModules < ActiveRecord::Migration
  def change

    create_table :awesootup_modules do |t|
      t.string :name
      t.text :desc
      t.integer :author_id

      t.timestamps
    end

  end
end
