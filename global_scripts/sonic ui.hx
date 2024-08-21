import flixel.text.FlxTextBorderStyle;
import flixel.math.FlxPoint;
import flixel.util.FlxStringUtil;
import flixel.FlxCamera;
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
var sonicHUD;

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
		EngineSettings.maxRatingsAllowed = 0;
		EngineSettings.showTimer = false;

		for (i in 0...4)
			cpuStrums.members[i].visible = false;

		for (obj in [scoreText, healthBarBG, healthBar, iconP1, iconP2])
			obj.kill();

		sonicHUD = new FlxCamera(0, 0, 1280, 960, 1);
		sonicHUD.bgColor = new FlxColor(0x00000000);
		FlxG.cameras.add(sonicHUD, true);

		var ScoreTxtAltr = new FlxText(30, 10, FlxG.width, "SCORE", 65);
		ScoreTxtAltr.setFormat(Paths.font('HUD', 'tff'), 65, 0xFFFFFF05, null, FlxTextBorderStyle.SHADOW, 0xFF0f0f0f);
		ScoreTxtAltr.cameras = [sonicHUD];
		ScoreTxtAltr.borderSize = 3;
		add(ScoreTxtAltr);

		var TimeTxtAltr = new FlxText(30, ScoreTxtAltr.y + 60, FlxG.width, "TIME", 65);
		TimeTxtAltr.setFormat(Paths.font('HUD', 'tff'), 65, 0xFFFFFF05, null, FlxTextBorderStyle.SHADOW, 0xFF0f0f0f);
		TimeTxtAltr.borderSize = 3;
		TimeTxtAltr.cameras = [sonicHUD];
		add(TimeTxtAltr);

		MissTxtAltr = new FlxText(30, TimeTxtAltr.y + 60, FlxG.width, "MISSES", 65);
		MissTxtAltr.setFormat(Paths.font('HUD', 'tff'), 65, 0xFFFFFF05, null, FlxTextBorderStyle.SHADOW, 0xFF0f0f0f);
		MissTxtAltr.borderSize = 3;
		MissTxtAltr.cameras = [sonicHUD];
		add(MissTxtAltr);

		ScoreTxtAlt = new FlxText(ScoreTxtAltr.x + 365, ScoreTxtAltr.y, FlxG.width, "0", 65);
		ScoreTxtAlt.setFormat(Paths.font('HUD', 'tff'), 65, 0xFFf2f2f2, null, FlxTextBorderStyle.SHADOW, 0xFF0f0f0f);
		ScoreTxtAlt.borderSize = 3;
		ScoreTxtAlt.cameras = [sonicHUD];
		add(ScoreTxtAlt);

		MissTxtAlt = new FlxText(MissTxtAltr.x + 285, MissTxtAltr.y, FlxG.width, "0", 65);
		MissTxtAlt.setFormat(Paths.font('HUD', 'tff'), 65, 0xFFf2f2f2, null, FlxTextBorderStyle.SHADOW, 0xFF0f0f0f);
		MissTxtAlt.borderSize = 3;
		MissTxtAlt.cameras = [sonicHUD];
		add(MissTxtAlt);

		TimeTxtAlt = new FlxText(TimeTxtAltr.x + 190, TimeTxtAltr.y, FlxG.width, "0:00", 65);
		TimeTxtAlt.setFormat(Paths.font('HUD', 'tff'), 65, 0xFFf2f2f2, null, FlxTextBorderStyle.SHADOW, 0xFF0f0f0f);
		TimeTxtAlt.borderSize = 3;
		TimeTxtAlt.cameras = [sonicHUD];
		add(TimeTxtAlt);

		var lifeCounter = new FlxSprite(35, FlxG.height * 0.85).loadGraphic(lifeCounterGraphic);
		lifeCounter.cameras = [sonicHUD];
		add(lifeCounter);

		HealthText = new FlxText(lifeCounter.x + 140, lifeCounter.y + 45, FlxG.width, "0%", 45);
		if (centeredHealthText)
			HealthText.y -= 15;
		HealthText.setFormat(Paths.font('HUD', 'tff'), 45, 0xFFf2f2f2, null, FlxTextBorderStyle.SHADOW, 0xFF0f0f0f);
		HealthText.cameras = [sonicHUD];
		HealthText.borderSize = 3;
		add(HealthText);

		for (text in [ScoreTxtAltr, MissTxtAltr, TimeTxtAltr, ScoreTxtAlt, MissTxtAlt, TimeTxtAlt]) {
			text.shadowOffset = new FlxPoint(1.2, 1.2);
			text.x += 15;
			text.y += 15;
		}
	}

	var time;

	function update(elapsed) {
		sonicHUD.zoom = camHUD.zoom;
		
		ScoreTxtAlt.text = songScore;
		TimeTxtAlt.text = FlxStringUtil.formatTime(Conductor.songPosition / 1000);
		MissTxtAlt.text = misses;
		HealthText.text = Std.int(health * 50) + "%";

		if (misses > 0 && !executedTimer)
			textBlinkey();
	}
}
var red = false;

function textBlinkey() {
	executedTimer = true;

	red = !red;

	if (red)
		new FlxTimer().start(0.7, function(time) {
			MissTxtAltr.color = 0xFFff0015;
			textBlinkey();
		});
	else
		new FlxTimer().start(0.7, function(time) {
			MissTxtAltr.color = 0xFFFFFF05;
			textBlinkey();
		});
}
