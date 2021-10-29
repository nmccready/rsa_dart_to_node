.PHONY: install
install:
	dart pub get
	npm install

.PHONY: keys
keys:
	openssl genrsa -out ./test/private_key.pem 1024
	openssl rsa -in ./test/private_key.pem -pubout > ./test/public_key.pem


# WE TEST DART TO NODE like flutter / firebase
.PHONY: test
test:
	dart run --verbosity=error ./lib/encrypt_client.dart | ./lib/decrypt.js

.PHONY: help
help:					## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
