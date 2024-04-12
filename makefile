# Define phony targets to avoid conflicts with existing files/directories
.PHONY: all build test run clean fmt vet

# Default target - builds and runs the application
all: build run

# Build the application - specify output binary name
build:
  go build -o main ./...

# Run tests - customize the pattern for test files
test:
  go test ./... -coverprofile=coverage.out

# Run the application
run: build
  ./main

# Clean up build artifacts
clean:
  rm -rf main coverage.out

# Code formatting
fmt:
  go fmt ./...

# Static code analysis
vet:
  go vet ./...

# Help target - displays available commands
help:
  @grep -E '^[^ ]+:.*?#?\{2\}' $(MAKEFILE_LIST) | sort
