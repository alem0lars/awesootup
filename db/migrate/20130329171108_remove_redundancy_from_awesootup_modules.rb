class RemoveRedundancyFromAwesootupModules < ActiveRecord::Migration
  def change

    remove_column :awesootup_modules, :author_name
    remove_column :awesootup_modules, :author_email
    remove_column :awesootup_modules, :author_website

  end
end
