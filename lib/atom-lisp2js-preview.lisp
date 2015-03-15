(def lisp2js (require "lisp2js"))
(def beautify (require "js-beautify"))
(def current-texteditor null)
(def lisp2js-texteditor null)
(def lisp2js-compile-fn ()
    (= current-texteditor (atom.workspace.getActiveTextEditor))
    ;; lisp2js texteditor
    (-> Promise (.resolve (atom.workspace.open "./lisp2js_buffer.js"
                                               :split "right"
                                               :activatePane false))
                (.then (fn (value)
                            (= lisp2js-texteditor value)
                            (value.setText "// When you save your .lisp file, it will compile to javascript automatically"))))
    (current-texteditor.onDidSave (fn ()
                                    ;(console.log "Saved")
                                    (def compiled (beautify.js_beautify (lisp2js.compile (current-texteditor.getText))))
                                    (lisp2js-texteditor.setText compiled)
                                    )))
(def activate-fn ()
    (atom.commands.add "atom-workspace" "lisp2js-compile" lisp2js-compile-fn))

(= module.exports
    {:activate activate-fn
        })
