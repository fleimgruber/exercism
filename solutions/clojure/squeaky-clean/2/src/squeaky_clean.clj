(ns squeaky-clean
  (:require [clojure.string :as str]))

(defn blank-to-underscore [s]
  (str/replace s #"\s" "_"))

(defn kebab-case-to-camel-case [s]
  (str/replace s #"-([\D])" #(str/upper-case (%1 1))))

(defn greek-letters [s]
  (str/replace s #"[α-ω]" ""))

(defn control-characters [s]
  (str/replace s #"\p{Cc}" "CTRL"))

(defn letters-and-underscores-only [s]
  (str/replace s #"[^\p{L}_]" ""))

(defn clean
  [s]
  (-> s
      blank-to-underscore
      kebab-case-to-camel-case
      greek-letters
      control-characters
      letters-and-underscores-only))
