class MedicalsController < ApplicationController
    
    def create
        medical = medical.new!(medical_params)
        medical.pharmacies.name = "ルルアタックFX"
        medical.pharamacies.name.save!
        medical.pharmacies.url = "http://urx3.nu/7OOW"
        medival.pharmacies.url.save!
    end
  



    private

    def medical_params
        params.require(:medical).permit(:name, :url)
    end
end
