class MedicalsController < ApplicationController
    
    def create
        medical = Medical.create!(medical_params)
        medical.name = "ルルアタックFX"
        medical.name.save!
        medical.url = "http://urx3.nu/7OOW"
        medical.url.save!
    end
  
  private

    def medical_params
        params.require(:medical).permit(:name, :url)
    end
end
