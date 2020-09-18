class PharmaciesController < ApplicationController
         

    def index
       @pharmacies = Pharmacy.includes(:user)
    end
    
    def new
        @pharmacy = Pharmacy.new
    end
    
    def create
     current_user.pharmacies.create!(pharmacy_params)
        if current_user.save
            flash[:notice] = "登録が完了いたしました"
            redirect_to root_path
        else
            flash.now[:danger] = "登録に失敗しました"
            render 'pharmacies/new'
        end
     end
    

    def destroy
        @pharmacy.destroy!
        flash[:notice] = "削除いたしました"
         redirect_to root_path
    end

    def edit
    end

    def update
        @pharmacy.update!(pharmacy_params)
        if @pharmacy.update(pharmacy_params)
         flash[:notice] = "更新が完了いたしました" 
         redirect_to root_path
        else
         flash.now[:danger] = "更新に失敗しました"
         render 'pharmacies/edit'
      end
    end
    
    private

    def pharmacy_params
        params.require(:pharmacy).permit(:nickname, :age, :sex, :counseling, :sick) 
    end
    
end
