{:user
 {:plugins [
            [jonase/eastwood         "0.3.5" :exclusions [org.clojure/clojure]]
            [lein-ancient            "0.6.15"]
            [lein-bikeshed           "0.5.2"]
            [lein-deps-tree          "0.1.2"]
            [lein-kibit              "0.1.6"]
            [lein-localrepo          "0.5.4"]
            [org.clojure/tools.trace "0.7.10"]
            [venantius/ultra         "0.6.0"]
            [venantius/yagni         "0.1.7"]
            [refactor-nrepl          "2.4.0"]
            [cider/cider-nrepl       "0.21.1"]]
  :dependencies [[criterium "0.4.5"]
                 [nrepl     "0.6.0"]]}
 :original {:env {:redshift-endpoint "main-cluster.czbkyyrppxdz.eu-west-1.redshift.amazonaws.com"
                  :redshift-user     "root"
                  :redshift-password "6RqhBHcPvewHboKm29Yo"
                  :redshift-db       "footfall"}}}
