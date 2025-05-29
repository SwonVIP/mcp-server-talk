# Math Assistant MCP Server - UV Edition

This is a UV-based version of the Math Assistant MCP Server, designed for easy integration with Cursor and other MCP clients. UV provides fast Python package management and execution.

## Features

- **UV Package Manager**: Fast, reliable Python package management
- **Mathematical Tools**: Add, subtract, multiply, divide, and more
- **MCP Protocol**: Full Model Context Protocol support
- **FastMCP Framework**: Built with the FastMCP Python framework
- **Easy Integration**: Simple configuration for Cursor and Claude Desktop

## Prerequisites

1. **UV**: Make sure UV is installed
   ```bash
   # Install UV (if not already installed)
   curl -LsSf https://astral.sh/uv/install.sh | sh

   # Or using pip
   pip install uv

   # Verify installation
   uv --version
   ```

2. **MCP Client**: Cursor, Claude Desktop, or another MCP-compatible client

## Quick Start

### Option 1: Direct UV Run (Recommended)

```bash
# Navigate to the demo/3 directory
cd demo/3

# Run the server directly with UV
uv run simple_mcp_server.py
```

### Option 2: Install and Run

```bash
# Install dependencies
uv sync

# Run the server
uv run python simple_mcp_server.py
```

## Configuration

### For Cursor

Add this configuration to your Cursor MCP settings (`.cursor/mcp_config.json` or settings):

```json
{
  "mcpServers": {
    "math-assistant-uv": {
      "command": "uv",
      "args": [
        "run",
        "--directory",
        "/Users/sven.scheffel/Documents/repositories/mcp-server-talk/demo/3",
        "simple_mcp_server.py"
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
    "math-assistant-uv": {
      "command": "uv",
      "args": [
        "run",
        "--directory",
        "/Users/sven.scheffel/Documents/repositories/mcp-server-talk/demo/3",
        "simple_mcp_server.py"
      ]
    }
  }
}
```

**Note**: Replace the path with the actual absolute path to your `demo/3` directory.

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
- **file://recipe**: Recipe content from local file (if available)

## Available Prompts

- **math-helper**: General math assistance prompt
- **calculator**: Step-by-step calculation assistance

## UV Advantages

UV offers several advantages over traditional Python package management:

- **Speed**: Much faster than pip for package installation and resolution
- **Reliability**: Better dependency resolution and lock file support
- **Simplicity**: Single tool for package management and script execution
- **Compatibility**: Works with existing Python projects and pyproject.toml

## Development

### Setting up for Development

```bash
# Clone the repository (if needed)
cd demo/3

# Install dependencies in development mode
uv sync --dev

# Run the server
uv run python simple_mcp_server.py
```

### Testing the Server

```bash
# Test with UV directly
uv run simple_mcp_server.py

# The server will start and display available tools
```

### Adding Dependencies

```bash
# Add a new dependency
uv add package-name

# Add a development dependency
uv add --dev package-name

# Update dependencies
uv sync
```

## Comparison with Docker Version

| Feature | Docker Version | UV Version |
|---------|----------------|------------|
| Setup Complexity | High (Docker required) | Low (UV only) |
| Startup Time | Slower (container startup) | Faster (direct execution) |
| Resource Usage | Higher (container overhead) | Lower (native execution) |
| Isolation | Full container isolation | Process-level isolation |
| Portability | High (Docker everywhere) | High (UV cross-platform) |
| Development | Requires rebuilds | Instant changes |

## Troubleshooting

### UV Not Found

```bash
# Install UV
curl -LsSf https://astral.sh/uv/install.sh | sh

# Or using pip
pip install uv

# Add to PATH if needed (check UV installation docs)
```

### Dependencies Not Installing

```bash
# Clear UV cache
uv cache clean

# Reinstall dependencies
uv sync --reinstall
```

### Server Won't Start

```bash
# Check Python version
python --version

# Run with verbose output
uv run --verbose simple_mcp_server.py

# Check for missing dependencies
uv sync
```

### Path Issues in Configuration

Make sure to use the absolute path to the `demo/3` directory in your MCP configuration. You can get the absolute path with:

```bash
# Get current directory path
pwd

# Should output something like:
# /Users/sven.scheffel/Documents/repositories/mcp-server-talk/demo/3
```

## File Structure

```
demo/3/
├── simple_mcp_server.py    # Main MCP server implementation
├── pyproject.toml          # UV project configuration
├── README.md              # This file
└── uv.lock               # UV lock file (auto-generated)
```

## Next Steps

1. **Test the Configuration**: Add the MCP server to your client configuration
2. **Verify Connection**: Check that the server appears in your MCP client
3. **Test Tools**: Try using the mathematical tools
4. **Customize**: Modify the server code for your specific needs

## Resources

- [UV Documentation](https://docs.astral.sh/uv/)
- [FastMCP Documentation](https://github.com/jlowin/fastmcp)
- [MCP Protocol Specification](https://modelcontextprotocol.io/)
- [Cursor MCP Documentation](https://docs.cursor.com/mcp)
