class Company < ActiveRecord::Base
  has_many :job_positions
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/system/companies/avatars/000/000/011/:style/missing.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :fantasy_name, :cnpj, :url, :email, :phone
  validates_numericality_of :cnpj, :phone
  validates_length_of :cnpj, is: 14
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates_format_of :url, with: /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/, on: :create
  validates_uniqueness_of :cnpj
  validates :cnpj, :cnpj => true
end