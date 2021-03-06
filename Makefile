# Makefile for building and running the project.
# The purpose of this Makefile is to avoid developers having to remember
# project-specific commands for building, running, etc.  Recipes longer
# than one or two lines should live in script files of their own in the
# bin/ directory.

PORT ?= 9292

all: check

setup:
	bundle check || bundle install
	cp .env.example .env

check: lint test

lint:
	@echo "--- rubocop ---"
	bundle exec rubocop
	@echo "--- reek ---"
	bundle exec reek

run:
	bundle exec rackup -p $(PORT)

test: $(CONFIG)
	bundle exec rspec
