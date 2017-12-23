module Api
  module V1
    class CarsController < ApplicationController
      def show
        @car = Car.find_by(slug: params[:id].to_s)
        @max_speed_on_track = 'no track selected'
        if params[:track].present?
          @track = Track.find_by('lower(name) = ?', params[:track].downcase)
          if @track.present?
            @max_speed_on_track = (@car.max_speed.to_f - (@car.max_speed.to_f * @track.factor.resistance / 100)).to_s + @car.speed_unit
          else
            @max_speed_on_track = 'track not found'
          end
        end
      end
    end
  end
end
