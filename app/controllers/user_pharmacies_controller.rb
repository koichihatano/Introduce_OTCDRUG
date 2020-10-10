class UserPharmaciesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: %i[edit update destroy] 
      
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
       userpharmacy.create!(userpharmacy_params)
    if @userpharmacy.counseling.include? ("熱がある")
       @userpharmacy.counseling.save!
    else
       "登録できません"
    end
    
     if userpharmacy.save
            flash[:notice] = "登録が完了いたしました"
            redirect_to root_path
        else
            flash.now[:danger] = "登録に失敗しました"
            render 'user_pharmacies/new'
        end
     end
      
    def destroy
        @userpharmacy.destroy!
        flash[:notice] = "削除いたしました"
         redirect_to root_path
    end

    def edit
    end

    def update
      @userpharmacy.update!(userpharmacy_params)
       if @userpharmacy.update(userpharmacy_params)
          flash[:notice] = "更新が完了いたしました" 
          redirect_to root_path
       else
          flash.now[:danger] = "更新に失敗しました"
          render 'user_pharmacies/edit'
       end
    end
    
    private

    def userpharmacy_params
        params.require(:userpharmacy).permit(:counseling, :user_id, :pharmacy_id)
    end

    def correct_user
        @user_pharmacy = user_pharmacies.find_by(id: params[:id])
        redirect_to root_path if @userpharmacy.nil?
    end
end
