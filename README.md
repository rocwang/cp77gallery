# Cyberpunk 2077 Gallery

A simple gallery of Cyberpunk 2077, built with Vue.js 3.

[Live site][live site]

## Credit

* images: [Cyberpunk 2077 official website][cp77]
* font: [gilescope/cyberpunkfonts][font]

## Project setup

### Regenerate the images (require ImageMagick)

Download [the image archive][all goodies] from the official website.
Extract it to the `all_goodies` folder under the project root.

Run the command below. The generated images will be put under
`./public/all_goodies/`

```
./generate-webp.sh
```

### Install dependencies

```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference][vuecli].

[live site]: https://cp77.kiwiberry.nz/
[cp77]: https://www.cyberpunk.net/nz/en/
[font]: https://github.com/gilescope/cyberpunkfonts
[vuecli]: https://cli.vuejs.org/config/
[all goodies]: https://cdn-l-cyberpunk.cdprojektred.com/goodies/all_goodies.zip
