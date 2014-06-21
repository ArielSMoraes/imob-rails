class CreatePropertyCharacteristics < ActiveRecord::Migration
  def change
    create_table :property_characteristics do |t|
      t.timestamps :whenadd
      t.belongs_to :property
      t.belongs_to :characteristic

      t.timestamps
    end
  end
end
