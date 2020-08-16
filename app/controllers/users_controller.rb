class UsersController < ApplicationController
      def show
      @user = User.find(params[:id])
      @pharmacies = @user.pharmacies
      end
end