#!/bin/bash
# Project Setup Script by Anneta Wamono
# Sets up file structure for HTML, JS and SaSS
# Run with ./project-setup.sh filename sass (optional to start Sass --watch)

if [ $1 = "" ]; then
    echo "ERROR: Enter project name"
else
    FILENAME=$1
    mkdir $FILENAME $FILENAME/assets $FILENAME/css $FILENAME/js $FILENAME/js/vendors $FILENAME/stylesheets
    touch $FILENAME/index.html
    touch $FILENAME/js/main.js

    cd $FILENAME/stylesheets
    mkdir modules partials vendors

    echo "//  Modules and variables
    @import 'partials/base';

    //  Partials
    @import 'partials/reset';

    //  Vendors" > main.scss

    cd modules
    echo "@import 'variables';
    @import 'mixins';" > _all.scss
    touch _mixins.scss
    echo "// Fonts

    // Colours

    // Responsiveness" > _variables.scss

    cd ../partials
    echo "@import '../modules/all';" > _base.scss

    echo "
    /* http://meyerweb.com/eric/tools/css/reset/
       v2.0 | 20110126
       License: none (public domain)
    */

    html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
      margin: 0;
      padding: 0;
      border: 0;
      font-size: 100%;
      font: inherit;
      vertical-align: baseline; }

    /* HTML5 display-role reset for older browsers */

    article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {
      display: block; }

    body {
      line-height: 1;
      width: 100%;
      height: 100%;}

    ol, ul {
      list-style: none; }

    blockquote, q {
      quotes: none; }

    blockquote {
      &:before, &:after {
        content: '';
        content: none; } }

    q {
      &:before, &:after {
        content: '';
        content: none; } }

    table {
      border-collapse: collapse;
      border-spacing: 0; }
    " > _reset.scss

    cd ../..
    if [ $2 = "sass" ]; then
      sass --watch stylesheets/main.scss:css/style.css
    fi
fi
