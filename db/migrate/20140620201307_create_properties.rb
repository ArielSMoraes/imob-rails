class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :cep
      t.string :endereco
      t.integer :dormitorios
      t.boolean :financiado
      t.string :descricao
      t.integer :numero

      t.timestamps
    end
  end
end
