import openfl.filters.ShaderFilter;

EngineSettings.showTimer = false;

function create() {
    FlxG.scaleMode.width = 1280;
	FlxG.scaleMode.height = 960;
	FlxG.scaleMode.isWidescreen = false;
	FlxG.resizeWindow(1024, 768);

	defaultCamZoom = 1.2;

	sky = new FlxSprite(-20, -7).loadGraphic(Paths.image('curse/sky'));
	sky.updateHitbox();
	sky.antialiasing = true;
	sky.scrollFactor.set(0, 0);
	add(sky);

	cloudsBlurred = new FlxSprite(-16, 25).loadGraphic(Paths.image('curse/cloudsBlurred'));
	cloudsBlurred.updateHitbox();
	cloudsBlurred.antialiasing = true;
	cloudsBlurred.scrollFactor.set(1.4, 1.2);
	add(cloudsBlurred);

	city = new FlxSprite(-91, 115).loadGraphic(Paths.image('curse/city'));
	city.updateHitbox();
	city.antialiasing = true;
	city.scrollFactor.set(0.7, 0.8);
	add(city);

	sea = new FlxSprite(-78, 569).loadGraphic(Paths.image('curse/sea'));
	sea.updateHitbox();
	sea.antialiasing = true;
	sea.scrollFactor.set(0, 0.9);
	add(sea);

	signpost = new FlxSprite(95, 5).loadGraphic(Paths.image('curse/signpost'));
	signpost.updateHitbox();
	signpost.antialiasing = true;
	signpost.scrollFactor.set(0.9, 1);
	add(signpost);

	fence = new FlxSprite(-118, 441).loadGraphic(Paths.image('curse/fence'));
	fence.updateHitbox();
	fence.antialiasing = true;
	fence.scrollFactor.set(1.12, 1);
	fence.scale.x = 1.1;
	add(fence);

	floor = new FlxSprite(-431, 558).loadGraphic(Paths.image('curse/floor'));
	floor.updateHitbox();
	floor.antialiasing = true;
	floor.scrollFactor.set(1, 1);
	floor.scale.y = 0.8;
	floor.shader = new CustomShader("Friday Night Funkin':3D Floor");
	add(floor);
}

function createPost() {
    lamp = new FlxSprite(418, -61).loadGraphic(Paths.image('curse/lamp'));
	lamp.updateHitbox();
	lamp.antialiasing = true;
	lamp.blend = BlendMode.ADD;
	lamp.scrollFactor.set(1.4, 1);
	add(lamp);

    boyfriend.setPosition(882, 231);
	boyfriend.scrollFactor.set(1.4, 1.05);

    dad.setPosition(123, 218);
	dad.scrollFactor.set(1.4, 1.05);

    gf.setPosition(604, 181);
	gf.scrollFactor.set(1.3, 1.02);

    for (obj in [scoreText, healthBarBG, healthBar, iconP1, iconP2])
		obj.kill();
}

function updatePost(elapsed:Float) {
	floor.shader.shaderData.curveX.value = [
		(((FlxG.camera.scroll.x + (FlxG.width / 2)) - floor.getMidpoint().x) / 0.4) / Math.PI / floor.width
	];
	floor.shader.shaderData.curveY.value = [
		(((FlxG.camera.scroll.y + (FlxG.height / 2)) - floor.getMidpoint().y) * floor.scrollFactor.y) / Math.PI / floor.height
	];
}