import LoadingState;
import flixel.math.FlxMath;

var songIcons = [];
var songs = [["gamebreaker", ["V1", "V2"], true], ["cuckshedder", ["V1", "V2"], true], ["robbery", ["hard"], false]];

var diffText;

var selectedSong = 0;
var curDiff:Int = 0;

function create() {
    FlxG.resizeWindow(1280, 720);
    FlxG.scaleMode.width = 1280;
    FlxG.scaleMode.height = 720;
    FlxG.scaleMode.isWidescreen = false;

    var bg = new FlxSprite(-913, -500).loadGraphic(Paths.image('stages/dx/bg'));
    bg.antialiasing = true;
    add(bg);

    var hill = new FlxSprite(-350, 1).loadGraphic(Paths.image('stages/dx/hills'));
    hill.antialiasing = true;
    hill.scale.set(0.6, 0.6);
    add(hill);

    var trees = new FlxSprite(-913, 134).loadGraphic(Paths.image('stages/dx/trees'));
    trees.antialiasing = true;
    trees.scale.set(0.7, 0.7);
    add(trees);

    var pillar2 = new FlxSprite(-498, -1116).loadGraphic(Paths.image('stages/dx/pillar2'));
    pillar2.antialiasing = true;
    add(pillar2);

    var pillar1 = new FlxSprite(700, -1257).loadGraphic(Paths.image('stages/dx/pillar1'));
    pillar1.antialiasing = true;
    add(pillar1);

    var bar1 = new FlxSprite(0, -135).makeGraphic(FlxG.width, 250, 0xff000000);
    add(bar1);

    var bar2 = new FlxSprite(0, 600).makeGraphic(FlxG.width, 250, 0xff000000);
    add(bar2);

    var iconIndex = -1;

    for (song in songs) {
        iconIndex++;

        var gayBroker;

        if (songs[iconIndex][2] == true)
            gayBroker = new FlxSprite().loadGraphic(Paths.image("songs/" + song[0] + "-" + song[1][0]));
        else 
            gayBroker = new FlxSprite().loadGraphic(Paths.image("songs/" + song[0]));
        if (gayBroker.graphic == null)
            gayBroker.loadGraphic(Paths.image("songs/placeholder"));
        gayBroker.scale.set(0.7, 0.7);
        gayBroker.screenCenter();
        songIcons.push(gayBroker);
        add(gayBroker);
    }

    for (obj in [bg, hill, trees, pillar2, pillar1])
        obj.x += 200;

    diffText = new FlxText(0, -5, FlxG.width, "↑\nNORMAL\n↓", 45);
    diffText.setFormat(Paths.font("vcr.ttf"), 45, 0xFFffffff, "center");
    add(diffText);
}

function update(elapsed) {
    if (controls.LEFT_P)
        changeSong(-1);
    if (controls.RIGHT_P)
        changeSong(1);
    if (controls.UP_P)
        changeDiff(1);
    if (controls.DOWN_P)
        changeDiff(-1);

    if (controls.ACCEPT){
        CoolUtil.loadSong(mod, songs[selectedSong][0], songs[selectedSong][1][curDiff]);
        LoadingState.loadAndSwitchState(new PlayState());
    }

    var iconIndex = -1;

    for (obj in songIcons) {
        iconIndex++;

        obj.visible = iconIndex == selectedSong;
    }
}

function changeSong(amt:Int = 0) {
    selectedSong += amt;

    if (selectedSong >= songs.length)
        selectedSong = 0;
    if (selectedSong < 0)
        selectedSong = songs.length - 1;

    if (curDiff >= songs[selectedSong][1].length)
        curDiff = 0;

    resetDiffText();
    reloadSongImage();

    trace(selectedSong);
}

function changeDiff(amt:Int = 0) {
    curDiff += amt;

    if (curDiff >= songs[selectedSong][1].length)
        curDiff = 0;
    if (curDiff < 0)
        curDiff = songs[selectedSong][1].length - 1;

    resetDiffText();
    reloadSongImage();

    trace(curDiff);
}

function resetDiffText() {
    diffText.text = "↑\n" + songs[selectedSong][1][curDiff].toUpperCase() + "\n↓";

    if (songs[selectedSong][0].toLowerCase() == "cuckshedder") {
        if (curDiff == 0)
            diffText.text = "↑\n09/11/2001\n↓";
        else if (curDiff == 1)
            diffText.text = "↑\n09/08/2022\n↓";
    }
}

function reloadSongImage() {
    songIcons[selectedSong].kill();

    var gayBroker;

    if (songs[selectedSong][2] == true)
        gayBroker = new FlxSprite().loadGraphic(Paths.image("songs/" + songs[selectedSong][0] + "-" + songs[selectedSong][1][curDiff]));
    else 
        gayBroker = new FlxSprite().loadGraphic(Paths.image("songs/" + songs[selectedSong][0]));

    if (gayBroker.graphic == null)
        gayBroker.loadGraphic(Paths.image("songs/placeholder"));
    gayBroker.scale.set(0.7, 0.7);
    gayBroker.screenCenter();
    add(gayBroker);

    songIcons[selectedSong] = gayBroker;
}