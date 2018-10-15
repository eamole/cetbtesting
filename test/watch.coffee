assert = require("chai").assert

{Watch ,TimeMode, AltMode, HrsMode, MinsMode} = require("../src/watch")


describe "Watch", ->
  describe "Test BOTH Inputs in All States" , ->
    describe "Mode = TIME - test both inputs SET and MODE " , ->
      it "should be ALT : TIME <- [MODE] => ALT " , ->
        Watch.mode = TimeMode # ensure correct mode
        Watch.modeButton()
        assert.equal Watch.mode , AltMode

      it "TIME <- [SET] : should be HRS" , ->
        Watch.mode = TimeMode # reset to correct mode
        assert.equal Watch.setButton() , HrsMode

    describe "Mode = ALT - test both inputs SET and MODE " , ->
      it "should be TIME : ALT <- [MODE]" , ->
        Watch.mode = AltMode # ensure correct mode
        assert.equal Watch.modeButton() , TimeMode

      it "should be ALT - No action : ALT <- [SET]" , ->
        Watch.mode = AltMode # reset to correct mode
        mode = AltMode
        assert.equal Watch.setButton() , mode
        ##

    describe "Mode = HRS - test both inputs SET and MODE " , ->
      it "should be MINS : HRS <- [MODE]" , ->
        Watch.mode = HrsMode # ensure correct mode
        assert.equal Watch.modeButton() , MinsMode

      it "should be HRS - No change state HRS <- [SET]" , ->
        Watch.mode = HrsMode # reset to correct mode
        assert.equal Watch.setButton() , HrsMode
      it "should change Watch.hours to 1 : HRS <- [SET], time = 00:00" , ->
        assert.equal Watch.hrs , 1
      it "change Watch.hours should be 2 : HRS <- [SET], time = 01:00 " , ->
        Watch.setButton()     # call it again
        assert.equal Watch.hrs , 2

    describe "Mode = MINS - test both inputs SET and MODE " , ->
      it "should be TIME : MINS <- [MODE]" , ->
        Watch.mode = MinsMode # ensure correct mode
        assert.equal Watch.modeButton() , TimeMode

      it "should be MINS - No change state : MINS <- [SET] : " , ->
        Watch.mode = MinsMode # reset to correct mode
        assert.equal Watch.setButton() , MinsMode
      it "should change Watch.to 1 : MINS <- [SET], time=02:00" , ->
        assert.equal Watch.mins , 1
      it "change Watch.Mins should be 2 : MINS <- [SET], time=02:01" , ->
        Watch.setButton() # call it again
        assert.equal Watch.mins , 2

