#!/bin/bash

# Math Assistant MCP Server Docker Build Script

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
IMAGE_NAME="math-mcp-server"
CONTAINER_NAME="math-mcp-server"
TAG="latest"

# Functions
print_header() {
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}  Math Assistant MCP Server${NC}"
    echo -e "${BLUE}================================${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Check if Docker is running
check_docker() {
    if ! docker info > /dev/null 2>&1; then
        print_error "Docker is not running. Please start Docker and try again."
        exit 1
    fi
    print_success "Docker is running"
}

# Build the Docker image
build_image() {
    print_info "Building Docker image: ${IMAGE_NAME}:${TAG}"

    if docker build -t "${IMAGE_NAME}:${TAG}" .; then
        print_success "Docker image built successfully"
    else
        print_error "Failed to build Docker image"
        exit 1
    fi
}

# Stop and remove existing container
cleanup_container() {
    if docker ps -a --format 'table {{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
        print_info "Stopping and removing existing container: ${CONTAINER_NAME}"
        docker stop "${CONTAINER_NAME}" > /dev/null 2>&1 || true
        docker rm "${CONTAINER_NAME}" > /dev/null 2>&1 || true
        print_success "Existing container removed"
    fi
}

# Run the container
run_container() {
    print_info "Running container: ${CONTAINER_NAME}"

    docker run -d \
        --name "${CONTAINER_NAME}" \
        --restart unless-stopped \
        "${IMAGE_NAME}:${TAG}"

    print_success "Container started successfully"
}

# Test the container
test_container() {
    print_info "Testing container..."

    # Wait a moment for the container to start
    sleep 2

    if docker ps --format 'table {{.Names}}\t{{.Status}}' | grep -q "${CONTAINER_NAME}.*Up"; then
        print_success "Container is running"

        # Show container logs
        print_info "Container logs:"
        docker logs "${CONTAINER_NAME}" --tail 10
    else
        print_error "Container failed to start"
        print_info "Container logs:"
        docker logs "${CONTAINER_NAME}"
        exit 1
    fi
}

# Show usage information
show_usage() {
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  build     Build the Docker image"
    echo "  run       Run the container"
    echo "  stop      Stop the container"
    echo "  restart   Restart the container"
    echo "  logs      Show container logs"
    echo "  shell     Open a shell in the container"
    echo "  clean     Remove container and image"
    echo "  help      Show this help message"
    echo ""
    echo "If no command is provided, it will build and run the container."
}

# Main script logic
main() {
    print_header

    case "${1:-build-and-run}" in
        "build")
            check_docker
            build_image
            ;;
        "run")
            check_docker
            cleanup_container
            run_container
            test_container
            ;;
        "build-and-run")
            check_docker
            build_image
            cleanup_container
            run_container
            test_container
            ;;
        "stop")
            docker stop "${CONTAINER_NAME}" 2>/dev/null || print_warning "Container not running"
            print_success "Container stopped"
            ;;
        "restart")
            docker restart "${CONTAINER_NAME}" 2>/dev/null || print_error "Container not found"
            print_success "Container restarted"
            ;;
        "logs")
            docker logs "${CONTAINER_NAME}" -f
            ;;
        "shell")
            docker exec -it "${CONTAINER_NAME}" /bin/bash
            ;;
        "clean")
            docker stop "${CONTAINER_NAME}" 2>/dev/null || true
            docker rm "${CONTAINER_NAME}" 2>/dev/null || true
            docker rmi "${IMAGE_NAME}:${TAG}" 2>/dev/null || true
            print_success "Cleanup completed"
            ;;
        "help"|"-h"|"--help")
            show_usage
            ;;
        *)
            print_error "Unknown command: $1"
            show_usage
            exit 1
            ;;
    esac
}

# Run the main function
main "$@"
