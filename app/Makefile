VENV_PREFIX =

help:
	@echo "clean - remove build artifacts"
	@echo "deploy - deploy the app to the development environment"
	@echo "run - run the local development server for testing/debugging purposes"
	@echo "test - run all of the app's tests and print a coverage report"

clean:
	# remove build artifacts from tree
	@find . -name '*.pyc' -exec rm -f {} +
	@find . -name '*.pyo' -exec rm -f {} +
	@find . -name '*~' -exec rm -f {} +
	@find . -empty -type d -delete
	@-rm .coverage
	@-rm coverage.xml
	@-rm nosetests.xml

deploy:
	# deploy application to the default environment
	appcfg.py update . --oauth2

run: clean
	# run the appengine development server
	dev_appserver.py .                            \
		--host 0.0.0.0                            \
		--admin_host 0.0.0.0                      \
		--datastore_consistency_policy consistent \
		--storage_path /.appengine_storage/       \
		--skip_sdk_update_check

test: clean
	# run tests with a coverage report
	@$(VENV_PREFIX)python ./run-tests.py
