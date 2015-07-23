class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre_usuario
      t.string :password
      t.string :salt
      t.string :nombre
      t.string :apellido

      t.timestamps null: false
    end
  end
end
