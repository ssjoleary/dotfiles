{:user
 {:plugins [[refactor-nrepl          "2.3.1"]
            [cider/cider-nrepl       "0.16.0"]
            [jonase/eastwood         "0.2.5" :exclusions [org.clojure/clojure]]
            [lein-ancient            "0.6.15"]
            [lein-bikeshed           "0.5.1"]
            [lein-deps-tree          "0.1.2"]
            [lein-kibit              "0.1.6"]
            [lein-localrepo          "0.5.4"]
            [lein-midje              "3.2.1"]
            [org.clojure/tools.trace "0.7.9"]
            [venantius/ultra         "0.5.2"]]
  :dependencies [[criterium "0.4.4"]]
  :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}
