(ns rna-transcription
  (:require [clojure.set :as set]))

(def transcriber {:C \G :G \C :T \A :A \U})

(defn valid? [dna]
  (set/subset? (map #(keyword (str %)) (set dna)) (set (keys transcriber))))

(defn to-rna [dna]
  (when-not (valid? dna)
    (throw (AssertionError. "Wrong input.")))
  (apply str (map #((keyword (str %)) transcriber) dna)))
