# Use Python 3.11 slim image as base
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY simple_mcp_server.py .

# Create a non-root user for security
RUN useradd --create-home --shell /bin/bash mcp && \
    chown -R mcp:mcp /app

# Switch to non-root user
USER mcp

# Expose the port (if needed for future HTTP transport)
EXPOSE 3000

# Set the entrypoint to run the MCP server
ENTRYPOINT ["python", "simple_mcp_server.py"]
