class PharmaciesController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: %i[edit update destroy]    
     def index
       @pharmacies = Pharmacy.includes(:user)
    end
    
    def new
        @pharmacy = Pharmacy.new
    end

     def create
          @pharmacy = Pharmacy.new(pharmacy_params)
           @pharmacy.user_id = current_user.id
           @pharmacy.save
          if @pharmacy.counseling.include?("熱")
               @pharmacy.sick = "fever"
               @pharmacy.save!
          elsif @pharmacy.counseling.include?("ねつ")
               @pharmacy.sick = "fever"
               @pharmacy.save!
          elsif @pharmacy.counseling.include?("咳")
               @pharmacy.sick = "cough"
               @pharmacy.save!
          elsif @pharmacy.counseling.include?("せき")
               @pharmacy.sick = "cough"
               @pharmacy.save!
          elsif @pharmacy.counseling.include?("喉")
               @pharmacy.sick = "sore_throat"
               @pharmacy.save!
          elsif @pharmacy.counseling.include?("のど")
               @pharmacy.sick = "sore_throat"
               @pharmacy.save!
         else
           "不正な値です"
          end
         if @pharmacy.save
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

    def show
          @pharmacy = Pharmacy.find(params[:id])
          @user = @pharmacy.user
     end
    
    def edit
     end

    def update
        @pharmacy.update!(pharmacy_params)
        if @pharmacy.update(pharmacy_params)
         flash[:notice] = "更新が完了いたしました" 
         redirect_to @pharmacy
        else
         flash.now[:danger] = "更新に失敗しました"
         render 'pharmacies/edit'
      end
    end
      private

    def pharmacy_params
        params.require(:pharmacy).permit(:nickname, :age, :sex, :counseling)
    end
    def correct_user
        @pharmacy = current_user.pharmacies.find_by(id: params[:id])
        redirect_to root_path if @pharmacy.nil?
    end
end

