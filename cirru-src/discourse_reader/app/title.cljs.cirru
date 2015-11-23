
ns discourse-reader.app.title
  :require
    [] reagent.core :as r
    [] discourse-reader.util.base :as base
    [] discourse-reader.store :as store

def style-title $ {}
  :color |blue
  :font-family base/font-family

defn title-component (topic)
  [] :div
    {} (:style style-title)
      :on-click $ fn (event)
        store/view-topic $ :id topic
    [] :span (:fancy_title topic)
