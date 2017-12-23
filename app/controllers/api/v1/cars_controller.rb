module Api
  module V1
    class CarsController < ApplicationController
      def show
        begin
          @car = Car.find_by(slug: car_params[:slug])
          if not @car.present?
            render json: {message: "Car not found"}
          end
          @max_speed_on_track = 'no track selected'
          check_track_condition
        rescue
          render json: {message: "No slug provided"}
        end
      end

      private

      def check_track_condition
        if car_params[:track].present?
          @track = Track.find_by('lower(name) = ?', car_params[:track].downcase)
          if @track.present?
            @max_speed_on_track = @car.max_speed.to_f - (@car.max_speed.to_f * @track.factor.resistance / 100)
            check_present_time
          else
            @max_speed_on_track = 'track not found'
          end
        end
      end

      def check_present_time
        check_time = (Time.now - @track.timezone.to_f.hours).strftime("%I.%M")
        all_time_slots = Factor.where(property: 'time_of_the_day')
        for time_slot in all_time_slots do
          slot = time_slot[:kind].split(' - ')
          if (slot[0].to_f..slot[1].to_f).include?(check_time)
            @max_speed_on_track -=  @max_speed_on_track * time_slot[:resistance] / 100
            break
          end
        end
        @max_speed_on_track = @max_speed_on_track.to_s + "km/h"
      end

      def car_params
        params.permit(:slug, :track)
      end

    end
  end
end
