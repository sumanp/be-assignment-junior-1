# Rails Assignment - Splitwise

## How to run the application
- Run tests `rpsec spec`
- Run server `rails s`

## Assumptions
- It is assumed that each expense is a single line item.
- It is assumed that on `people/:id` "List Friend expenses", expenses made by the friend (where the person was payer) is listed along with how much was paid and how much was lent by the person.

## Possible improvements
- Proper authorisation can be implemented for expense edit, delete.
- Groups feature can be introduced to the app similar to Splitwise where friends can be added to the group.
- Multi-select js library can be integrated on drop-down multi select in the form.
- A single page form can be built with stimulusJS to create expense. At the moment the create form is multi-part, where Expense is created first and then friends share can be edited.

*Note: Bonus section was not attempted due to time constraints.*
*PS: I'm a backend heavy guy, please excuse my okayish frontend work*


______________________________________________________________________________________________________


## Setup
- Fork the repository. 
- Clone the repository in your local machine.
- Run `rails db:setup`, this will also seed data in the `User` model
- Run `rails s` to start the server and `rails c` for rails console

## Requirements

- Ruby - 2.6.3
- Rails - 6.1.4
- Git (configured with your Github account)
- Node - 12.13.1


## Things available in the repo
- Webpacker configured and following packages are added and working.
  - Jquery
  - Bootstrap
  - Jgrowl
- Devise installed and `User` model is added. Sign in and Sign up pages have been setup.
- Routes and layouts for following page have been added.
  - Dashboard - This will be the root page.
  - Friend page - `/people/:id`


## Submission
- Make the improvements as specified in your technical assignment task.
- Commit all changes to the fork you created
- Deploy your app to Heroku
- Send us the link of the dpeloyed application and your fork.


## Contact us
If you need any help regarding this assignment or want to join [Commutatus](https://www.commutatus.com/), drop us an email at work@commutatus.com 