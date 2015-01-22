class Company < ActiveRecord::Base

	validates_presence_of :fantasy_name, :cnpj, :url, :email, :phone
  	validates_numericality_of :cnpj, :phone
   	validates_length_of :cnpj, is: 14
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
end