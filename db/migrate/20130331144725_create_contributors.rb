class CreateContributors < ActiveRecord::Migration
  def change

    create_table :contributors do |t|
      t.string :name
      t.string :email
      t.text :website
      t.text :contributions

      t.timestamps
    end

  end
end
