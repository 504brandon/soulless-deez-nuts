//i honestly dont know who made this but i found it in DX.hx

function update(elapsed) {
    var ofs:Int = 10;
    var ofs2:Int = 30;

    if (PlayState.section != null && PlayState.section.mustHitSection) {
        switch(PlayState.boyfriend.animation.curAnim.name) {
            case "singLEFT":
                PlayState.camFollow.x = PlayState.camFollow.x - ofs;
            case "singRIGHT":
                PlayState.camFollow.x = PlayState.camFollow.x + ofs;
            case "singUP":
                PlayState.camFollow.y = PlayState.camFollow.y - ofs;
            case "singDOWN":
                PlayState.camFollow.y = PlayState.camFollow.y + ofs;
        }
    } else {
        switch(PlayState.dad.animation.curAnim.name) {
            case "singLEFT" :
                PlayState.camFollow.x = PlayState.camFollow.x - ofs2;
            case "singRIGHT":
                PlayState.camFollow.x = PlayState.camFollow.x + ofs2;
            case "singUP":
                PlayState.camFollow.y = PlayState.camFollow.y - ofs2;
            case "singDOWN":
                PlayState.camFollow.y = PlayState.camFollow.y + ofs2;
      }
    }
}