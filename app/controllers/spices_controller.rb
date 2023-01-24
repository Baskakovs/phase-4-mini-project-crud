class SpicesController < ApplicationController
    def index
        render json: Spice.all
    end
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = findSpice
        if spice 
            spice.update(spice_params)
            render json: spice
        else
            errorRaise
        end
    end

    def destroy
        spice = findSpice
        if spice
            spice.destroy
        else
            errorRaise
        end
    end 

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def findSpice
        Spice.find_by(id:params[:id])
    end

    def error
        json render: {error: "Spice not found"}, status: :not_found
    end
end