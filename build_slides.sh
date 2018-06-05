#!/usr/bin/env bash

mkdir -p docs/slides/node_modules
mkdir docs/slides/assets
./node_modules/.bin/cleaver storybook.md --output docs/slides/index.html

mkdir -p docs/slides/node_modules/reveal.js/js && cp ./node_modules/reveal.js/js/reveal.js docs/slides/node_modules/reveal.js/js/
mkdir -p docs/slides/node_modules/prismjs && cp ./node_modules/prismjs/prism.js docs/slides/node_modules/prismjs/
mkdir -p docs/slides/node_modules/prismjs/components && cp ./node_modules/prismjs/components/prism-jsx.js docs/slides/node_modules/prismjs/components/
mkdir -p docs/slides/node_modules/reveal.js/css && cp ./node_modules/reveal.js/css/reveal.css docs/slides/node_modules/reveal.js/css/
mkdir -p docs/slides/node_modules/reveal.js/css/theme && cp ./node_modules/reveal.js/css/theme/white.css docs/slides/node_modules/reveal.js/css/theme/
mkdir -p docs/slides/node_modules/prismjs/themes && cp ./node_modules/prismjs/themes/prism.css docs/slides/node_modules/prismjs/themes/
mkdir -p docs/slides/node_modules/reveal.js/lib/font/source-sans-pro && cp ./node_modules/reveal.js/lib/font/source-sans-pro/source-sans-pro.css docs/slides/node_modules/reveal.js/lib/font/source-sans-pro/
mkdir -p docs/slides/node_modules/reveal.js/css/print && cp ./node_modules/reveal.js/css/print/paper.css docs/slides/node_modules/reveal.js/css/print/
mkdir -p docs/slides/node_modules/reveal.js/lib/font/source-sans-pro && cp ./node_modules/reveal.js/lib/font/source-sans-pro/source-sans-pro-italic.woff docs/slides/node_modules/reveal.js/lib/font/source-sans-pro/
mkdir -p docs/slides/node_modules/reveal.js/lib/font/source-sans-pro && cp ./node_modules/reveal.js/lib/font/source-sans-pro/source-sans-pro-regular.woff docs/slides/node_modules/reveal.js/lib/font/source-sans-pro/
mkdir -p docs/slides/node_modules/reveal.js/lib/font/source-sans-pro && cp ./node_modules/reveal.js/lib/font/source-sans-pro/source-sans-pro-semibold.woff docs/slides/node_modules/reveal.js/lib/font/source-sans-pro/
cp -R assets/ docs/slides/assets/
cp storybook.css docs/slides/