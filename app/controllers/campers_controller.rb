class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid_response
    
    def index 
        campers = Camper.all 
        render json: campers
    end 

    def show 
        camper = Camper.find(params[:id]) 
        render json: camper
    end 

    def create 
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end 

    private 

    def render_not_found_response 
        render json: { error: "Camper not found"}, status: :not_found
    end 

    def camper_params 
        params.permit(:name, :age)
    end 

    def render_record_invalid_response(exception)
        render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
    end 

end
