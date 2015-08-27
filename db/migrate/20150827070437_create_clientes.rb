class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nit
      t.string :nombre
      t.string :apellido1
      t.string :apellido2
      t.string :sexo
      t.string :direccion_residencia
      t.integer :telefono
      t.integer :celular
      t.string :email
      t.string :tipo_actividad
      t.string :tipo_contrato
      t.date :fecha_ingreso_cub
      t.date :fecha_nacimiento

      t.timestamps null: false
    end
  end
end
