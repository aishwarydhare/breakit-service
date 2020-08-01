# breakit-backend-drf

This is the core backend platform for BreakIt.
=======

## Architecture

[Open this link to view architecture of this service](https://somelink.com)

---

## The Repo Contains Following Directories

* docker: Contains support docker files for booting up DRF Server as well as a PostgreSQL instance
* docs: Contains documentation on how this project is built 
* project: Django server source code
* requirements: Python dependencies for the project

---

## Django Apps

Designed for scalability and easily maintaining the codebase. The project is built to quickly bootstrap, and hence has its limitations. At the end of this Readme file, I have mentioned the Top ToDos which should be undertook to make this project more robust.

#### config

Holds all necessary details for booting up project with its dependencies. Requires a JSON file named `secrets.json` in this directory to bootup, json file's format will be –
```
{
  "SECRET_KEY": "BlBhc12D42N1Fn4f12eFAi7uL7gSiLubIby8798yBY",
  "DATABASE_HOST": "0.0.0.0",
  "DATABASE_USER": "breakit",
  "DATABASE_PASSWORD": "root",
  "DATABASE_PORT": "5433",
  "DATABASE_NAME": "breakit",
  "APIKEY": "x37b723nx1xdwq",
  "ETA_SERVICE_HOST": ""
}
```

#### authentication

Contains authentication models and APIs. Also has the base user. This base user is associated in 1:1 relationship with Customer, Driver and also in-future will be used by all other kinds of users as well.

```
Note: We use MobileNo as the username on this platform
```

The only login mechanism is OTP, which for the usability of this open-source code is currently ignored. 
```
Note: Just enter any 4 digit number, and the authentication will always pass
```

#### customers

Contains customer related models and APIs.

#### delivery

Contains all delivery related APIs, which are used in driver mobile app

#### mealset

Contains all mealset related APIs. A mealset is unique to its locality + date. Only one mealset can be configured in a locality in a day. One mealset can contain upto 5 dishes from any restaurant

#### miscellaneous

Contains helper methods and parsers

#### operation_manifest

Contains models which are used as meta-data relationships with core-models, for operational and data-organising purpose only

#### orders

Contains models and APIs related with orders. Includes APIs for placing, updating, cancelling, checking, listing and more operations in it.  
Only customer's can access this API

#### restaurants

Contains models and APIs for restaurants and their dishes (food items) and also add-ons which go well with the dishes

#### utilities

Contains abstract models which are commonly used throughout the other apps of project

---

# Scheduled Jobs

## Send Booking Notification

### current implementation
A cron job running a Django shell script to send out FCM (push) notifications to all the users who have not placed order for the day

### scalable future implementation
Move this scheduled jobs from cron to Lambda function triggered by Scheduled Cloudwatch Events

## Assigning Orders to Delivery Executives

### current implementation

Currently all orders can be assigned with a delivery executive manually from the Django Admin

### scalable future implementation

Determine the best suited delivery executive using Greedy Algorithm for shortest delivery time for customer for order. 
Also architecture wise: A separate event-processor should subscribe to Kafka or RabbitMQ, where the events like order-status-changed and driver-location-updated will re-initiate this algorithm to make necessary changes in driver-order-assignment

---
 
# Top ToDos to make this project scalable to million users and secure

1.  Access based authorisation of the APIs
2.  Rate limiting middlewares
3.  Using core DRF libraries to minimise duplication of code and standard API response body structure
4.  Unit test of all the business logics and validation at top most priority, then unit for all the rest
5.  Move the scheduled jobs from cron to Lambda function triggered by Scheduled Cloudwatch Events
6.  Offloading non-crud APIs to separate microservices
7.  Store transactional data in MongoDB

# Extras

* Command to restore database once the docker container of PostgreSQL is running
```
 psql -h 0.0.0.0 -p 5433 -U breakit -W breakit < dbbk.sql
```
