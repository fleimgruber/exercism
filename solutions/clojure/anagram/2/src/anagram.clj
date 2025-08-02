(ns anagram
  (:require [clojure.string :as str]))

(defn -valid-word [w]
  (or (= w (str/lower-case w))
      (= w (str/capitalize w))))

(defn -true-anagram [word candidate]
  (when-not (= word candidate)
    (and
     (-valid-word word)
     (= (sort (str/lower-case word))
        (sort (str/lower-case candidate))))))

(defn anagrams-for [word prospect-list]
  (filter #(-true-anagram word %) prospect-list))
