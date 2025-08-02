(ns rna-transcription
  (:require [clojure.set :as set]))

(def transcriber {\C \G \G \C \T \A \A \U})

(defn valid? [dna]
  (set/subset? (set dna) (set (keys transcriber))))

(defn to-rna [dna]
  (assert (valid? dna) "Nucleotides must be one of A, C, G or T")
  (apply str (map #(get transcriber %) dna)))
