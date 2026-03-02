.PHONY: setup hooks format analyze test coverage verify security

setup:
	flutter pub get

hooks:
	lefthook install

format:
	dart format --set-exit-if-changed lib test

analyze:
	flutter analyze

test:
	flutter test --test-randomize-ordering-seed=random

coverage:
	flutter test --coverage

security:
	sh tool/security/secret_scan.sh

verify: format analyze test security
