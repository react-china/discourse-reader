
ns discourse-reader.app.title
  :require
    [] reagent.core :as r
    [] discourse-reader.util.base :as base

def style-title $ {}
  :color |blue
  :font-family base/font-family

defn title-component (topic)
  [] :div
    {} (:style style-title)
    [] :span (:fancy_title topic)
