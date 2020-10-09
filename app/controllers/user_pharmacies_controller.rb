class UserPharmaciesController < ApplicationController
    def new
        @pharmacy = Pharmacy.find(params[:pharmacy_id])
        @user_pharmacy = User_Pharmacy.new
    end
    def create
        @pharmacy = Pharmacy.find(params[:pharmacy_id])

        @user_pharmacy = User_Pharmacy.new(
        disease: user_pharmacy_params[:disease],
        user_id: current_user.id,
        pharmacy_id: params[:pharmacy_id]
        )
        
        if @user_pharmacy.save
           redirect_to pharmacy_path(@user_pharmacy.pharmacy)
        else
            render :new
        end
    end

private

    def user_pharmacy_params
        params.require(:user_pharmacy).permit(:disease, :user_id, :pharmacy_id)
    end
end
