#!/usr/bin/env python3
"""
Math Assistant MCP Server Demo using FastMCP

This server demonstrates basic MCP functionality including:
- Tools for mathematical calculations
- Resources for providing information
- Prompts for math assistance
"""

import math
from typing import List

from fastmcp import FastMCP

# Initialize the MCP server
mcp = FastMCP("Math Assistant MCP Server")

# Tools - Mathematical functions that can be called by the LLM
@mcp.tool()
def add_numbers(a: float, b: float) -> float:
    """Add two numbers together."""
    result = a + b
    return result

@mcp.tool()
def subtract_numbers(a: float, b: float) -> float:
    """Subtract the second number from the first number."""
    return a - b

@mcp.tool()
def multiply_numbers(a: float, b: float) -> float:
    """Multiply two numbers together."""
    return a * b

@mcp.tool()
def divide_numbers(a: float, b: float) -> float:
    """Divide the first number by the second number."""
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b

@mcp.tool()
def power(base: float, exponent: float) -> float:
    """Raise a number to a power."""
    return base ** exponent

@mcp.tool()
def square_root(number: float) -> float:
    """Calculate the square root of a number."""
    if number < 0:
        raise ValueError("Cannot calculate square root of negative number")
    return math.sqrt(number)

@mcp.tool()
def factorial(n: int) -> int:
    """Calculate the factorial of a non-negative integer."""
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    return math.factorial(n)

@mcp.tool()
def calculate_percentage(part: float, whole: float) -> float:
    """Calculate what percentage the part is of the whole."""
    if whole == 0:
        raise ValueError("Cannot calculate percentage when whole is zero")
    return (part / whole) * 100

@mcp.tool()
def calculate_average(numbers: List[float]) -> float:
    """Calculate the average of a list of numbers."""
    if not numbers:
        raise ValueError("Cannot calculate average of empty list")
    return sum(numbers) / len(numbers)

# Resources - Information that can be read by the LLM
@mcp.resource("file://server-info")
def get_server_info() -> str:
    """Information about this Math Assistant MCP server."""
    return """
# Math Assistant MCP Server

This is a mathematical calculation server built with FastMCP.

## Available Tools:
- add_numbers: Add two numbers
- subtract_numbers: Subtract two numbers
- multiply_numbers: Multiply two numbers
- divide_numbers: Divide two numbers
- power: Raise a number to a power
- square_root: Calculate square root
- factorial: Calculate factorial
- calculate_percentage: Calculate percentage
- calculate_average: Calculate average of numbers

## Available Resources:
- file://server-info: This information

## Available Prompts:
- math-helper: Help with mathematical calculations
- calculator: Step-by-step calculation assistance
"""

# Prompts - Reusable interaction templates
@mcp.prompt("math-helper")
def math_helper_prompt(operation: str = "general") -> str:
    """A prompt to help with mathematical calculations."""
    return f"""
You are a helpful math assistant specializing in {operation} calculations.

Please:
1. Ask what numbers they want to work with
2. Use the appropriate math tools available
3. Show the calculation step by step
4. Provide a clear final answer
5. Explain the mathematical concept if helpful

Available math tools:
- add_numbers(a, b): Add two numbers
- subtract_numbers(a, b): Subtract two numbers
- multiply_numbers(a, b): Multiply two numbers
- divide_numbers(a, b): Divide two numbers
- power(base, exponent): Raise to a power
- square_root(number): Calculate square root
- factorial(n): Calculate factorial
- calculate_percentage(part, whole): Calculate percentage
- calculate_average(numbers): Calculate average
"""

@mcp.prompt("calculator")
def calculator_prompt() -> str:
    """A prompt for step-by-step calculation assistance."""
    return """
You are a step-by-step calculator assistant. Help users with mathematical calculations by:

1. Breaking down complex problems into simple steps
2. Using the available math tools for each calculation
3. Showing your work clearly
4. Explaining each step
5. Providing the final answer

Always use the math tools available rather than doing calculations manually.
This ensures accuracy and demonstrates the MCP server capabilities.
"""

if __name__ == "__main__":
    print("Starting Math Assistant MCP Server...")
    print("Server will be available for MCP connections.")
    print("Available tools: add, subtract, multiply, divide, power, square_root, factorial, percentage, average")
    mcp.run()
