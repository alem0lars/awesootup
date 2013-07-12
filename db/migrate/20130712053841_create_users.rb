class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :website
      t.string :contribs_misc

      t.timestamps
    end
  end
end
