(ns interest-is-interesting)

(defn interest-rate
  "TODO: add docstring"
  [balance]
  (double (condp <= balance
    5000 2.475
    1000 1.621
    0 0.5
    -3.213)))

(defn abs
  "Absolute value (for clojure <= 1.11)"
  [n] (max n (- n)))

(defn annual-balance-update
  "TODO: add docstring"
  [balance]
  (* balance
     (+ 1 (abs (bigdec (/ (interest-rate balance) 100))))))

(defn amount-to-donate
  "TODO: add docstring"
  [balance tax-free-percentage]
  (if (> balance 0.0M)
    (int (* balance 2 (/ tax-free-percentage 100)))
    0))
