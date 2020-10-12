class PharmaciesController < ApplicationController

    def new
        @pharmacy = Pharmacy.new
    end
    
    def create
      pharmacy = Pharmacy.create!(pharmacy_params)
      pharmacy.disease = "熱がある"
      pharmacy.disease.save!
    end
      
    private

    def pharmacy_params
        params.require(:pharmacy).permit(:disease, :medical_id)
    end

end
