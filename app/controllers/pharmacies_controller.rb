class PharmaciesController < ApplicationController

    def new
        @pharmacy = Pharmacy.new
    end
    
    def create
      pharmacies.create!(pharmacy_params)
      pharmacies.disease = "熱がある"
      pharmacies.disease.save!
    end
      
    private

    def pharmacy_params
        params.require(:pharmacy).permit(:disease, :medical_id)
    end

end
