class Persona < ActiveRecord::Base
  validates_presence_of :nombres, :message => ": Debe capturarlo."
  def validate
    if !self.mes_cumple.blank?
      if /\A[+\-]?\d+\Z/.match(self.mes_cumple)
        if self.mes_cumple.length > 2
          errors.add "mes",": Debe contener 1 o 2 digitos."
        elsif self.mes_cumple.to_i > 12
          errors.add "mes",": Debe ser menor a 12."
        end
      else
        errors.add "mes",": Solo puede contener números."
      end
    end

    puts "dia cumple"
    puts self.dia_cumple
    if !self.dia_cumple.blank?
      if /\A[+\-]?\d+\Z/.match(self.dia_cumple)
        if self.dia_cumple.length > 2
          errors.add "día",": Debe contener 1 o 2 digitos."
        elsif self.dia_cumple.to_i > 31
          errors.add "día",": Debe ser menor a 31."
        end
      else
        errors.add "día",": Solo puede contener números."
      end
    end

    if !self.anio_cumple.blank?
      if /\A[+\-]?\d+\Z/.match(self.anio_cumple)
        if self.anio_cumple.length != 4
          errors.add "año",": Debe contener 4 digitos."
        end
      else
        errors.add "año",": Solo puede contener números."
      end
    end

  end
end
