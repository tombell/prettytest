VERSION?=dev
COMMIT=$(shell git rev-parse HEAD | cut -c -8)

LDFLAGS=-ldflags "-X main.Version=${VERSION} -X main.Commit=${COMMIT}"
MODFLAGS=-mod=vendor

PLATFORMS:=darwin linux

all: dev

clean:
	rm -fr dist/

dev:
	go build ${MODFLAGS} ${LDFLAGS} -o dist/prettytest ./cmd/prettytest

dist: $(PLATFORMS)

$(PLATFORMS):
	GOOS=$@ GOARCH=amd64 go build ${MODFLAGS} ${LDFLAGS} -o dist/prettytest-$@-amd64 ./cmd/prettytest

test:
	go test ${MODFLAGS} ./...

.PHONY: all clean dev dist darwin linux test
