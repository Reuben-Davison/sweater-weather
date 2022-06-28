# README
<div id="top"></div>


<!-- ABOUT THE PROJECT -->
## About The Project

-SOA backend app utilizing MapQuest, OpenWeather, and Unsplash.

-Will retrieve forecast for a destination input along with a background photo.

-A user can register, which gets saved into a postgresql database

-When verified user gives a start point and a destination, a trip is created showing the time to destination and forecasted weather for arrival time.




## API Request and Response Examples 
### Getting weather forecast:


` GET /api/v1/forecast?location=denver,co `

~~~
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2020-09-30 13:27:03 -0600",
        "temperature": 79.4,
        etc
      },
      "daily_weather": [
        {
          "date": "2020-10-01",
          "sunrise": "2020-10-01 06:10:43 -0600",
          etc
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "14:00:00",
          "conditions": "cloudy with a chance of meatballs",
          etc
        },
        {...} etc
      ]
    }
  }
}
~~~



### Retrieving background image
 
` GET /api/v1/backgrounds?location=denver,co `
```
{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "image": {
                "location": "denver",
                "image_url": "https://images.unsplash.com/photo-1511286148006-ec48824e3282?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzMzc1MTN8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb2NpdHlzY2FwZXxlbnwwfHx8fDE2NTY0Mzg3NTU&ixlib=rb-1.2.1&q=80",
                "credit": {
                    "source": "https://api.unsplash.com/photos/lkLTeBY2SZE",
                    "author": "Miranda Joondeph",
                    "author_link": "https://api.unsplash.com/users/mirandafayj"
                }
            }
        }
    }
}
```
### Creating a trip 

```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

```
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Pueblo,CO",
            "travel_time": "1 hours, 45 minutes, 23 seconds",
            "weather_at_eta": {
                "temperature": 87.93,
                "conditions": "clear sky"
            }
        }
    }
}
```

### Built With

* [Ruby](https://www.ruby-lang.org/en/)
* [Rails](https://rubyonrails.org/)
* [Postman](https://www.postman.com/)
* [Faraday](https://lostisland.github.io/faraday/)
* [Figaro](https://github.com/laserlemon/figaro)


<p align="right">(<a href="#top">back to top</a>)</p>




<!-- GETTING STARTED -->
## Getting Started

Prerequisites:
* Ruby 2.7.4
* Rails 5.2.8


Installation Steps:
* $git clone git@github.com:Reuben-Davison/sweater-weather.git
* $bundle install 



<!-- ROADMAP -->
## Roadmap

- [ ] Add an ETA for trips
- [ ] Add more robust testing for sad paths.  



<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Owner - Reuben Davison - creubend@gmail.com 


<p align="right">(<a href="#top">back to top</a>)</p>
