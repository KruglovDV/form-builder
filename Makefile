install:
	bundle install

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -A

tests:
	rake test

