(ns run-length-encoding
  (:require [clojure.string :as str]))

(defn compress [characters]
  (let [char-count (count characters)]
    (str (if (> char-count 1) char-count "") (first characters))))

(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  (->> plain-text
       (partition-by identity)
       (map compress)
       (apply str)))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  (str/replace cipher-text
               #"(\d+)(\D)"
               (fn [[_ c l]] (apply str (repeat (read-string c) l)))))
