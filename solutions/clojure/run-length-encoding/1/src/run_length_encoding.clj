(ns run-length-encoding)

(defn encode [encoded token]
  (let [current (encoded :current)
        result (encoded :result)
        count (encoded :count)
        token (str token)]
    (cond
      (= current token) (assoc encoded :count (inc count))
      :else (assoc encoded
                   :result (cond
                             (empty? current) ""
                             :else (str result (if (= count 1) "" count) current))
                   :count 1
                   :current token))))

(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  (let [encoded
        (reduce encode {:result "" :current "" :count 0} plain-text)
        final-count (encoded :count)]
    (str (encoded :result) (if (< final-count 2) "" final-count) (encoded :current))))

(defn decode [decoded token]
  (let [result (decoded :result)
        number (decoded :number)
        token (str token)]
    (cond
      (re-seq #"[0-9]" token) (assoc decoded :number (str number token))
      :else (assoc decoded :result (cond
                                     (= number "") (str result token)
                                     :else (str result (apply str (repeat (Integer. number) token))))
                           :number ""))))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  (let [decoded (reduce decode {:result "" :number ""} cipher-text)]
    (decoded :result)))
