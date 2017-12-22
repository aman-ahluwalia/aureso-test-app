module Api
  module V1
    class CarsController < ApplicationController
      def show
        @car = Car.find_by(slug: params[:id].to_s)
      end
    end
  end
end
