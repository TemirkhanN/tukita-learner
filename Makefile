.PHONY: dockerize
dockerize:
	docker run --rm -it --name tukta-learner-npm -v ${PWD}:/app node:22-alpine3.19 sh

# Make it work without calling dockerize
.PHONY: build
build:
	npx webpack --mode production