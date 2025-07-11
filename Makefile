IMAGE_NAME=eeg-spark-pipeline
TAG=latest
REGISTRY=nour333

build:
	docker build -t $(IMAGE_NAME):$(TAG) .

build-no-cache:
	docker build --no-cache -t $(IMAGE_NAME):$(TAG) .

run:
	docker run --rm $(IMAGE_NAME):$(TAG)

shell:
	docker run -it --rm $(IMAGE_NAME):$(TAG) bash

push:
	docker tag $(IMAGE_NAME):$(TAG) $(REGISTRY)/$(IMAGE_NAME):$(TAG)
	docker push $(REGISTRY)/$(IMAGE_NAME):$(TAG)

