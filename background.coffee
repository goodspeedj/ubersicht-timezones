# this is the shell command that gets executed every time this widget refreshes
command: "echo"

# the refresh frequency in milliseconds
refreshFrequency: 100000

# render gets called after the shell command has executed. The command's output
# is passed in as a string. Whatever it returns will get rendered as HTML.
render: (output) ->

  """
    <div class='grad'>&nbsp;</div>
  """

# the CSS style for this widget, written using Stylus
# (http://learnboost.github.io/stylus/)
style: """
  top: 0%
  left: 81%
  color: #fff
  color: rgba(255,255,255,0.4)
  font-family: Helvetica Neue
  font-size: 11px
  font-weight: 260
  text-align: left
  width: 500px
  height: 100%
  margin-left: -125px
  position: absoloute
  z-index: -1

  .grad {
    background: linear-gradient(to right, rgba(0, 0, 0, 0), 55%, rgba(0,0,0,.9));
    height: 100%
  }
"""
