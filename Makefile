PROJNAME = nacelle-skeleton

help:
	@echo "build - Build docker container"
	@echo "storage - Create a storage-only container (we'll use its volumes elsewhere)"
	@echo "run-local - Run container for local development"
	@echo "run-deploy - Run container for in production mode"

build:
	docker build -t="appengine/$(PROJNAME)" .

storage: build
	-docker run -t -i --name $(PROJNAME) appengine/$(PROJNAME) echo "Storage-only container."

run: storage
	docker run -t -i --volumes-from $(PROJNAME) -v $(CURDIR)/app:/app -p 0.0.0.0:8080:8080 -p 0.0.0.0:8000:8000 appengine/$(PROJNAME) make -C /app run

test: storage
	docker run -t -i --volumes-from $(PROJNAME) -v $(CURDIR)/app:/app -p 0.0.0.0:8080:8080 -p 0.0.0.0:8000:8000 appengine/$(PROJNAME) make -C /app test
