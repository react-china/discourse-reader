
ns discourse-reader.app.layout
  :require
    [] reagent.core :as r
    [] discourse-reader.util.base :as base
    [] discourse-reader.app.title :refer
      [] title-component

def style-layout $ {}
  :color |blue
  :font-family base/font-family
  :position |absolute
  :top 0
  :left 0
  :width |100%
  :height |100%
  :display |flex

def style-list $ {}
  :backgound-color :red
  :width |50%

defn layout-component (app-state)
  let
      topic-id $ r/atom nil
      change-topic $ fn (target-id)
        println :calling target-id
        reset! topic-id target-id
    fn () $ [] :div ({} (:style style-layout))
      [] :div ({} (:style style-list))
        for
          [] topic (:topics @app-state)
          [] title-component
            assoc topic :key (:id topic)
            , change-topic
      if (not= @topic-id nil)
        [] :div $ str @topic-id
        [] :div
