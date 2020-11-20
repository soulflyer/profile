{:user {:plugins [[jonase/eastwood "0.3.5"]
                  [lein-ancient "0.6.15"]
                  [lein-binplus "0.6.5"]
                  [lein-cloverage "1.1.2"]
                  [lein-kibit "0.1.7"]
                  ;;[lein-midje "3.2.1"]
                  [lein-nvd "1.3.0"]
                  [lein-pprint "1.3.2"]
                  [venantius/yagni "0.1.7"]
                  [com.roomkey/lein-v "7.1.0"]]
        :dependencies [[org.clojure/tools.trace "0.7.10"]]}

 ;; :dev {:dependencies [[cider/piggieback "0.4.2"]]
 ;;       :repl-options {:nrepl-middleware [cider.piggieback/wrap-cljs-repl]}}

 :repl {:plugins [[cider/cider-nrepl "0.25.2"]
                  [refactor-nrepl "2.5.0"]]}}
