function create() {
    FlxG.switchState(new MainMenuState());
}

function update(elapsed) {
    if (songs[curSelected].songName.toLowerCase() == "cuckshedder") {
        if (curDifficulty == 0)
            diffText.text = "< 09/11/2001 >";
        else
            diffText.text = "< 09/08/2022 >";
    }
}