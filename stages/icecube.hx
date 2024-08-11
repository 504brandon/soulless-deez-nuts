import flixel.addons.display.FlxBackdrop;

function create() {
    boyfriend.x = 812.35;
    boyfriend.y = 124.75;

    dad.x = -213.05 - 47;
    dad.y = 152.4 - 37;

    defaultCamZoom = 0.8;

    var bg = new FlxSprite(-437.8, -335.6).loadGraphic(Paths.image('stages/icecube/bg'));
    bg.updateHitbox();
    bg.antialiasing = true;
    bg.scrollFactor.set(0, 0);
    add(bg);

    var cloud = new FlxBackdrop(Paths.image('stages/icecube/coud'), 0x01, 35, 9999999999);
    cloud.velocity.x = 55;
    cloud.y += 50;
    cloud.updateHitbox();
    cloud.antialiasing = true;
    cloud.scrollFactor.set(1.3, 0.8);
    add(cloud);

    var fg = new FlxSprite(-544.25, 148.3).loadGraphic(Paths.image('stages/icecube/fg'));
    fg.updateHitbox();
    fg.antialiasing = true;
    fg.scrollFactor.set(1, 1);
    add(fg);

    gf.kill();

    if (PlayState.get_difficulty() == "gay") {
      camHUD.addShader(new CustomShader(Paths.shader("rainbow")));
      camGame.addShader(new CustomShader(Paths.shader("rainbow")));
    }
}