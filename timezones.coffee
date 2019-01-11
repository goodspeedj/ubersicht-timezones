#moment = require('moment')

# this is the shell command that gets executed every time this widget refreshes
command: "echo"

# the refresh frequency in milliseconds
refreshFrequency: 1000

# render gets called after the shell command has executed. The command's output
# is passed in as a string. Whatever it returns will get rendered as HTML.
render: (output) ->
  now = new Date()
  estEdttime = now.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true })

  gmtIstTime = new Date().toLocaleString("en-US", {timeZone: "Europe/Dublin"});
  gmtIstTime = new Date(gmtIstTime);
  gmtIstTime = gmtIstTime.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true })

  """
    <div class='timezones'>
    <div class="divTable">
      <div class="divTableBody">
        <div class="divTableRow">
            <div class="divTableCell">Portsmouth</div>
            <div class="divTableCell">#{estEdttime}</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">Dublin</div>
            <div class="divTableCell">#{gmtIstTime}</div>
        </div>
      </div>
    </div>
  """

# the CSS style for this widget, written using Stylus
# (http://learnboost.github.io/stylus/)
style: """
  top: 6%
  left: 9%
  color: #fff
  color: rgba(255,255,255,0.4)
  font-family: Helvetica Neue
  font-size: 11px
  text-align: left
  width: 160px
  margin-left: -125px

  .divTable{
  	display: table;
  	width: 100%;
  }
  .divTableRow {
  	display: table-row;
  }
  .divTableHeading {
  	background-color: #EEE;
  	display: table-header-group;
  }
  .divTableCell, .divTableHead {
  	display: table-cell;
  	padding: 3px 10px;
  }
  .divTableHeading {
  	background-color: #EEE;
  	display: table-header-group;
  	font-weight: bold;
  }
  .divTableFoot {
  	background-color: #EEE;
  	display: table-footer-group;
  	font-weight: bold;
  }
  .divTableBody {
  	display: table-row-group;
  }
"""
