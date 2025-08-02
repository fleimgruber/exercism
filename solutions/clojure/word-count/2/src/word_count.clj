(ns word-count
  (:require [clojure.string :as str]))

(defn word-count [s]
  (->> (str/lower-case s)
       (re-seq #"\w+")
       (frequencies)))
