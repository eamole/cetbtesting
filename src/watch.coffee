###
  we have a digital watch with 2 buttons (inputs) - SET and MODE.
  the watch has two display modes TIME and ALT (altitude) - toggled by MODE button
  The SET button changes the mode from TIME to SET/HRS.
  SET again increments the current hour
  MODE shifts to SET/MINS.
  SET again increments the current minutes
  MODE moves back to TIME
  SET in ALT mode does nothing

  We note that there are 2 inputs - SET and MODE
  (note there is always 1 more input, the current state itself - in this case the current time)

  We note that there are 4 Modes TIME, AKT, SET.HRS and SET.MINS.
  We must model (State Transition Diagram, State Table) the effect of either input on each possible mode

  The nicest way to model this problem is to have an object for the wtach, and 3 objects for the current state

###

# this is the controller
class Watch
  @mode : TimeMode  # default mode on start up - this doesn't execute

  # default time - the watch would have a timer to auto update this "tick"
  @hrs : 0
  @mins : 0

  # the send the set button to the current mode
  @setButton : ->
    @mode.setButton()

  # send the set button to the current mode
  @modeButton : ->
    @mode.modeButton()


## displays the time
class TimeMode
  @modeButton : ->
    Watch.mode = AltMode
  @setButton : ->
    Watch.mode = HrsMode

# displays altitude
class AltMode
  @modeButton : ->
    Watch.mode = TimeMode
  @setButton : ->
    # nothing happens
    # Watch.mode = AltMode

# sets the hours
class HrsMode
  @modeButton : ->
    Watch.mode = MinsMode
  @setButton : ->
    Watch.hrs++ # increment the hours

# sets the minutes
class MinsMode
  @modeButton : ->
    Watch.mode = TimeMode
  @setButton : ->
    Watch.mins++ # increment the hours

## the initial state of watch
Watch.mode = TimeMode

module.exports = {Watch,TimeMode,AltMode,HrsMode,MinsMode}