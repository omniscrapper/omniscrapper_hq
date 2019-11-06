server:
	bundle exec hanami s

console:
	bundle exec hanami c

test:
	bundle exec rspec

clean:
	bundle exec hanami db drop

db-reset:
	bundle exec hanami db drop
	bundle exec hanami db create
	bundle exec hanami db migrate
	bundle exec rake db:seed

db-prepare:
	bundle exec hanami db prepare
	bundle exec rake db:seed

lint:
	bundle exec rubocop

linter-fix:
	bundle exec rubocop --auto-correct

.PHONY: test
