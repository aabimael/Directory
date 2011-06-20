class User < ActiveRecord::Base
  def validate
    if self.user_name.blank?
      errors.add "login",": Debe ser capturado."
    end
  end
end
