SHELL := /bin/bash

# Colors used for more helpful log statements.
NO_COLOR=\x1b[0m
OK_COLOR=\x1b[32;01m
ERROR_COLOR=\x1b[31;01m
WARN_COLOR=\x1b[33;01m

# Log levels.
OK=$(OK_COLOR)[OK]$(NO_COLOR)
ERROR=$(ERROR_COLOR)[ERROR]$(NO_COLOR)
WARN=$(WARN_COLOR)[WARNING]$(NO_COLOR)
ERROR_STRING=$(ERROR_COLOR)%s$(NO_COLOR) # printf '$(ERROR_STRING) %s' 'Error text in red.' 'Rest of text in no color.'

.PHONY: build deploy

build:
	@echo -e "$(OK) Building..."
	cd public && npm install && npx gulp build

deploy:
	@echo -e "$(OK) Deploying to production..."
	netlify deploy --prod -d public