class CompanyAdmin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :company
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
