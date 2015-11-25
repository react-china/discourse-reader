
ns discourse-reader.store
  :require
    [] reagent.core :as r
    [] ajax.core :refer
      [] GET

defonce app-state $ r/atom $ {}
  :topics $ []
  :topic-details $ {}
  :topic-id nil
  :page 0

defn fetch-data ()
  GET
    str |http://react-china.org/latest.json?page=
      str (+ (:page @app-state) 1)
    {}
      :handler $ fn (response)
        swap! app-state update :page inc
        swap! app-state update :topics $ fn (topics)
          concat topics
            :topics $ :topic_list response
      :error-handler $ fn (status status-text)
      :response-format :json
      :keywords? true

defn fetch-topic (topic-id)
  println :fetch-topic topic-id
  GET
    str |http://react-china.org/t/ topic-id |.json
    {}
      :response-format :json
      :keywords? true
      :handler $ fn (response)
        swap! app-state assoc-in
          [] :topic-details (keyword topic-id)
          , response
        swap! app-state assoc :topic-id topic-id

defn view-topic (topic-id)
  if
    not= nil $ get-in app-state
      [] :topic-details (keyword topic-id)
    swap! app-state assoc :topic-id topic-id
    fetch-topic topic-id
