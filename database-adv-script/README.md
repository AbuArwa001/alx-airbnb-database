1. # Write Complex Queries with Joins
# Objective
    Master SQL joins by writing complex queries using different types of joins
## Instructions:

    Write a query using an `INNER JOIN` to retrieve all bookings and the respective users who made those bookings.

    Write a query using a `LEFT JOIN` to retrieve all properties and their reviews, including properties that have no reviews.

    Write a query using a `FULL OUTER JOIN` to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

2. # Practice Subqueries

    Objective: Write both correlated and non-correlated subqueries.

## Instructions:

    Write a query to find all properties where the average rating is greater than 4.0 using a subquery.

    Write a correlated subquery to find users who have made more than 3 bookings.

3. Apply Aggregations and Window Functions

**Objective**: Use SQL aggregation and window functions to analyze data.

### Instructions:

Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.

4. Objective: Refactor complex queries to improve performance.

## Instructions:

Write an initial query that retrieves all bookings along with the user details, property details, and payment details and save it on perfomance.sql

    Analyze the query’s performance using EXPLAIN and identify any inefficiencies.

    Refactor the query to reduce execution time, such as reducing unnecessary joins or using indexing.