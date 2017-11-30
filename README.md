# Design for Success Slides and Examples

This repo contains the slide content (and generation capability) for the talk "Design for Success with [React](https://reactjs.org/) and [Storybook.js](https://storybook.js.org/)".

- [Building Slides](#building-slides)
  - [Quick Start](#quick-start)
  - [Hacking](#hacking)
- [Running example storybook](#running-example-storybook)
  - [View the example storybook](#view-the-example-storybook)

## Building slides

### Quick Start

```bash
npm install
npm run build
open index.html
```

### Hacking

```bash
npm run watch
open storybook-cleaver
```

The slides use [Cleaver](https://github.com/jdan/cleaver) as the mechanism to render the slides (all of which are written in markdown) with a custom theme that produces a [reveal.js](https://github.com/hakimel/reveal.js) presentation.

See [Reveal Cleaver Theme](https://github.com/cjsaylor/reveal-cleaver-theme) for how the reveal.js presentation is rendered.

## Running example storybook

```bash
cd example
npm install
npm run storybook
```

Running the above will start a node server that serves the storybook files and sets up webpack that allows automatic refreshing of changes over websockets.

### View the example storybook

You can view the example storybook [here](https://www.chris-saylor.com/design-for-success-slides/example).