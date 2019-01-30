/*
  Simple widget to display local and GMT times
*/

// Dummy command
export const command = "echo";
export const refreshFrequency = 10000;

export const render = ({ output, error }) => {
  const now = new Date();

  const estEdttime = now.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true });
  const gmtIstTime = new Date().toLocaleString("en-US", {timeZone: "Europe/Dublin", hour: 'numeric', minute: 'numeric', hour12: true});

  return error ? (
    <div>{String(error)}</div>
  ) : (
    <div classNameName='timezones'>
      <div classNameName="divTable">
        <div className="divTableBody">
          <div className="divTableRow">
            <div className="divTableCell">Portsmouth</div>
            <div className="divTableCell time">{estEdttime}</div>
          </div>
          <div className="divTableRow">
            <div className="divTableCell">Belfast</div>
            <div className="divTableCell time">{gmtIstTime}</div>
          </div>
        </div>
      </div>
    </div>
  );
}

export const className = `
  left: 98%;
  top: 6%;
  color: #fff;
  color: rgba(255,255,255,0.4);
  font-family: Helvetica Neue;
  font-size: 11px;
  text-align: left;
  font-weight: 260;
  width: 4000px;
  margin-left: -125px;

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
  .time {
    text-align: right
  }
`
