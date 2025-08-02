(ns anagram
  (:require [clojure.string :as str]))

(defn- anagram-of [word]
  (let [w (str/lower-case word)
        ws (sort w)]
    (fn [candidate]
      (let [c (str/lower-case candidate)]
        (and (not= w c) (= ws (sort c)))))))

(defn anagrams-for [word prospects]
  (filter (anagram-of word) prospects))
