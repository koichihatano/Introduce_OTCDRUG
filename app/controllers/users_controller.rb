class UsersController < ApplicationController
     before_action :move_to_index, except: :index
    
     def index
       @users = User.all
    end
    
    def new
        @user = User.new
    end

     def create
       @users = User.new(user_params)
          if @user.counseling.include?("熱")
               @user.sick = "fever"
               @user.save!
          elsif @user.counseling.include?("ねつ")
               @user.sick = "fever"
               @user.save!
          elsif @user.counseling.include?("咳")
               @user.sick = "cough"
               @user.save!
          elsif @user.counseling.include?("せき")
               @user.sick = "cough"
               @user.save!
          elsif @user.counseling.include?("喉")
               @user.sick = "sore_throat"
               @user.save!
          elsif @user.counseling.include?("のど")
               @user.sick = "sore_throat"
               @user.save!
          elsif @user.counseling.include?("鼻水")
               @user.sick = "sneeze"
               @user.save!
          elsif @user.counseling.include?("はなみず")
               @user.sick = "sneeze"
               @user.save!
          elsif @user.counseling.include?("頭痛")
               @user.sick = "headache"
               @user.save!
          elsif @user.counseling.include?("歯が痛い")
               @user.sick = "dental_pain"
               @user.save!
          elsif @user.counseling.include?("胃が痛い")
               @user.sick = "stomachache"
               @user.save! 
         else
           "不正な値です"
          end
         if @user.save
            flash[:notice] = "登録が完了いたしました"
            redirect_to @user
         else
            flash.now[:danger] = "登録に失敗しました"
            render 'users/new'
        end
     end

      def move_to_index
          redirect_to action: :index unless user_signed_in?
    end
    
    def show
       @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy!
        flash[:notice] = "削除いたしました"
         redirect_to @user
        
    end

    def edit
        @user = User.find(params[:id])
     end

    def update
        @user = User.find(params[:id])
        @user.update!(user_params)
        if @user.update(user_params)
         flash[:notice] = "更新が完了いたしました" 
         redirect_to @user
        else
         flash.now[:danger] = "更新に失敗しました"
         render 'users/edit'
      end

      private

    def user_params
        params.require(:user).permit(:nickname, :age, :sex, :counseling, :sick)
    end
end
end
