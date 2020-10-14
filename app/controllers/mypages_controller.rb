class MypagesController < ApplicationController

    def show
    end

    def update
      current_user.update(user_params)
    end
    
    private
    def user_params
        params.require(:user).permit(:user_id, :pharmacy_id)
        
    end
end