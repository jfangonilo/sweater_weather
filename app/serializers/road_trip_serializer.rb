class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :origin,
              :destination,
              :travel_time,
              :arrival_temp,
              :arrival_summary
end
