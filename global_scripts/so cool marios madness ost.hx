import ModSupport;

var creditList = [
    "Gamebreaker" => ["by Saster", 4.1, 2.1, 45, "CODING:\n[504]Brandon\nPaige\nShadowsBigNuts\n\nMUSIC:\nSaster\nRiverMusic\n\nCHARTING:\nStarzinark"],
    "Cuckshedder" => ["schlatt", 4.1, 2.1, 45, "CODING:\n[504]Brandon\nPaige\nShadowsBigNuts\n\nMUSIC:\nSaster\nPaige\nShadowsBigNuts"],
    "Robbery" => ["by Saster", 0, 2.1, 55, "CODING:\n[504]brandon\n\nMUSIC:\nSaster\n\nCHARTING\nKaseroYT"]
];
var credit = creditList.get(FlxG.state.SONG.song);

function createPost() {
    var box = new FlxSprite().loadGraphic(Paths.image("box"));
    box.cameras = [camHUD];
    box.setGraphicSize(Std.int(box.height * 0.8));
    box.screenCenter();
    box.y = -1000;
    add(box);

    var credText = new FlxText(0, 0, box.width, FlxG.state.SONG.song.toUpperCase() + "\n\n" + credit[4].toUpperCase());
    credText.cameras = [camHUD];
    credText.screenCenter();
    credText.y = -1000;
    credText.setFormat(Paths.font("vcr.ttf"), credit[3], 0xFFffffff, "center");
    add(credText);

    if (PlayState.get_difficulty() == "gay") {
        FlxG.stage.window.title = "gaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygay";
        credText.text = "gaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygaygay";
    }
    else
        FlxG.stage.window.title = ModSupport.modConfig[mod].titleBarName + " - " + FlxG.state.SONG.song + " " + credit[0];

    for (obj in [box, credText]) {
        FlxTween.tween(obj, {y: (FlxG.height / 2) - (box.height / 2)}, 0.5, {startDelay: credit[1], onComplete: function() {
            FlxTween.tween(obj, {y: -1000}, 0.5, {startDelay: credit[2], onComplete: function() {
                obj.destroy();
            }});
        }});
    }
}

function updatePost() {
    if (health <= 0) {
        FlxG.resetState();
    }

    if (PlayState.get_difficulty() == "gay")
        FlxG.sound.music.pitch = FlxG.random.float(1, 1.5);
}

function destroy() {
    FlxG.stage.window.title = ModSupport.modConfig[mod].titleBarName;
}