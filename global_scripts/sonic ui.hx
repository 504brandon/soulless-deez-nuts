EngineSettings.maxRatingsAllowed = 0;
EngineSettings.showTimer = false;

import flixel.util.FlxTimer;
import flixel.util.FlxStringUtil;

import StringTools;

var ScoreTxtAlt;
var TimeTxtAlt;
var MissTxtAlt;
var HealthText;

var MissTxtAltr;
var executedTimer = false;

var sonicUISongs = ["gamebreaker"];
var lifeCounterGraphic;
var centeredHealthText = true;

function create() {
	trace(StringTools.replace(boyfriend.curCharacter, mod + ":", ""));

	switch (StringTools.replace(boyfriend.curCharacter, mod + ":", "")) {
		case "picodx", "picodx-old":
			lifeCounterGraphic = Paths.image("sonicUI/pico");
			centeredHealthText = false;
		default:
			lifeCounterGraphic = Paths.image("sonicUI/default");
	}
}

if (sonicUISongs.contains(PlayState.jsonSongName.toLowerCase())) {
	function createPost() {
		for (i in 0...4)
			cpuStrums.members[i].visible = false;

		for (obj in [scoreText, healthBarBG, healthBar, iconP1, iconP2])
			obj.kill();

		var ScoreTxtAltr = new FlxText(30, 10, FlxG.width, "SCORE", 55);
		ScoreTxtAltr.setFormat(Paths.font('HUD', 'tff'), 55, 0xFFFFFF05, null, scoreText.borderStyle, 0xFF0f0f0f);
		ScoreTxtAltr.cameras = [camHUD];
		ScoreTxtAltr.borderSize = 3;
		add(ScoreTxtAltr);

		var TimeTxtAltr = new FlxText(30, ScoreTxtAltr.y + 50, FlxG.width, "TIME", 55);
		TimeTxtAltr.setFormat(Paths.font('HUD', 'tff'), 55, 0xFFFFFF05, null, scoreText.borderStyle, 0xFF0f0f0f);
		TimeTxtAltr.borderSize = 3;
		TimeTxtAltr.cameras = [camHUD];
		add(TimeTxtAltr);

		MissTxtAltr = new FlxText(30, TimeTxtAltr.y + 50, FlxG.width, "MISSES", 55);
		MissTxtAltr.setFormat(Paths.font('HUD', 'tff'), 55, 0xFFFFFF05, null, scoreText.borderStyle, 0xFF0f0f0f);
		MissTxtAltr.borderSize = 3;
		MissTxtAltr.cameras = [camHUD];
		add(MissTxtAltr);

		ScoreTxtAlt = new FlxText(ScoreTxtAltr.x + 250, ScoreTxtAltr.y, FlxG.width, "0", 55);
		ScoreTxtAlt.setFormat(Paths.font('HUD', 'tff'), 55, 0xFFf2f2f2, null, scoreText.borderStyle, 0xFF0f0f0f);
		ScoreTxtAlt.borderSize = 3;
		ScoreTxtAlt.cameras = [camHUD];
		add(ScoreTxtAlt);

		MissTxtAlt = new FlxText(MissTxtAltr.x + 210, MissTxtAltr.y, FlxG.width, "0", 55);
		MissTxtAlt.setFormat(Paths.font('HUD', 'tff'), 55, 0xFFf2f2f2, null, scoreText.borderStyle, 0xFF0f0f0f);
		MissTxtAlt.borderSize = 3;
		MissTxtAlt.cameras = [camHUD];
		add(MissTxtAlt);

		TimeTxtAlt = new FlxText(TimeTxtAltr.x + 190, TimeTxtAltr.y, FlxG.width, "0:00", 55);
		TimeTxtAlt.setFormat(Paths.font('HUD', 'tff'), 55, 0xFFf2f2f2, null, scoreText.borderStyle, 0xFF0f0f0f);
		TimeTxtAlt.borderSize = 3;
		TimeTxtAlt.cameras = [camHUD];
		add(TimeTxtAlt);

		var lifeCounter = new FlxSprite(5, FlxG.height * 0.85).loadGraphic(lifeCounterGraphic);
		lifeCounter.cameras = [camHUD];
		add(lifeCounter);

		HealthText = new FlxText(lifeCounter.x + 140, lifeCounter.y + 45, FlxG.width, "0%", 45);
		if (centeredHealthText)
			HealthText.y -= 15;
		HealthText.setFormat(Paths.font('HUD', 'tff'), 45, 0xFFf2f2f2, null, scoreText.borderStyle, 0xFF0f0f0f);
		HealthText.cameras = [camHUD];
		HealthText.borderSize = 3;
		add(HealthText);
	}

	var time;

	function update(elapsed){
		if (FlxStringUtil.formatTime(((inst.length) / 1000) - (Conductor.songPosition - ((inst.length) / 1000)) / 1000) < FlxStringUtil.formatTime(((inst.length) / 1000)))
			time = FlxStringUtil.formatTime(((inst.length) / 1000) - (Conductor.songPosition - ((inst.length) / 1000)) / 1000);
		else
			time = FlxStringUtil.formatTime(((inst.length) / 1000));

		ScoreTxtAlt.text = songScore;
		TimeTxtAlt.text = time;
		MissTxtAlt.text = misses;
		HealthText.text = Std.int(health * 50) + "%";

		if (misses > 0 && !executedTimer)
			textBlinkey();
	}
}

var red = false;

function textBlinkey(){
	executedTimer = true;

	red = !red;

	if (red)
		new FlxTimer().start(0.7, function(time){MissTxtAltr.color = 0xFFff0015; textBlinkey();});
	else
		new FlxTimer().start(0.7, function(time){MissTxtAltr.color = 0xFFFFFF05; textBlinkey();});
}