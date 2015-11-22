
ns discourse-reader.app.layout
  :require
    [] reagent.core :as r
    [] discourse-reader.util.base :as base
    [] discourse-reader.app.title :refer
      [] title-component

def style-layout $ {}
  :color |blue
  :font-family base/font-family

def style-list $ {}
  :backgound-color :red

defn layout-component (app-state)
  let
      topic-id $ atom nil
    fn () $ [] :div ({} (:style style-layout))
      [] :div ({} (:style style-list))
        for
          [] topic (:topics @app-state)
          [] title-component topic
      if (not $ nil? topic-id)
        [] :div |something
