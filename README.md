# Web APIs
Resources for Ruby Web API talk

## Slides
<a href="https://speakerdeck.com/gomayonqui/web-api" target="_blank">Web APIs</a>

## Deployed app
<a href="https://medellinrb-api.herokuapp.com/" target="_blank">Appointments API</a>


## Installation instructions
```
$ git clone git@github.com:medellinrb/appointments-api.git
$ cd appointments-api
$ rake db:create db:migrate
$ rails server
```

## API endpoints

The appointments endpoint is in:
```
http://localhost:3000/api/v1/appointments
```

### Make a request
Replace with your `user_email` and `user_token` information
```
$ rails console
request = HTTParty.get('http://localhost:3000/api/v1/appointments?user_email=medellin@rb.com&user_token=B5fbostCifH44hFZLXBp')
```
