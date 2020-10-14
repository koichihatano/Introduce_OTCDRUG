class PharmaciesController < ApplicationController

   before_action :set_pharmacy
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

    def set_pharmacy
      @pharmacy = pharmacy.find([:id])
    end
end
