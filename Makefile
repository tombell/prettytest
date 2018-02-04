build:
	go build -o dist/prettytest ./cmd/prettytest

clean:
	rm -fr dist/

.PHONY: build clean
