require 'rails_helper'

  describe JobPosition, :type => :model do
    before do
      JobPosition.create({:title => "Gerente", :description => "Vendas a Varejo", :location => "Zona Sul", :expiration_date => "2015-03-30", :job_status => "Ativa", :created_at => (Date.today - 3), :updated_at => "2015-01-29", :company_id => 1})
      JobPosition.create({:title => "Recepcionista", :description => "Consultório Médico", :location => "Zona Oeste", :expiration_date => "2015-03-30", :job_status => "Cancelada", :created_at => (Date.today - 54), :updated_at => "2015-01-29", :company_id => 2})
  end

  describe "#max_expiration" do
    it "If new job position, it should sum the date of today plus 90 days" do
      j = JobPosition.new

      expect(j.max_expiration).to eq(Date.today + 90)
    end

    it "If job position was previously created, it should sum the date of creation plus 90 days" do
      j = JobPosition.first
      expect(j.max_expiration).to eq(j.created_at + 90.days)
    end

    describe "#canceled?" do
      it "If job position canceled should return true" do
        j = JobPosition.find(2)
        expect(j.canceled?).to eq(true)
      end

      it "If job position isn't canceled return false" do
        j = JobPosition.find(1)
        expect(j.canceled?).to eq(false)
      end
    end
    describe "#new_job_position?" do
      it "Should return true if it's a new job position" do
        j = JobPosition.find(1)
        expect(j.new_job_position?).to eq(true)
      end
      it "Should return false if it isn't a new job position" do
        j = JobPosition.find(2)
        expect(j.new_job_position?).to eq(false)
      end 
    end

  end

end