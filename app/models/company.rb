class Company < ActiveRecord::Base

	validates_presence_of :fantasy_name, :cnpj, :url, :email, :phone
  	validates_numericality_of :cnpj, :phone
   	validates_length_of :cnpj, is: 14

end

	