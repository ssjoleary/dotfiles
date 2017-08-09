{:user {:dependencies [[cljfmt  "0.5.1"]]
        :plugins      [[lein-cljfmt      "0.5.7"]
                       [jonase/eastwood  "0.2.4" :exclusions [org.clojure/clojure]]
                       [lein-kibit       "0.1.5"]
                       [lein-bikeshed    "0.4.1"]
                       [venantius/ultra  "0.5.1"]]
        :repl-options {:init (require 'cljfmt.core)}}}
