assert = require("chai").assert

Watch= require("../src/watch").Watch
TimeMode= require("../src/watch").TimeMode
AltMode= require("../src/watch").AltMode
HrsMode= require("../src/watch").HrsMode
MinsMode = require("../src/watch").MinsMode

debugger
watch = Watch
watch.modeButton()

describe "Watch", ->
  describe "Test BOTH Inputs in All States" , ->
    describe "Mode = TIME - test both inputs SET and MODE " , ->
      Watch.mode = TimeMode # ensure correct mode
      it "TIME <- [MODE] : should be ALT" , ->
        assert Watch.modeButton() , AltMode

      Watch.mode = TimeMode # reset to correct mode
      it "TIME <- [SET] : should be HRS" , ->
        assert Watch.setButton() , HrsMode

    describe "Mode = ALT - test both inputs SET and MODE " , ->
      Watch.mode = AltMode # ensure correct mode
      it "ALT <- [MODE] : should be TIME" , ->
        assert Watch.modeButton() , TimeMode

      Watch.mode = AltMode # reset to correct mode
      it "ALT <- [SET] : should be ALT - No action" , ->
        assert Watch.setButton() , AltMode

    describe "Mode = HRS - test both inputs SET and MODE " , ->
      Watch.mode = HrsMode # ensure correct mode
      it "HRS <- [MODE] : should be MINS" , ->
        assert Watch.modeButton() , MinsMode

      Watch.mode = HrsMode # reset to correct mode
      it "HRS <- [SET] : should be HRS - No change state" , ->
        assert Watch.setButton() , HrsMode
      it "HRS <- [SET] : change Watch.hours should be 1" , ->
        assert Watch.hrs , 1

    describe "Mode = MINS - test both inputs SET and MODE " , ->
      Watch.mode = MinsMode # ensure correct mode
      it "MINS <- [MODE] : should be TIME" , ->
        assert Watch.modeButton() , TimeMode

      Watch.mode = MinsMode # reset to correct mode
      it "MINS <- [SET] : should be MINS - No change state" , ->
        assert Watch.setButton() , MinsMode
      it "MINS <- [SET] : change Watch.Mins should be 1" , ->
        assert Watch.mins , 1

