class Cliente < ActiveRecord::Base
  def self.importar(file)
    spreadsheet = open_spreadsheet(file)
    (1..spreadsheet.last_row).each do |i|      
      buscarcliente = Cliente.find_by_nit(spreadsheet.cell(i,1)) 
      if buscarcliente
        Cliente.actualizarcliente(spreadsheet, i)
      else
      	Cliente.crearcliente(spreadsheet, i)
       end
    end    
  end

  def self.actualizarcliente(hoja, fila)
    self.where(nit: hoja.cell(fila, 1)).update_all(valor: hoja.cell(fila, 2), email: hoja.cell(fila, 3), telefono: hoja.cell(fila, 4))
  end

  def self.crearcliente(hoja, fila)
    cliente = Cliente.new
    cliente.nit = hoja.cell(fila,1)
    cliente.valor = hoja.cell(fila,2)
    cliente.email = hoja.cell(fila,3)
    cliente.telefono = hoja.cell(fila,4)
    cliente.save!
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when '.csv' then Roo::CSV.new(file.path, csv_options: {encoding: "iso-8859-1:utf-8"})
      when '.xls' then Roo::Excel.new(file.path, packed: nil,file_warning: :ignore)
      when '.xlsx' then Roo::Excelx.new(file.path, packed: nil,file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end