# == Schema Information
#
# Table name: users
#
#  id                    :integer         not null, primary key
#  name                  :string(255)
#  email                 :string(255)
#  created_at            :datetime        not null
#  updated_at            :datetime        not null
#  password_digest       :string(255)
#  password              :string(255)
#  password_confirmation :string(255)
#  remember_token        :string(255)
#  active                :boolean
#

require 'spec_helper'

describe User do

  # Blocos before sao executados antes de cada teste
  # Neste caso cria um usuario com o nome e email passados abaixo
  before { @user = User.new(name: "Reinaldo Oliveira", email:"reinaldooli@gmail.com",
                password: "foobar", password_confirmation: "foobar") }

  # Faz com que a variavel @user seja utilizada como "assunto" do teste
  # a mesma ficara disponivel em todo o escopo do teste
  subject { @user }

  # o metodo respond_to? verifica se um determinado objeto consegue "responder" 
  # para uma determinada funcao ou para um propriedade.
  # Neste caso o objeto usuario deve responder para as propriedades nome e email
  it { should respond_to(:name) } 
  it { should respond_to(:email) }
  # Este campo recebera a senha criptografada do participante (bcrypt)
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) } # funcao de autenticacao

  it { should be_valid }

  # Testa se o nome foi informado
  # Quando o nome nao estiver presente o usuario deve ser invalido
  describe "when name is not present" do
    before { @user.name = "" }
    it { should_not be_valid }
  end

  # Testa se o email foi informado
  # Quando o email nao estiver presente o usuario deve ser invalido
  describe "when email is not present" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  # Testa se a senha e a confirmacao foram informadas
  # Quando a senha ou a confirmacao nao estiverem presentes o usuario deve ser inavlido
  describe "when password or confirmation is not present" do
    before { @user.password = @user.password_confirmation = "" }
    it { should_not be_valid }
  end

  # Testa se a senha e muito pequena
  # Quando a senha for muito curta o usuario deve ser invalido
  describe "when passwotd is too short" do
    before { @user.password = "a" }
    it { should_not be_valid }
  end

  # Testa se o nome contem mais do que 60 caracteres
  # Quando o nome tiver mais do que 60 caracteres o usuario deve ser invalido
  describe "when name is too long" do
    before { @user.name = "a"*61 }
    it { should_not be_valid }
  end

  # Testa se o email e invalido
  # Quando o email for invalido o usuario dever ser invalido
  describe "when email is not valid" do
    before { @user.email = "email@email" }
    it { should_not be_valid }
  end

  # Testa se o email ja existe
  # Quando o email ja existir o usuario deve ser invalido
  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
    
    it { should_not be_valid }
  end

  # Testa a funcao de autenticacao do usuario
  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
end
