var cookies;
var stage:Stage = null;

function create() {
	stage = loadStage('sunkStage');

	FlxG.scaleMode.width = 1280;
    FlxG.scaleMode.height = 960;
    FlxG.scaleMode.isWidescreen = false;
	FlxG.resizeWindow(1024, 768);
}

function update(elapsed) {
	stage.update(elapsed);

	cookies.x = 5;
	cookies.y = FlxG.height * 0.95;
}

function beatHit(curBeat) {
	stage.onBeat();
}

function createPost() {
	scoreTxt.visible = false;

	cookies = new FlxText(0, 0, FlxG.width, "COOKIES:0");
    cookies.cameras = [camHUD];
    cookies.screenCenter();
    cookies.setFormat(Paths.font("silly.ttf"), 45, 0xFFffffff, "left");
    add(cookies);
}

function onPlayerHit(n) {
	cookies.text = "COOKIES:" + songScore;
}