class PharmaciesController < ApplicationController
before_action :move_to_index, except: :index
    
     def index
       @pharmacies = Pharmacy.all
    end
    
    def new
        @pharmacy = Pharmacy.new
    end

     def create
       @pharmacy = Pharmacy.new(pharmacy_params)
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
            redirect_to @pharmacy
         else
            flash.now[:danger] = "登録に失敗しました"
            render 'pharmacies/new'
        end
     end

      def move_to_index
          redirect_to action: :index unless user_signed_in?
    end
    

    def destroy
        @pharmacy = Pharmacy.find(params[:id])
        @pharmacy.destroy!
        flash[:notice] = "削除いたしました"
         redirect_to @pharmacy
    end

    def edit
        @pharmacy = Pharmacy.find(params[:id])
     end

    def update
        @pharmacy = Pharmacy.find(params[:id])
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
        params.require(:pharmacy).permit(:nickname, :age, :sex, :counseling, :sick)
    end
end

