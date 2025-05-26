# MCP Server Talk Repository

This repository contains a presentation about Model Context Protocol (MCP) and demo materials.

## Repository Structure

```
├── presentation/            # Complete reveal.js presentation
│   ├── index.html          # Main presentation file
│   ├── deck/              # Presentation assets (images)
│   ├── lib/               # Reveal.js dependencies
│   ├── css/               # Stylesheets
│   ├── js/                # JavaScript files
│   ├── package.json       # Node.js dependencies
│   ├── gulpfile.js        # Build configuration
│   └── presentation-content.md # Content planning document
├── demo/                   # Demo materials (empty, ready for future content)
└── README.md              # This file
```

## Running the Presentation

### Option 1: Using Node.js (if npm is available)
```bash
cd presentation
npm install
npm start
```

### Option 2: Using Python HTTP Server
```bash
cd presentation
python3 -m http.server 8000
```

Then open your browser and navigate to `http://localhost:8000`

### Option 3: Using any other HTTP server
Any static file server can be used to serve the presentation from the `presentation/` directory.

## About the Presentation

The presentation covers:
- Model Context Protocol (MCP) fundamentals
- MCP architecture and components
- Security considerations
- Implementation examples
- Best practices

## Original reveal.js Framework

reveal.js is an open source HTML presentation framework. It enables anyone with a web browser to create beautiful presentations for free. Check out the live demo at [revealjs.com](https://revealjs.com/).

The framework comes with a powerful feature set including [nested slides](https://revealjs.com/vertical-slides/), [Markdown support](https://revealjs.com/markdown/), [Auto-Animate](https://revealjs.com/auto-animate/), [PDF export](https://revealjs.com/pdf-export/), [speaker notes](https://revealjs.com/speaker-view/), [LaTeX typesetting](https://revealjs.com/math/), [syntax highlighted code](https://revealjs.com/code/) and an [extensive API](https://revealjs.com/api/).

---

Want to create reveal.js presentation in a graphical editor? Try <https://slides.com>. It's made by the same people behind reveal.js.

---

### Getting started
- 🚀 [Install reveal.js](https://revealjs.com/installation)
- 👀 [View the demo presentation](https://revealjs.com/demo)
- 📖 [Read the documentation](https://revealjs.com/markup/)
- 🖌 [Try the visual editor for reveal.js at Slides.com](https://slides.com/)
- 🎬 [Watch the reveal.js video course (paid)](https://revealjs.com/course)

---
<div align="center">
  MIT licensed | Copyright © 2011-2024 Hakim El Hattab, https://hakim.se
</div>
