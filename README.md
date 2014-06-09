# DBC OVERFLOW
A functional clone of Stack Overflow.

## QUICK START
Run `$ bundle install`

Run `$ bundle exec rake assets:precompile RAILS_ENV=production` to compile vendor asset pipeline

Run `$ rake db:setup` or `$ rake db:create:all`

To run Capybara tests in Chrome instead of its default browser (Firefox), see testing section at bottom.

## WORKING CONTRACT

- Create schema as a group
- Any modifications to the schema should be decided as a group
- Create MVC skeleton
- Delegate responsibilities and make a contract as to what the expected data structure will look like between them; use mocks/stubs until feature team receives real data

## HOW TO CONTRIBUTE

- Each contributor forks from DBC Overflow master

- Create new branch for each feature or bug fix on your fork

- Commit changes to your local repo (Git)

-- `$git commit -m "message" `

- Rebase from DBC Overflow master (for most accurate commit history)

-- `$git pull --rebase upstream master`

- Push your feature branch to your fork

-- `$git push origin feature-branch-name`

- Submit a pull request to Stack Overflow master on Github

-- Someone who did not write your code should review your code and merge


## TESTING

To make Chrome the default browser for Capybara instead of Firefox

http://chromedriver.storage.googleapis.com/index.html

Move extracted `chromedriver` to `/usr/bin/`

and make executable by running:

```bash
$ sudo chmod +x /usr/bin/chromedriver
```

## DEVELOPERS

Please thank our well-respected developers:
- Beverly Mah
- Christine Feaster
- Siyan Beverly
- Alexander Frankel
- Neal Fennimore
- Reid Covington
- Insung Lee
- Justin Phelps