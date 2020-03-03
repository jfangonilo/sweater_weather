# Sweater Weather
Sweater Weather is a [Turing](https://turing.io/) back end solo project that consumes multiple APIs to expose geocode, weather, and photograph data in JSON 1.0 to a hypothetical front end.

## APIs consumed
[Google Geocoding](https://developers.google.com/maps/documentation/geocoding/intro)

[Google Directions](https://developers.google.com/maps/documentation/directions/intro)

[Flickr Images](https://www.flickr.com/services/developer/api/)

[Darksky Weather](https://darksky.net/dev)

## Endpoints

### Forecast
`GET /api/v1/forecast`

| Params | Example |
| --- | --- |
| location | Denver,CO |

```JSON
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "location": "Denver, CO, USA",
                "summary": "Clear",
                "temperature": 59.93,
                "high_temp": 61.53,
                "low_temp": 27.08,
                "time": 1583262444
            },
            "details": {
                "summary": "Clear",
                "feels_like": 59.93,
                "humidity": 0.18,
                "uv_index": 5
            },
            "hourly_weather": [
                {
                    "temperature": 59.57,
                    "time": 1583262000
                },
                {
                    "temperature": 61.02,
                    "time": 1583265600
                },
                {
                    "temperature": 58.97,
                    "time": 1583269200
                },
                {
                    "temperature": 55.92,
                    "time": 1583272800
                },
                {
                    "temperature": 53.81,
                    "time": 1583276400
                },
                {
                    "temperature": 51.15,
                    "time": 1583280000
                },
                {
                    "temperature": 48.02,
                    "time": 1583283600
                },
                {
                    "temperature": 44.03,
                    "time": 1583287200
                }
            ],
            "daily_weather": [
                {
                    "time": 1583218800,
                    "summary": "Clear throughout the day.",
                    "chance_precip": 0.03,
                    "high_temp": 61.53,
                    "low_temp": 27.08
                },
                {
                    "time": 1583305200,
                    "summary": "Clear throughout the day.",
                    "chance_precip": 0.03,
                    "high_temp": 60.8,
                    "low_temp": 30.89
                },
                {
                    "time": 1583391600,
                    "summary": "Clear throughout the day.",
                    "chance_precip": 0.02,
                    "high_temp": 58.24,
                    "low_temp": 31.58
                },
                {
                    "time": 1583478000,
                    "summary": "Clear throughout the day.",
                    "chance_precip": 0.02,
                    "high_temp": 68.34,
                    "low_temp": 38.52
                },
                {
                    "time": 1583564400,
                    "summary": "Mostly cloudy throughout the day.",
                    "chance_precip": 0,
                    "high_temp": 71.33,
                    "low_temp": 40.83
                }
            ]
        }
    }
}
```

### Backgrounds
`GET /api/v1/backgrounds`
| Params | Example |
| --- | --- |
| location | Denver,CO |

```JSON
{
    "data": {
        "id": null,
        "type": "background",
        "attributes": {
            "url": "https://farm1.staticflickr.com/570/31810353975_5f23b6d77a.jpg"
        }
    }
}
```

### User Registration
`POST /api/v1/users`
| Params | Example |
| --- | --- |
| email | whatever@example.com |
| password | password |
| password_confirmation | password |

```JSON
{
    "data": {
        "id": "1",
        "type": "users",
        "attributes": {
            "api_key": "XDhsJoU3yLHn3u11FZGPmGXj"
        }
    }
}
```

### User Login
`POST /api/v1/sessions`
| Params | Example |
| --- | --- |
| email | whatever@example.com |
| password | password |

```JSON
{
    "data": {
        "id": "1",
        "type": "users",
        "attributes": {
            "api_key": "XDhsJoU3yLHn3u11FZGPmGXj"
        }
    }
}
```

### Road Trip
`POST /api/v1/road_trip`
| Params | Example |
| --- | --- |
| api_key | XDhsJoU3yLHn3u11FZGPmGXj |
| origin | Denver,CO |
| destination | Pueblo,CO |

```JSON
{
    "data": {
        "id": null,
        "type": "road_trip",
        "attributes": {
            "origin_address": "Denver, CO, USA",
            "destination_address": "Pueblo, CO, USA",
            "travel_time": "1 hour 48 mins",
            "arrival_temp": "34.87",
            "arrival_summary": "Clear"
        }
    }
}
```