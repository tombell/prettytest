package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

const (
	reset  = "\033[30m"
	red    = "\033[31m"
	green  = "\033[32m"
	yellow = "\033[33m"
)

func main() {
	scanner := bufio.NewScanner(os.Stdin)

	for scanner.Scan() {
		line := scanner.Text()
		trimmed := strings.TrimSpace(line)

		c := reset

		switch {
		// failure
		case strings.HasPrefix(trimmed, "--- FAIL"):
			fallthrough
		case strings.HasPrefix(trimmed, "FAIL"):
			c = red

		// success
		case strings.HasPrefix(trimmed, "--- PASS"):
			fallthrough
		case strings.HasPrefix(trimmed, "ok"):
			fallthrough
		case strings.HasPrefix(trimmed, "PASS"):
			c = green

		// no test files
		case strings.HasPrefix(trimmed, "?"):
			c = yellow
		}

		fmt.Println(c + line + "\033[0m")
	}
}
