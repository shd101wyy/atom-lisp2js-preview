var lisp2js = require("lisp2js");
var beautify = require("js-beautify");
var current_$45_texteditor = null;
var lisp2js_$45_texteditor = null;
var lisp2js_$45_compile_$45_fn = function() {
    current_$45_texteditor = atom.workspace.getActiveTextEditor();
    Promise.resolve(atom.workspace.open("./lisp2js_buffer.js", {
        split: "right",
        activatePane: false
    })).then(function(value) {
        lisp2js_$45_texteditor = value;
        return value.setText("// When you save your .lisp file, it will compile to javascript automatically");
    });
    return current_$45_texteditor.onDidSave(function() {
        var compiled = beautify.js_beautify(lisp2js.compile(current_$45_texteditor.getText()));
        return lisp2js_$45_texteditor.setText(compiled);
    });
};
var activate_$45_fn = function() {
    return atom.commands.add("atom-workspace", "lisp2js-compile", lisp2js_$45_compile_$45_fn);
};
module.exports = {
    activate: activate_$45_fn
};