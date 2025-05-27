#!/bin/bash

# Math Assistant MCP Server Demo Setup Script

echo "🚀 Setting up Math Assistant MCP Server Demo..."

# Check if Python is available
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is required but not installed. Please install Python 3.8 or higher."
    exit 1
fi

# Check Python version
python_version=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
required_version="3.8"

if [ "$(printf '%s\n' "$required_version" "$python_version" | sort -V | head -n1)" != "$required_version" ]; then
    echo "❌ Python $required_version or higher is required. Found: $python_version"
    exit 1
fi

echo "✅ Python $python_version found"

# Install dependencies
echo "📦 Installing dependencies..."

if command -v uv &> /dev/null; then
    echo "Using uv to install dependencies..."
    uv pip install -r requirements.txt
elif command -v pip3 &> /dev/null; then
    echo "Using pip to install dependencies..."
    pip3 install -r requirements.txt
else
    echo "❌ Neither uv nor pip found. Please install pip or uv."
    exit 1
fi

echo "✅ Dependencies installed successfully"

# Test the server
echo "🧪 Testing server configuration..."
python3 -c "
from simple_mcp_server import mcp
print('✅ Server imports successfully')
print('✅ Available tools:', len(list(mcp._tool_manager._tools.keys())))
print('✅ Available resources:', len(list(mcp._resource_manager._resources.keys())))
print('✅ Available prompts:', len(list(mcp._prompt_manager._prompts.keys())))
" || {
    echo "❌ Server configuration failed. Check the error messages above."
    exit 1
}

echo ""
echo "🎉 Setup complete!"
echo ""
echo "Next steps:"
echo "1. Add the configuration from cursor-mcp-config.json to your Cursor mcp.json file"
echo "2. Update the paths in the configuration to match your system"
echo "3. Run the server: python3 simple_mcp_server.py"
echo "4. Test it in Cursor by asking it to perform mathematical calculations"
echo ""
echo "For detailed instructions, see README.md"
