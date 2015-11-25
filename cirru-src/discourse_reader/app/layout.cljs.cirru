
ns discourse-reader.app.layout
  :require
    [] reagent.core :as r
    [] discourse-reader.store :as store
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
  :padding "|80px 10px 290px 10px"
  :display |flex
  :flex-direction |column
  :background-image $ str "|url(" |http://react-china.org/uploads/default/38/c4b96a594bd352e0.png "|)"
  :background-size "|310px 80px"
  :background-repeat |no-repeat
  :align-items |center

def style-button $ {}
  :background "|hsl(0, 100%, 100%)"
  :padding 7
  :line-height |20px
  :height |34px
  :flex-shrink 0
  :cursor |pointer
  :width |100px
  :text-align |center

defn layout-component (app-state)
  [] :div ({} (:style style-layout))
    [] :div ({} (:style style-list))
      for
        [] topic (:topics @app-state)
        [] title-component
          assoc topic :key (:id topic)
      [] :div
        {} :style style-button :on-click store/fetch-data
        , "|more"
    let
        topic-id $ :topic-id @app-state
      if (not= nil topic-id)
        [] topic-component
          get (:topic-details @app-state) (keyword topic-id)
        [] :div |
