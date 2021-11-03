Assumptions:
IF CRITERIA DOESNT HAVE RULES IT WILL BE INCLUDED IN THE MATCHED CRITERIA
SEARCH BAR ONLY FINDS BASED ON REFERENCE NUMBER
Rules#value is integer we assumes it only be used in integer fields

Missing:
Front end validation
Front End error messaging
VALIDATION FOR DEFAULT RULES FOR EACH CRITERIA
ADDED WEIGHTS TO EACH RULES but not used because lack of time
Tests

How To run:
docker-compose up
then go to localhost:4567

Running first time.
docker-compose up --build
docker ps # get the container ID of product-destination-picker_web
docker exec -it #{CONTAINER_ID} /bin/bash # connect to the web container
rake db:migrate