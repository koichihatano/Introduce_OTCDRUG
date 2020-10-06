class MedicalsController < ApplicationController
    def create
        @pharmacy = Pharmacy.find(params[:pharmacy_id])
        @medical = Medical.new(
        product: medical_params[:product]
        user_id: current_user.id
        pharmacy_id: params[:pharmacy_id]
        )
        
    end
    def show
        @pharmacy = Pharmacy.find(params[:pharmacy_id])
    end
end
