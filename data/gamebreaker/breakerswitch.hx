import flixel.FlxCamera;

var camChars2:FlxCamera;

function create() {
}

function createPost() {
    camChars2 = new FlxCamera(0, 0, 1280, 960, 1);
	camChars2.bgColor = new FlxColor(0x00000000);
	FlxG.cameras.add(camChars2);

    if (PlayState.get_difficulty() == "gay") {
        camChars2.addShader(new CustomShader(Paths.shader("rainbow"))); // ty yoshi
    }
}

function updatePost(elapsed) {
    camChars2.scroll.x = FlxG.camera.scroll.x;
	camChars2.scroll.y = FlxG.camera.scroll.y;
	camChars2.zoom = FlxG.camera.zoom;
}

function stepHit(curStep:Int) {
	if (curStep == 302) {
		if (PlayState.get_difficulty() == "V1")
			changeDad(mod + ":scrapped");
		else
			changeDad(mod + ":dx2");

		dad.cameras = [camChars2];
		boyfriend.cameras = [camChars2];
	}

	if (curStep == 815 && PlayState.get_difficulty() != "V1") {
		changeDad(mod + ":dxbutgay");

		dad.cameras = [camChars2];
		boyfriend.cameras = [camChars2];
	}
}