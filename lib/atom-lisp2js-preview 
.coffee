AtomLisp2jsPreview 
View = require './atom-lisp2js-preview 
-view'
{CompositeDisposable} = require 'atom'

module.exports = AtomLisp2jsPreview 
 =
  atomLisp2jsPreview 
View: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @atomLisp2jsPreview 
View = new AtomLisp2jsPreview 
View(state.atomLisp2jsPreview 
ViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @atomLisp2jsPreview 
View.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-lisp2js-preview 
:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomLisp2jsPreview 
View.destroy()

  serialize: ->
    atomLisp2jsPreview 
ViewState: @atomLisp2jsPreview 
View.serialize()

  toggle: ->
    console.log 'AtomLisp2jsPreview 
 was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
