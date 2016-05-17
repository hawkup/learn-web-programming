(set-env!
  :source-paths #{"src/cljs"}
  :resource-paths #{"html"}

  :dependencies '[[adzerk/boot-cljs "1.7.170-3"]
                  [pandeiro/boot-http "0.7.3"] ;; add http dependency
                  [adzerk/boot-reload "0.4.2"]]) ;; add boot-reload

(require '[adzerk.boot-cljs :refer [cljs]]
         '[pandeiro.boot-http :refer [serve]] ;; make serve task visible
         '[adzerk.boot-reload :refer [reload]]) ;; make reload visible

;; define dev task as composition of subtasks
(deftask dev
  "Launch Immediate Feedback Development Environment"
  []
  (comp
    (serve :dir "target")
    (watch)
    (reload)
    (cljs)
    (target :dir #{"target"})))
