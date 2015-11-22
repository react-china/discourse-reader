
ns discourse-reader.app.title
  :require
    [] reagent.core :as r
    [] discourse-reader.util.base :as base

def style-title $ {}
  :color |blue
  :font-family base/font-family

defn title-component (topic change-topic)
  [] :div
    {} (:style style-title)
      :on-click $ fn (event)
        println :click
        change-topic $ :id topic
    [] :span (:fancy_title topic)
