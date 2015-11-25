
ns discourse-reader.app.layout
  :require
    [] reagent.core :as r
    [] discourse-reader.util.base :as base
    [] discourse-reader.app.title :refer
      [] title-component
    [] discourse-reader.app.topic :refer
      [] topic-component

def style-layout $ {}
  :font-family base/font-family
  :position |absolute
  :top 0
  :left 0
  :width |100%
  :height |100%
  :display |flex
  :background-color "|hsl(240,90%,90%)"

def style-list $ {}
  :width |40%
  :overflow :auto
  :height |100%
  :padding "|10px"

defn layout-component (app-state)
  [] :div ({} (:style style-layout))
    [] :div ({} (:style style-list))
      for
        [] topic (:topics @app-state)
        [] title-component
          assoc topic :key (:id topic)
    let
        topic-id $ :topic-id @app-state
      if (not= nil topic-id)
        [] topic-component
          get (:topic-details @app-state) (keyword topic-id)
        [] :div |else
