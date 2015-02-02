require 'rails_helper'

describe JobPosition, :type => :model do

  
  let(:vaga_ativa) { {:title => "Gerente", :description => "Vendas a Varejo", :location => "Zona Sul", :job_status => "Ativa", :company_id => 1} }
  let(:status_cancelado) { "Cancelada" }
  let(:vaga_nova) { Date.today - 3 }
  let(:vaga_velha) { Date.today - 60 }
  let(:vaga_a_expirar) { Date.today + 4 }
  let(:vaga_expirando) { Date.today + 30 }
  let(:vaga_expirada) { Date.today - 1 }

  describe "#max_expiration" do
    
    it "If new job position, it should sum the date of today plus 90 days" do
      j = JobPosition.new(vaga_ativa)
      expect(j.max_expiration).to eq(Date.today + 90)
    end

    it "If job position was previously created, it should sum the date of creation plus 90 days" do
      j = JobPosition.new(vaga_ativa)
      j.created_at = Date.today
      expect(j.max_expiration).to eq(j.created_at + 90.days)
    end

  end

  describe "#canceled?" do
  
    it "If job position canceled should return true" do
      j = JobPosition.create(vaga_ativa)
      j.job_status = status_cancelado
      expect(j.canceled?).to eq(true)
    end

    it "If job position isn't canceled return false" do
      j = JobPosition.create(vaga_ativa)
      expect(j.canceled?).to eq(false)
    end

  end

  describe "#new_job_position?" do
    
    it "Should return true if it's a new job position" do
      j = JobPosition.new(vaga_ativa)
      j.created_at = vaga_nova
      expect(j.new_job_position?).to eq(true)
    end

    it "Should return false if it isn't a new job position" do
      j = JobPosition.new(vaga_ativa)
      j.created_at = vaga_velha
      expect(j.new_job_position?).to eq(false)
    end 

  end

  describe "#last_expiration_days?" do
    
    it "Should return true if it's on the last seven days from expiration" do
      j = JobPosition.new(vaga_ativa)
      j.expiration_date = vaga_a_expirar
      expect(j.last_expiration_days?).to eq(true)
    end

    it "Should return false if it isn't on the last seven days from expiration" do
      j = JobPosition.new(vaga_ativa)
      j.expiration_date = vaga_expirando
      expect(j.last_expiration_days?).to eq(false)
    end

    it "Should return false if the job position has already expired" do
      j = JobPosition.new(vaga_ativa)
      j.expiration_date = vaga_expirada
      expect(j.last_expiration_days?).to eq(false)
    end

  end

end
