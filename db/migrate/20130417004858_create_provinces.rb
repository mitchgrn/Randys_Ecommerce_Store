class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :code
      t.decimal :pst
      t.decimal :gst
      t.decimal :hst
      t.boolean :home_province

      t.timestamps
    end
  end
end
