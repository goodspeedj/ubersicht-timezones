# TODO: Add your location and forecast.io api key below
apiKey   = 'cf7d44289c74902bc97cc63f7b5de856'
location = '43.0718, -70.7626'

exclude  = "alerts,flags"
command: "curl -s 'https://api.forecast.io/forecast/#{apiKey}/#{location}?units=auto&exclude=#{exclude}'"

# Refresh every 60 seconds
refreshFrequency: 300000

render: (o) -> """
  <div class='weather'>
    <div class='icon'></div>
    <div class='temp'></div>
  </div>
"""

update: (output, domEl) ->
  data  = JSON.parse(output)
  $domEl = $(domEl)

  $domEl.find('.temp').html """
    <div class='now'>#{Math.round(data.currently.temperature)}°</div>
    <div class='hilow'>
        <div class='hi'>#{Math.round(data.daily.data[0].temperatureMax)}°</div>
        <div class='lo'>#{Math.round(data.daily.data[0].temperatureMin)}°</div>
    </div>
  """

  $domEl.find('.summary').text "#{data.currently.summary}, #{data.hourly.summary}"
  #$domEl.find('.summary').text "#{data.hourly.summary}"
  #$domEl.find('.summary').text "#{data.currently.summary}, #{data.hourly.summary}"
  $domEl.find('.icon')[0].innerHTML = @getIcon(data.currently)


renderForecast: (data) ->
  """
    <div class='entry'>
      <div class='icon'>#{@getIcon data}</div>
      <div class='temp'>#{Math.round(data.temperatureMax)}°</div>
    </div>
  """

style: """
  top: 2%
  left: 9%
  color: #fff
  color: rgba(255,255,255,0.4)
  font-family: Helvetica Neue
  text-align: left
  width: 400px
  margin-left: -125px

  @font-face
    font-family Weather
    src url(weathernow.widget/icons.svg) format('svg')

  .weather
    display: inline-block
    text-align: left
    position: relative

  .icon
    font-family: Weather
    font-size: 35px
    line-height: 70px
    position: absolute
    left: 0
    top: -15px
    vertical-align: middle

  .temp
    padding-left: 60px

  .summary
    float: clear
    text-align: left
    font-size: 11px
    line-height: 1.0
    left: 0
    color: #fff
    color: rgba(255,255,255,0.4)

  .temp
    font-weight: 200
    font-size: 32px
    vertical-align: middle

    .now
      float: left
      padding-right: 0px

    .hilow
      float: left
      border-left: 2px solid rgba(255, 255, 255, 0.1)
      padding-left: 5px
      margin-left: 5px
      color: #fff
      color: rgba(255,255,255,0.3)


    .hi
      font-size: 14px
      vertical-align: top

    .lo
      font-size: 14px
      vertical-align: bottom

  .forecast .entry
    display: inline-block
    margin-right: 30px
    text-align: center

    div
      margin-top: 5px

    &:last-child
      margin-right: 0;

    .temp
      font-size: 120px
      padding: 0

    .icon
      font-size: 15px
      line-height: 20px
      position: static

"""

iconMapping:
  "rain"                :"&#xf019;"
  "snow"                :"&#xf01b;"
  "fog"                 :"&#xf014;"
  "cloudy"              :"&#xf013;"
  "wind"                :"&#xf021;"
  "clear-day"           :"&#xf00d;"
  "mostly-clear-day"    :"&#xf00c;"
  "partly-cloudy-day"   :"&#xf002;"
  "clear-night"         :"&#xf02e;"
  "partly-cloudy-night" :"&#xf031;"
  "unknown"             :"&#xf03e;"

getIcon: (data) ->
  return @iconMapping['unknown'] unless data
  if data.icon.indexOf('cloudy') > -1
    if data.cloudCover < 0.25
      @iconMapping["clear-day"]
    else if data.cloudCover < 0.5
      @iconMapping["mostly-clear-day"]
    else if data.cloudCover < 0.75
      @iconMapping["partly-cloudy-day"]
    else
      @iconMapping["cloudy"]
  else
    @iconMapping[data.icon]
