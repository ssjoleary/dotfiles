{:user
 {:plugins [
            [jonase/eastwood         "0.3.4" :exclusions [org.clojure/clojure]]
            [lein-ancient            "0.6.15"]
            [lein-bikeshed           "0.5.1"]
            [lein-deps-tree          "0.1.2"]
            [lein-kibit              "0.1.6"]
            [lein-localrepo          "0.5.4"]
            [org.clojure/tools.trace "0.7.10"]
           ;; [venantius/ultra         "0.5.2"]
            [venantius/yagni         "0.1.7"]
            [refactor-nrepl          "2.4.0"]
            [cider/cider-nrepl       "0.19.0"]]
  :dependencies [[criterium "0.4.4"]
                 [nrepl     "0.5.3"]]
  :repl-options {:nrepl-middleware [cider.nrepl/wrap-apropos
                                    cider.nrepl/wrap-classpath
                                    cider.nrepl/wrap-complete
                                    cider.nrepl/wrap-debug
                                    cider.nrepl/wrap-format
                                    cider.nrepl/wrap-info
                                    cider.nrepl/wrap-inspect
                                    cider.nrepl/wrap-macroexpand
                                    cider.nrepl/wrap-ns
                                    cider.nrepl/wrap-spec
                                    cider.nrepl/wrap-profile
                                    cider.nrepl/wrap-refresh
                                    cider.nrepl/wrap-resource
                                    cider.nrepl/wrap-stacktrace
                                    cider.nrepl/wrap-test
                                    cider.nrepl/wrap-trace
                                    cider.nrepl/wrap-out
                                    cider.nrepl/wrap-undef
                                    cider.nrepl/wrap-version]}}}
