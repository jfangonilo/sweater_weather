class MunchiesSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :travel_time,
              :forecast
end