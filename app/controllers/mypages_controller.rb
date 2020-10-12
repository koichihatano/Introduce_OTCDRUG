class MypagesController < ApplicationController

    def show
    @mypage = Mypage.find(current_user.id)
    end
end