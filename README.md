# People Parser

## Input Requirements

This parser accepts data in the following three formats:

* LastName | FirstName | MiddleInitial | Gender | FavoriteColor | DateOfBirth
* LastName, FirstName, Gender, FavoriteColor, DateOfBirth
* LastName FirstName MiddleInitial Gender DateOfBirth FavoriteColor

## Output Requirements

It outputs an aggreate of all the data to the console using the following commands:

* `rake sort:gender_last_name_asc` to display all people by gender ascending and then last name ascending
* `rake sort:birth_last_name_asc` to display all people by birth date ascending and then last name ascending
* `rake sort:last_name_desc` to display all people by last name descending

## Running Tests

Run `bundle install` to install rspec and dependencies

`rspec spec/` will run all tests, while `rspec spec/<file_name>` will run only the chosen unit test