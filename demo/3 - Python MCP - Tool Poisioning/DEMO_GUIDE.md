# Demo 3: Math Assistant MCP Server - UV Edition

This demo showcases how to create and configure an MCP server using UV package manager for use with Cursor and other MCP clients.

## What This Demo Shows

- **UV Package Management**: Using UV for fast Python dependency management
- **MCP Server Implementation**: Complete MCP server with tools, resources, and prompts
- **Cursor Integration**: Easy configuration for Cursor IDE
- **FastMCP Framework**: Modern Python MCP server development

## Quick Demo Steps

### 1. Setup the Environment

```bash
# Navigate to the demo directory
cd demo/3

# Run the setup script (installs UV if needed and sets up the project)
./setup.sh

# Or manually:
uv sync
```

### 2. Test the Server

```bash
# Test that the server starts correctly
./setup.sh test

# Or manually run the server
uv run simple_mcp_server.py
```

### 3. Configure Cursor

```bash
# Get the configuration for Cursor
./setup.sh config
```

Copy the output and add it to your Cursor MCP configuration.

### 4. Use the Server

Once configured in Cursor, you can:

- Use mathematical tools (add, subtract, multiply, etc.)
- Access server information via resources
- Use math helper prompts

**Example Usage:**
Simply ask natural language questions like:
- "Add 5 and 7" - This will call the `add_numbers` function
- "What's 15 minus 8?" - This will use the `subtract_numbers` function
- "Calculate 6 times 9" - This will invoke the `multiply_numbers` function
- "What's the square root of 64?" - This will use the `square_root` function

## Key Features Demonstrated

### Tools
- `add_numbers(a, b)` - Addition with recipe content
- `subtract_numbers(a, b)` - Subtraction
- `multiply_numbers(a, b)` - Multiplication
- `divide_numbers(a, b)` - Division with error handling
- `power(base, exponent)` - Exponentiation
- `square_root(number)` - Square root calculation
- `factorial(n)` - Factorial calculation
- `calculate_percentage(part, whole)` - Percentage calculation
- `calculate_average(numbers)` - Average of a list

### Resources
- `file://server-info` - Server capabilities and information
- `file://recipe` - Recipe content from local file

### Prompts
- `math-helper` - General math assistance
- `calculator` - Step-by-step calculation help

## Advantages of UV Approach

1. **Fast Setup**: UV is much faster than pip for dependency resolution
2. **Simple Configuration**: No Docker required, direct execution
3. **Development Friendly**: Instant changes, no rebuilds needed
4. **Cross-Platform**: Works on macOS, Linux, and Windows
5. **Modern Tooling**: Uses pyproject.toml standard

## Comparison with Docker Version (Demo 1)

| Aspect | Docker Version | UV Version |
|--------|----------------|------------|
| **Setup Time** | Slower (build image) | Faster (install deps) |
| **Resource Usage** | Higher (container) | Lower (native) |
| **Development** | Rebuild required | Instant changes |
| **Isolation** | Full container | Virtual environment |
| **Portability** | Docker required | UV required |
| **Complexity** | Higher | Lower |

## File Structure

```
demo/3/
├── simple_mcp_server.py      # Main MCP server implementation
├── pyproject.toml            # UV project configuration
├── setup.sh                  # Setup and utility script
├── cursor_mcp_config.json    # Sample Cursor configuration
├── README.md                 # Detailed documentation
├── DEMO_GUIDE.md            # This demo guide
├── .gitignore               # Git ignore rules
└── .venv/                   # Virtual environment (created by UV)
```

## Troubleshooting

### UV Not Found
```bash
# Install UV
curl -LsSf https://astral.sh/uv/install.sh | sh
# Or: pip install uv
```

### Dependencies Not Installing
```bash
# Clear cache and reinstall
uv cache clean
uv sync --reinstall
```

### Server Won't Connect to Cursor
1. Check the absolute path in your configuration
2. Verify UV is in your PATH
3. Test the server manually: `uv run simple_mcp_server.py`

## Next Steps

1. **Customize the Server**: Modify `simple_mcp_server.py` to add your own tools
2. **Add More Dependencies**: Use `uv add package-name` to add new packages
3. **Create Your Own MCP Server**: Use this as a template for your own projects

## Resources

- [UV Documentation](https://docs.astral.sh/uv/)
- [FastMCP GitHub](https://github.com/jlowin/fastmcp)
- [MCP Specification](https://modelcontextprotocol.io/)
- [Cursor MCP Guide](https://docs.cursor.com/mcp)
