
ns discourse-reader.core
  :require
    [] reagent.core :as r
    [] discourse-reader.app.layout :refer
      [] layout-component
    [] devtools.core :as devtools
    [] discourse-reader.store :as store

enable-console-print!

devtools/set-pref! :install-sanity-hints true
devtools/install!

defn mountit ()
  r/render-component
    [] layout-component store/app-state
    .querySelector js/document |#app

mountit
store/fetch-data
