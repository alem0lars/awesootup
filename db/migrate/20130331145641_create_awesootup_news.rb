class CreateAwesootupNews < ActiveRecord::Migration
  def change

    create_table :awesootup_news do |t|
      t.string :name
      t.text :content

      t.timestamps
    end

  end
end
