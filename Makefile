step=-----------------------

# HELP MENU
all: help
help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1.  make build             - Build image Composer"
	@echo "   2.  make composer-install  - Test composer install with image Composer"
	@echo "   3.  make composer-update   - Test composer update with image Composer"
	@echo "   4.  make tests             - Test build and run image Composer"
	@echo ""


# MANAGE
build:
	@echo "$(step) Building Composer $(step)"
	@docker build -t cedvan/composer:latest .


# TESTS
composer-install:
	@echo "$(step) Testing composer install with $(step)"
	@docker run \
		--name cedvan-composer \
		--rm \
		-it \
		-v $(PWD)/tests:/src \
		cedvan/composer:latest \
		install

composer-update:
	@echo "$(step) Testing composer update $(step)"
	@docker run \
		--name cedvan-composer \
		--rm \
		-it \
		-v $(PWD)/tests:/src \
		cedvan/composer:latest \
		update

tests:  build composer-install composer-update