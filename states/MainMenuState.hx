import Highscore;
import LoadingState;
import dev_toolbox.ToolboxMain;
import flixel.math.FlxMath;

var songIcons = [];

var songs = [
	["gamebreaker", ["V1", "SENPAIMIX", "V2", "silly"], true],
	["cuckshedder", ["V1", "V2"], true],
	["robbery", ["hard"], false],
	["milk", ["hard"], false],
	["icecube", ["hard"], false],
	["crimson", ["hard"], false],
	["subterfuge", ["hard"], false],
	["maleaddiction", ["hard"], false]
];

var bg;
var songText;
var diffText;
var selectedSong = 0;
var curDiff:Int = 0;
var debugMode = true;

function create() {
	if (FlxG.save.data.breakerOptions == null)
		FlxG.switchState(new ModState("BreakerOptions", mod));

	if (FlxG.save.data.gayMode == true) {
		for (song in 0...songs.length)
			songs[song][1].push("gay");
	}

	if (debugMode)
		songs[0][1].push("V2old");

	FlxG.resizeWindow(1280, 720);
	FlxG.scaleMode.width = 1280;
	FlxG.scaleMode.height = 720;
	FlxG.scaleMode.isWidescreen = false;

	bg = new FlxSprite().loadGraphic(Paths.image("menu/main/stages/" + songs[selectedSong][0].toLowerCase() + "BG"));
	bg.screenCenter();
	add(bg);

	var iconIndex = -1;

	for (song in songs) {
		iconIndex++;

		var gayBroker;

		if (songs[iconIndex][2] == true)
			gayBroker = new FlxSprite().loadGraphic(Paths.image("menu/main/songs/" + song[0] + "-" + song[1][0]));
		else
			gayBroker = new FlxSprite().loadGraphic(Paths.image("menu/main/songs/" + song[0]));
		if (gayBroker.graphic == null)
			gayBroker.loadGraphic(Paths.image("menu/main/songs/placeholder"));
		gayBroker.scale.set(0.7, 0.7);
		gayBroker.screenCenter();
		songIcons.push(gayBroker);
		add(gayBroker);
	}

	songText = new FlxText(0, FlxG.height * 0.88, FlxG.width, "", 45);
	songText.setFormat(Paths.font("vcr.ttf"), 45, 0xFFffffff, "center");
	add(songText);

	diffText = new FlxText(0, -5, FlxG.width, "", 45);
	diffText.setFormat(Paths.font("vcr.ttf"), 45, 0xFFffffff, "center");
	add(diffText);

	changeSong(0);
	changeDiff(0);
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

	if (controls.ACCEPT) {
		if (songs[selectedSong][0] == "milk") {
			var videoSprite:FlxSprite = MP4Video.playMP4(Assets.getPath(Paths.video('fridge')), function() {
				FlxG.switchState(new ModState("SunkiFridge", mod));
			}, false, FlxG.width, FlxG.height);
			videoSprite.scrollFactor.set();
			add(videoSprite);
		} else {
			CoolUtil.loadSong(mod, songs[selectedSong][0], songs[selectedSong][1][curDiff]);
			LoadingState.loadAndSwitchState(new PlayState());
		}
	}

	if (controls.BACK)
		FlxG.switchState(new ModState("BreakerTitle", mod));

	if (FlxG.keys.justPressed.SEVEN)
		FlxG.switchState(new ToolboxMain());

	if (FlxG.keys.justPressed.F1)
		FlxG.switchState(new ModState("BreakerOptions", mod));

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

	songText.text = "< "
		+ songs[selectedSong][0].toUpperCase()
			+ " | "
			+ Highscore.getModScore(mod, songs[selectedSong][0], songs[selectedSong][1][curDiff])
			+ " >";

	bg.loadGraphic(Paths.image("menu/main/stages/" + songs[selectedSong][0].toLowerCase() + "BG"));
	bg.screenCenter();

	var ost = Paths.modInst(songs[selectedSong][0], mod, "");
	if (ost != null) {
		FlxG.sound.playMusic(ost);
	}
}

function changeDiff(amt:Int = 0) {
	curDiff += amt;

	if (curDiff >= songs[selectedSong][1].length)
		curDiff = 0;
	if (curDiff < 0)
		curDiff = songs[selectedSong][1].length - 1;

	resetDiffText();
	reloadSongImage();
}

function resetDiffText() {
	diffText.text = "↑\n" + songs[selectedSong][1][curDiff].toUpperCase() + "\n↓";

	if (songs[selectedSong][0].toLowerCase() == "cuckshedder") {
		if (curDiff == 0)
			diffText.text = "↑\n09/11/2001\n↓";
		else if (curDiff == 1)
			diffText.text = "↑\n09/08/2022\n↓";
	}

	songText.text = "< "
		+ songs[selectedSong][0].toUpperCase()
			+ " | "
			+ Highscore.getModScore(mod, songs[selectedSong][0], songs[selectedSong][1][curDiff])
			+ " >";
}

function reloadSongImage() {
	songIcons[selectedSong].kill();

	var gayBroker;

	if (songs[selectedSong][2] == true)
		gayBroker = new FlxSprite().loadGraphic(Paths.image("menu/main/songs/" + songs[selectedSong][0] + "-" + songs[selectedSong][1][curDiff]));
	else
		gayBroker = new FlxSprite().loadGraphic(Paths.image("menu/main/songs/" + songs[selectedSong][0]));

	if (gayBroker.graphic == null)
		gayBroker.loadGraphic(Paths.image("menu/main/songs/placeholder"));
	gayBroker.scale.set(0.7, 0.7);
	gayBroker.screenCenter();
	add(gayBroker);

	songIcons[selectedSong] = gayBroker;
}
