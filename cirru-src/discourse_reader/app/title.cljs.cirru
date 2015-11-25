
ns discourse-reader.app.title
  :require
    [] reagent.core :as r
    [] discourse-reader.util.base :as base
    [] discourse-reader.store :as store

def style-title $ {}
  :font-family base/font-family
  :line-height |2em
  :cursor |pointer
  :font-size 14
  :white-space |nowrap
  :overflow |hidden
  :text-overflow |ellipsis
  :background-color "|hsl(200,20%,100%)"
  :border "|1px solid hsl(200,10%,93%)"
  :margin-bottom 8
  :padding "|0 10px"

defn title-component (topic)
  [] :div
    {} (:style style-title)
      :on-click $ fn (event)
        store/view-topic $ :id topic
    [] :span (:fancy_title topic)
