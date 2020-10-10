class PharmaciesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: %i[edit update destroy] 
      
  PER_PAGE = 5  
  def index
    @q = User_Pharmacy.includes(:user).ransack(params[:q])
    user_pharmacies = @q.result(distinct: true)
    @user_pharmacies = user_pharmacies.page(params[:page]).per(PER_PAGE)
  end
    
    def new
        @user_pharmacy = User_Pharmacy.new
    end
    
    def create
     user_pharmacies.create!(pharmacy_params)
    if @user_pharmacies.counseling.include? ("熱がある")
       @user_pharmacies.counseling.save!
    else
       "登録できません"
    end
    
    
     if user_pharmacy.save
            flash[:notice] = "登録が完了いたしました"
            redirect_to root_path
        else
            flash.now[:danger] = "登録に失敗しました"
            render 'user_pharmacies/new'
        end
     end
      
    def destroy
        @user_pharmacy.destroy!
        flash[:notice] = "削除いたしました"
         redirect_to root_path
    end

    def edit
    end

    def update
      @user_pharmacy.update!(pharmacy_params)
       if @user_pharmacy.update(pharmacy_params)
          flash[:notice] = "更新が完了いたしました" 
          redirect_to root_path
       else
          flash.now[:danger] = "更新に失敗しました"
          render 'user_pharmacies/edit'
       end
    end
    
    private

    def pharmacy_params
        params.require(:user_pharmacy).permit(:counseling, :user_id, :pharmacy_id)
    end

    def correct_user
        @pharmacy = user.pharmacies.find_by(id: params[:id])
        redirect_to root_path if @user_pharmacy.nil?
    end
end
