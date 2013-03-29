class AddAuthorIdToAwesootupModule < ActiveRecord::Migration
  def change

    add_column :awesootup_modules, :author_id, :integer

  end
end
