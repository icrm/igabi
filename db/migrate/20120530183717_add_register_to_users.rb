class AddRegisterToUsers < ActiveRecord::Migration
  def change
    User.create( name: "Administrador", email: "idit@idit.com.br", password: "A123451", password_confirmation: "A123451" )
  end
end
