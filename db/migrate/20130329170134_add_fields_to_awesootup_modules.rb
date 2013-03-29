class AddFieldsToAwesootupModules < ActiveRecord::Migration
  def change

    add_column :awesootup_modules, :name, :string
    add_column :awesootup_modules, :desc, :text

    add_column :awesootup_modules, :author_name, :string
    add_column :awesootup_modules, :author_email, :string
    add_column :awesootup_modules, :author_website, :string

  end
end
