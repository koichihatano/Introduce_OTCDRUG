class PharmaciesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: %i[edit update destroy] 
      
  PER_PAGE = 5  
  def index
    @q = Pharmacy.includes(:user).ransack(params[:q])
    pharmacies = @q.result(distinct: true)
    @pharmacies = pharmacies.page(params[:page]).per(PER_PAGE)
  end
    
    def new
        @pharmacy = Pharmacy.new
    end
    
    def create
     current_user.pharmacies.new(pharmacy_params)
     current_user.pharmacies.disease = "熱がある"
     current_user.pharmacies.disease.save!

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
        params.require(:pharmacy).permit(:age, :sex, :counseling, :disease).merge(user_id: params[:user_id], pharmacy_id: params[:pharmacy_id], medical_id: params[:medical_id]) 
    end

    def correct_user
        @pharmacy = current_user.pharmacies.find_by(id: params[:id])
        redirect_to root_path if @pharmacy.nil?
    end
end
