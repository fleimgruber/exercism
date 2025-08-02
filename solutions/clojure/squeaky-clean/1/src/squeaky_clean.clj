(ns squeaky-clean
  (:require [clojure.string :as str]))

(defn clean
  [s]
  (-> s
      (str/replace " " "_")
      (str/replace #"-([\D])" #(.toUpperCase (%1 1)))
      (str/replace #"[α-ω]" "")
      (str/replace #"[\d]" "")
      (str/replace #"[\x00-\x1F\x7F-\x9F]" "CTRL")
      (str/replace #"[\uD83C-\uDBFF\uDC00-\uDFFF]+" "")))
