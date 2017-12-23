json.car do
  json.id                   @car.id
  json.car_slug             @car.slug
  json.max_speed            @car.max_speed.to_s + @car.speed_unit
  json.max_speed_on_track   @max_speed_on_track
end
