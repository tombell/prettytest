package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	scanner := bufio.NewScanner(os.Stdin)

	for scanner.Scan() {
		line := scanner.Text()
		trimmed := strings.TrimSpace(line)

		c := "\033[0m"

		switch {
		// success
		case strings.HasPrefix(trimmed, "--- PASS"):
			fallthrough
		case strings.HasPrefix(trimmed, "ok"):
			fallthrough
		case strings.HasPrefix(trimmed, "PASS"):
			c = "\033[32m"

		// failure
		case strings.HasPrefix(trimmed, "--- FAIL"):
			fallthrough
		case strings.HasPrefix(trimmed, "FAIL"):
			c = "\033[31m"
		}

		fmt.Println(c + line + "\033[0m")
	}
}
