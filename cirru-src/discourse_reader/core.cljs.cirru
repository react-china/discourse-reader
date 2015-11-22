
ns discourse-reader.core
  :require
    [] reagent.core :as r
    [] discourse-reader.app.layout :refer
      [] layout-component
    [] ajax.core :refer
      [] GET
    [] devtools.core :as devtools

enable-console-print!

devtools/set-pref! :install-sanity-hints true
devtools/install!

defonce app-state $ r/atom $ {}
  :topics $ []
  :page 0

defn mountit ()
  r/render-component
    [] layout-component app-state
    .querySelector js/document |#app

defn fetch-data ()
  GET |http://react-china.org/latest.json
    {}
      :handler $ fn (response)
        swap! app-state assoc :topics
          :topics $ :topic_list response
      :error-handler $ fn (status status-text)
      :response-format :json
      :keywords? true

mountit
fetch-data
