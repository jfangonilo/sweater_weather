class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :origin_address,
              :destination_address,
              :travel_time,
              :arrival_temp,
              :arrival_summary
end
