
## Discourse Reader

Simple Discourse reader based on Reagent.

Demo http://reader.react-china.org/

Safari does not support Flexbox well, visit with Chrome!

### Clojure code?

Generate code from Sepal.clj by running:

```bash
lein cirru-sepal
```

### Development

Start hot reloading:

```bash
rlwrap lein figwheel
```

Build code:

```bash
lein clean
lein cljsbuild once prod
```

### License

Copyright © 2015 jiyinyiyong

Distributed under the Eclipse Public License either version 1.0 or (at
your option) any later version.
