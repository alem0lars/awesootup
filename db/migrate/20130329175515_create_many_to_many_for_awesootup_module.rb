class CreateManyToManyForAwesootupModule < ActiveRecord::Migration
  def change

    create_table :awesootup_modules_provides do |t|
      t.integer :awesootup_module_id
      t.integer :awesootup_module_feature_id

      t.timestamps
    end

    create_table :awesootup_modules_pre_reqs do |t|
      t.integer :awesootup_module_id
      t.integer :awesootup_module_feature_id

      t.timestamps
    end

    create_table :awesootup_modules_post_reqs do |t|
      t.integer :awesootup_module_id
      t.integer :awesootup_module_feature_id

      t.timestamps
    end

  end
end
