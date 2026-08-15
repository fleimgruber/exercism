(ns darts)

(defn score
  "Calculates the score of a dart throw."
  [x y]
  (let [rad (Math/sqrt (+ (* x x) (* y y)))]
    (cond
      (<= rad 1) 10
      (<= rad 5) 5
      (<= rad 10) 1
      :else 0)))
