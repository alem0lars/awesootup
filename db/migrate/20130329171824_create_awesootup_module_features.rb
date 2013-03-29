class CreateAwesootupModuleFeatures < ActiveRecord::Migration
  def change

    create_table :awesootup_module_features do |t|
      t.string :name
      t.text :desc

      t.timestamps
    end

  end
end
