RecsyRails
==========

### Installation

1. Make sure you have `rails` and `gem` installed. 
2. Clone the repo with the command below:
```
git clone git@github.com:Recsy-HackNashville/RecsyRails.git
```
3. You need bundler before you can install dependencies
```
gem install bundler
```
4. Install the dependencies
```
bundle install
```
5. Run DB setup or migrations
```
# If you want to clear out the database
rm -f db/*.sqlite3 db/schema.rb
# If this is your first time setting up the application
rake db:setup
# Otherwise
rake db:migrate
# Add data such as default sections
rake db:seed
```
5. Start the server with:
```
cd <app path>
rails server
```
