class UserPharmaciesController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy] 
  before_action :set_pharmacy, only: [:create, :destroy]
  PER_PAGE = 5  
  def index
    @q = UserPharmacy.includes(:user).ransack(params[:q])
    user_pharmacies = @q.result(distinct: true)
    @user_pharmacies = user_pharmacies.page(params[:page]).per(PER_PAGE)
  end
    
    def new
        @user_pharmacy = UserPharmacy.new
    end
    
    def create
      @user_pharmacy = UserPharmacy.create!(userpharmacy_params)
      @user_pharmacy.user_id = current_user.id
      @user_pharmacy.phamacy_id = pharmacy_id
      if @user_pharmacy.counseling.include? ("熱がある")
       @user_pharmacy.counseling.save!
    else
       "登録できません"
    end
      if @user_pharmacy.save
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
      @user_pharmacy.update!(userpharmacy_params)
       if @user_pharmacy.update(userpharmacy_params)
          flash[:notice] = "更新が完了いたしました" 
          redirect_to root_path
       else
          flash.now[:danger] = "更新に失敗しました"
          render 'user_pharmacies/edit'
       end
    end
   
    def search
      @user_pharmacies = UserPharmacy.where('title LIKE(?)', "%#{params[:keyword]}%").limit(20)
    end

    private

    def userpharmacy_params
        params.require(:userpharmacy).permit(:counseling,:user_id,:pharmacy_id)
    end

    def correct_user
        @userpharmacy = user_pharmacies.find_by(id: params[:id])
        redirect_to root_path if @userpharmacy.nil?
    end
    
    def set_pharmacy
      @pharmacy = Pharmacy.find(params[:pharmacy_id])
    end
end
