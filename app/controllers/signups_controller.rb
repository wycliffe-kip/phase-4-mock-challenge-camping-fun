class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid_response

    def create 
        activity = Activity.find(params[:activity_id])
        signup = Signup.create!(signup_params)
        render json: { signup: signup, activity: activity }, status: :created
    end 

    private 

    def signup_params 
        params.permit(:time, :camper_id, :activity_id)
    end 

    def render_record_invalid_response(invalid)
        render json: { error: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end 
end
