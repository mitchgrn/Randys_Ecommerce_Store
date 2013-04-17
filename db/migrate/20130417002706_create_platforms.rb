class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|
      t.string :name
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
