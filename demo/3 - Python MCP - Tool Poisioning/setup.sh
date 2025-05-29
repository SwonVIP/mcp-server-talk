#!/bin/bash

# Math Assistant MCP Server - UV Edition Setup Script
# This script helps set up and run the UV-based MCP server

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if UV is installed
check_uv() {
    if command -v uv &> /dev/null; then
        print_success "UV is installed ($(uv --version))"
        return 0
    else
        print_error "UV is not installed"
        return 1
    fi
}

# Function to install UV
install_uv() {
    print_status "Installing UV..."
    if command -v curl &> /dev/null; then
        curl -LsSf https://astral.sh/uv/install.sh | sh
        print_success "UV installed successfully"
        print_warning "Please restart your terminal or run: source ~/.bashrc"
    else
        print_error "curl is not available. Please install UV manually:"
        echo "  Visit: https://docs.astral.sh/uv/getting-started/installation/"
        exit 1
    fi
}

# Function to setup the project
setup_project() {
    print_status "Setting up the project..."

    # Sync dependencies
    uv sync

    print_success "Project setup complete"
}

# Function to test the server
test_server() {
    print_status "Testing the MCP server..."

    # Run the server for a few seconds to test
    timeout 5s uv run simple_mcp_server.py || true

    print_success "Server test complete"
}

# Function to show configuration
show_config() {
    local current_dir=$(pwd)

    print_status "MCP Server Configuration"
    echo ""
    echo "Add this to your Cursor MCP configuration:"
    echo ""
    echo "{"
    echo "  \"mcpServers\": {"
    echo "    \"math-assistant-uv\": {"
    echo "      \"command\": \"uv\","
    echo "      \"args\": ["
    echo "        \"run\","
    echo "        \"--directory\","
    echo "        \"${current_dir}\","
    echo "        \"simple_mcp_server.py\""
    echo "      ]"
    echo "    }"
    echo "  }"
    echo "}"
    echo ""
    print_warning "Make sure to use the absolute path: ${current_dir}"
}

# Function to run the server
run_server() {
    print_status "Starting the Math Assistant MCP Server..."
    uv run simple_mcp_server.py
}

# Main script logic
main() {
    echo "Math Assistant MCP Server - UV Edition Setup"
    echo "============================================="
    echo ""

    case "${1:-setup}" in
        "check")
            print_status "Checking prerequisites..."
            if check_uv; then
                print_success "All prerequisites are met"
            else
                print_error "Prerequisites not met"
                exit 1
            fi
            ;;
        "install-uv")
            install_uv
            ;;
        "setup")
            if ! check_uv; then
                print_warning "UV not found. Installing..."
                install_uv
                print_warning "Please restart your terminal and run this script again"
                exit 0
            fi
            setup_project
            print_success "Setup complete!"
            echo ""
            show_config
            ;;
        "test")
            test_server
            ;;
        "config")
            show_config
            ;;
        "run")
            run_server
            ;;
        "help"|"-h"|"--help")
            echo "Usage: $0 [command]"
            echo ""
            echo "Commands:"
            echo "  setup      - Set up the project (default)"
            echo "  check      - Check prerequisites"
            echo "  install-uv - Install UV package manager"
            echo "  test       - Test the server"
            echo "  config     - Show MCP configuration"
            echo "  run        - Run the server"
            echo "  help       - Show this help message"
            ;;
        *)
            print_error "Unknown command: $1"
            echo "Run '$0 help' for usage information"
            exit 1
            ;;
    esac
}

# Run the main function with all arguments
main "$@"
