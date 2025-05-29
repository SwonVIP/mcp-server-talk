# Math Assistant MCP Server - Docker Edition

This is a dockerized version of the Math Assistant MCP Server, following the pattern used by the [GitHub MCP Server](https://github.com/github/github-mcp-server).

## Features

- **Dockerized**: Runs in a secure, isolated container
- **Mathematical Tools**: Add, subtract, multiply, divide, and more
- **MCP Protocol**: Full Model Context Protocol support
- **FastMCP Framework**: Built with the FastMCP Python framework
- **Security**: Runs as non-root user in container

## Prerequisites

1. **Docker**: Make sure Docker is installed and running
   - [Install Docker Desktop](https://www.docker.com/products/docker-desktop/)
   - Verify installation: `docker --version`

2. **MCP Client**: Claude Desktop, Cursor, or another MCP-compatible client

## Quick Start

### Option 1: Using the Build Script (Recommended)

```bash
# Build and run the container
./build.sh

# Or run individual commands
./build.sh build    # Build the image
./build.sh run      # Run the container
./build.sh logs     # View logs
./build.sh stop     # Stop the container
./build.sh clean    # Remove container and image
```

### Option 2: Using Docker Commands

```bash
# Build the Docker image
docker build -t math-mcp-server:latest .

# Run the container
docker run -d --name math-mcp-server math-mcp-server:latest

# View logs
docker logs math-mcp-server

# Stop the container
docker stop math-mcp-server
```

### Option 3: Using Docker Compose

```bash
# Build and run
docker-compose up -d

# View logs
docker-compose logs -f

# Stop
docker-compose down
```

## Configuration

### For Cursor/VS Code

Add this configuration to your MCP settings:

```json
{
  "mcpServers": {
    "math-assistant-docker": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "math-mcp-server:latest"
      ]
    }
  }
}
```

### For Claude Desktop

Add this to your `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "math-assistant-docker": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "math-mcp-server:latest"
      ]
    }
  }
}
```

## Available Tools

The Math Assistant provides these mathematical tools:

- **add_numbers(a, b)**: Add two numbers
- **subtract_numbers(a, b)**: Subtract two numbers
- **multiply_numbers(a, b)**: Multiply two numbers
- **divide_numbers(a, b)**: Divide two numbers
- **power(base, exponent)**: Raise to a power
- **square_root(number)**: Calculate square root
- **factorial(n)**: Calculate factorial
- **calculate_percentage(part, whole)**: Calculate percentage
- **calculate_average(numbers)**: Calculate average of a list

## Available Resources

- **file://server-info**: Information about the server and its capabilities

## Available Prompts

- **math-helper**: General math assistance prompt
- **calculator**: Step-by-step calculation assistance

## Docker Architecture

The Docker setup follows best practices:

- **Base Image**: Python 3.11 slim for minimal size
- **Security**: Runs as non-root user
- **Caching**: Optimized layer caching for faster builds
- **Clean**: Uses .dockerignore to exclude unnecessary files

## Development

### Building from Source

```bash
# Clone the repository (if needed)
git clone <repository-url>
cd demo/1

# Build the image
docker build -t math-mcp-server:latest .

# Run for development (with logs)
docker run --rm -it math-mcp-server:latest
```

### Debugging

```bash
# Run with shell access
docker run --rm -it --entrypoint /bin/bash math-mcp-server:latest

# View container logs
docker logs math-mcp-server

# Follow logs in real-time
docker logs -f math-mcp-server
```

## Comparison with GitHub MCP Server

This implementation follows the same patterns as the [GitHub MCP Server](https://github.com/github/github-mcp-server):

| Feature | GitHub MCP Server | Math Assistant MCP Server |
|---------|-------------------|---------------------------|
| Language | Go | Python |
| Base Image | golang:alpine | python:3.11-slim |
| Security | Non-root user | Non-root user |
| Transport | stdio | stdio |
| Configuration | Environment variables | Direct configuration |
| Build Script | Yes | Yes |
| Docker Compose | No | Yes |

## Troubleshooting

### Container Won't Start

```bash
# Check if Docker is running
docker info

# Check container logs
docker logs math-mcp-server

# Run in interactive mode to debug
docker run --rm -it math-mcp-server:latest
```

### Permission Issues

```bash
# Rebuild the image
docker build --no-cache -t math-mcp-server:latest .

# Check if running as correct user
docker exec math-mcp-server whoami
```

### MCP Client Connection Issues

1. Ensure the Docker image is built: `docker images | grep math-mcp-server`
2. Test the container manually: `docker run --rm -it math-mcp-server:latest`
3. Check MCP client configuration syntax
4. Restart your MCP client after configuration changes

## Security Considerations

- Container runs as non-root user (`mcp`)
- No sensitive data is stored in the image
- Uses minimal base image to reduce attack surface
- No network ports exposed (uses stdio transport)

## License

This project follows the same MIT license pattern as other MCP servers.

## Contributing

1. Fork the repository
2. Make your changes
3. Test with Docker: `./build.sh`
4. Submit a pull request

## Support

For issues related to:
- **Docker setup**: Check the troubleshooting section above
- **MCP protocol**: Refer to the [MCP documentation](https://modelcontextprotocol.io/)
- **FastMCP framework**: Check the [FastMCP documentation](https://github.com/jlowin/fastmcp)
