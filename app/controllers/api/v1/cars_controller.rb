module Api
  module V1
    class CarsController < ApplicationController
      def show
        @car = Car.find(params[:id])
      end
    end
  end
end
