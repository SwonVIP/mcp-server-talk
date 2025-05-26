# MCP Server Talk Presentation

This directory contains the complete reveal.js presentation about Model Context Protocol (MCP).

## Quick Start

### Option 1: Using Node.js
```bash
npm install
npm start
```

### Option 2: Using Python HTTP Server
```bash
python3 -m http.server 8000
```

### Option 3: Using any HTTP server
Serve this directory using any static file server.

## Presentation Content

The presentation covers:
- Introduction to MCP (Model Context Protocol)
- The toolbox analogy for LLMs
- The M×N problem and how MCP solves it
- Core MCP architecture and components
- Server capabilities (Tools, Resources, Prompts)
- Communication flow and implementation details
- Security considerations and best practices
- Example use cases and future roadmap

## File Structure

- `index.html` - Main presentation file
- `deck/` - Image assets and media files
- `lib/` - Reveal.js framework files
- `css/` - Stylesheets
- `js/` - JavaScript files
- `presentation-content.md` - Content planning and speaker notes

## Keyboard Shortcuts

- **Space/Arrow keys**: Navigate slides
- **Esc**: Overview mode
- **S**: Speaker notes view
- **F**: Fullscreen
- **B**: Pause/blackout

## Speaker Notes

Press 'S' during the presentation to view speaker notes in a separate window.

## Build and Development

This presentation uses the reveal.js framework. For development:

```bash
npm install
npm start
```

For production build:

```bash
npm run build
```
