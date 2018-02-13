BINARY=prettytest
GOARCH=amd64

VERSION?=dev
COMMIT=$(shell git rev-parse HEAD | cut -c -8)

LDFLAGS=-ldflags "-X main.Version=${VERSION} -X main.Commit=${COMMIT}"

PACKAGE=./cmd/prettytest

all: dev

clean:
	rm -fr dist/

dev: build

dist: linux darwin

build:
	go build ${LDFLAGS} -o dist/${BINARY} ${PACKAGE}

linux:
	GOOS=linux GOARCH=${GOARCH} go build ${LDFLAGS} -o dist/${BINARY}-linux-${GOARCH} ${PACKAGE}

darwin:
	GOOS=darwin GOARCH=${GOARCH} go build ${LDFLAGS} -o dist/${BINARY}-darwin-${GOARCH} ${PACKAGE}

windows:
	@echo "This project is unsupported on Windows"

.PHONY: all clean dev dist build linux darwin windows
