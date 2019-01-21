# prettytest

Pipe output of `go test` to add color.

## Installation

To get the most up to date binaries, check [the releases][releases] for the
pre-built binary for your system.

[releases]: https://github.com/tombell/prettytest/releases

You can also `go get` to install from source.

    go get -u github.com/tombell/prettytest/cmd/prettytest

On macOS you can use [Homebrew](https://brew.sh) to install.

    brew tap tombell/formulae && brew install tombell/formulae/prettytest

## Usage

Pipe the output from running `go test` into `prettytest` to get the colorized
output.

    go test ./... | prettytest

This will filter out lines from the output that include `[no test files]` to
keep the output simple. If you want to see this output, you can add the `-v`
flag.

    go test ./... | prettytest -v
