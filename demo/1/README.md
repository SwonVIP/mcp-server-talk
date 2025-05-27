# Math Assistant MCP Server Demo

This directory contains a Math Assistant MCP (Model Context Protocol) server built with FastMCP that demonstrates mathematical calculation capabilities.

## What This Demo Shows

This Math Assistant MCP server demonstrates:

- **Tools**: Mathematical functions that can be called by LLMs (arithmetic, advanced calculations)
- **Resources**: Information that can be read by LLMs (server info, available operations)
- **Prompts**: Reusable interaction templates for mathematical assistance

## Features

### Available Tools
- `add_numbers(a, b)` - Add two numbers together
- `subtract_numbers(a, b)` - Subtract two numbers
- `multiply_numbers(a, b)` - Multiply two numbers
- `divide_numbers(a, b)` - Divide two numbers
- `power(base, exponent)` - Raise a number to a power
- `square_root(number)` - Calculate square root
- `factorial(n)` - Calculate factorial of an integer
- `calculate_percentage(part, whole)` - Calculate percentage
- `calculate_average(numbers)` - Calculate average of a list

### Available Resources
- `file://server-info` - Information about the server and its mathematical capabilities

### Available Prompts
- `math-helper` - Template for mathematical assistance
- `calculator` - Template for step-by-step calculation assistance

## Prerequisites

- Python 3.8 or higher
- pip or uv package manager

## Installation

1. **Navigate to this directory:**
   ```bash
   cd demo/1
   ```

2. **Install dependencies:**

   Using uv (recommended):
   ```bash
   uv pip install -r requirements.txt
   ```

   Using pip:
   ```bash
   pip install -r requirements.txt
   ```

## Running the Server

### Method 1: Direct Python execution
```bash
python simple_mcp_server.py
```

### Method 2: Using FastMCP CLI
```bash
fastmcp run simple_mcp_server.py
```

The server will start and be ready to accept MCP connections.

## Cursor Configuration

To use this Math Assistant MCP server with Cursor, add the following configuration to your Cursor `mcp.json` file:

### Location of mcp.json
- **macOS**: `~/Library/Application Support/Cursor/User/globalStorage/rooveterinaryinc.roo-cline/settings/cline_mcp_settings.json`
- **Windows**: `%APPDATA%\Cursor\User\globalStorage\rooveterinaryinc.roo-cline\settings\cline_mcp_settings.json`
- **Linux**: `~/.config/Cursor/User/globalStorage/rooveterinaryinc.roo-cline/settings/cline_mcp_settings.json`

### Configuration to Add

```json
{
  "mcpServers": {
    "math-assistant": {
      "command": "python",
      "args": ["/absolute/path/to/demo/1/simple_mcp_server.py"],
      "cwd": "/absolute/path/to/demo/1"
    }
  }
}
```

**Important**: Replace `/absolute/path/to/demo/1` with the actual absolute path to this directory on your system.

### Alternative Configuration (using uv)

If you prefer to use uv:

```json
{
  "mcpServers": {
    "math-assistant": {
      "command": "uv",
      "args": ["run", "python", "simple_mcp_server.py"],
      "cwd": "/absolute/path/to/demo/1"
    }
  }
}
```

## Testing the Server

Once the server is running and configured in Cursor, you can test it by:

1. **Using Math Tools**: Ask Cursor to perform mathematical calculations
   - "Can you add 15 and 27 for me?"
   - "What's the square root of 144?"
   - "Calculate 5 factorial"
   - "What percentage is 25 out of 200?"
   - "Find the average of these numbers: 10, 20, 30, 40, 50"

2. **Accessing Resources**: Ask Cursor to read server information
   - "What mathematical operations are available from the server-info resource?"

3. **Using Prompts**: Ask Cursor to use the predefined prompts
   - "Use the math-helper prompt to help me with multiplication"
   - "Use the calculator prompt for step-by-step division"

## Example Interactions

### Basic Arithmetic
```
User: "Can you multiply 42 and 58?"
Assistant: I'll use the multiply_numbers tool to calculate that for you.
[Uses multiply_numbers(42, 58)]
Result: 2436
```

### Advanced Calculations
```
User: "What's 2 to the power of 8?"
Assistant: I'll calculate that using the power tool.
[Uses power(2, 8)]
Result: 256
```

### Statistical Calculations
```
User: "Find the average of 85, 92, 78, 96, 89"
Assistant: I'll calculate the average using the calculate_average tool.
[Uses calculate_average([85, 92, 78, 96, 89])]
Result: 88.0
```

## File Structure

```
demo/1/
├── simple_mcp_server.py    # Main Math Assistant MCP server implementation
├── requirements.txt        # Python dependencies
├── README.md              # This file
└── cursor-mcp-config.json # Sample Cursor configuration
```

## Troubleshooting

### Server Won't Start
- Ensure FastMCP is installed: `pip list | grep fastmcp`
- Check Python version: `python --version` (should be 3.8+)
- Verify the script runs: `python simple_mcp_server.py`

### Cursor Can't Connect
- Verify the absolute path in your mcp.json configuration
- Ensure the server is running before trying to use it in Cursor
- Check Cursor's developer console for error messages

### Tools Not Working
- Restart Cursor after updating mcp.json
- Verify the server is responding by checking its output
- Make sure you're using the exact tool names as defined in the server

## Next Steps

After getting this Math Assistant server working, you can:

1. **Extend the server** by adding more mathematical functions (trigonometry, logarithms, etc.)
2. **Explore the FastMCP documentation** at https://gofastmcp.com
3. **Build specialized servers** for specific mathematical domains
4. **Integrate with mathematical libraries** like NumPy or SciPy

## Resources

- [FastMCP Documentation](https://gofastmcp.com)
- [Model Context Protocol Specification](https://modelcontextprotocol.io)
- [FastMCP GitHub Repository](https://github.com/jlowin/fastmcp)
