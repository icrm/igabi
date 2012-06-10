# -*- coding: utf-8 -*-
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

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :active

  # Relacionamentos
  has_many :posts

  # Define as funcoes de authenticacao
  has_secure_password

  # Algumas regras

  # Antes de salvar passar o email para letras minusculas
  before_save { |user| user.email = email.downcase }

  # Antes de salvar criar token para relembrar o usuario (cookie)
  before_save :create_remember_token
  
  # Validacoes

  # Validacoes do nome
  validates :name, presence: true, length: { maximum: 60 }

  #Validacoes do email
  # /           - inicio da expressao
  # \A          - pelo menos um caracter do tipo string
  # [\w+\-.]+   - pelo menos uma caracter de palavra ou um hifen(-) ou um ponto(.)
  # @           - deve conter uma arroba
  # [a-z\d\-.]+ - pelo menos uma letra ou digito
  # \.          - ponto
  # \z          - deve terminar com uma string
  # /           - fim da expressao
  # i           - case insensitive
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
      uniqueness: { case_sensitive: false }

  # Validacoes da senha
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create

  def active?
    if active
      "Sim"
    else
      "Não"
    end
  end

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
