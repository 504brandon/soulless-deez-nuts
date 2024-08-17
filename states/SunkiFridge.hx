import LoadingState;

var chocoMilk;
var vanilaMilk;

var chocoMilkSelected;
var vanilaMilkSelected;

function create() {
    var fridge = new FlxSprite().loadGraphic(Paths.image("sunkFridge"));
    fridge.scale.set(2,2);
    fridge.screenCenter();
    add(fridge);

    vanilaMilk = new FlxSprite(315, -3).loadGraphic(Paths.image("vanilaMilk"));
    vanilaMilk.scale.set(2,2);
    vanilaMilk.updateHitbox();
    add(vanilaMilk);

    chocoMilk = new FlxSprite(772, -1).loadGraphic(Paths.image("chocoMilk"));
    chocoMilk.scale.set(2,2);
    chocoMilk.updateHitbox();
    add(chocoMilk);

    vanilaMilkSelected = new FlxSprite(382, 100).loadGraphic(Paths.image("vanilaMilkSelected"));
    vanilaMilkSelected.scale.set(2,2);
    add(vanilaMilkSelected);

    chocoMilkSelected = new FlxSprite(850, 100).loadGraphic(Paths.image("chocoMilkSelected"));
    chocoMilkSelected.scale.set(2,2);
    add(chocoMilkSelected);

    for (fuckYou in [fridge, vanilaMilk, chocoMilk, vanilaMilkSelected, chocoMilkSelected])
        fuckYou.antialiasing = true;

    for (fuckYou2 in [vanilaMilkSelected, chocoMilkSelected]) {
        fuckYou2.x -= 40;
        fuckYou2.y -= 40;
    }
}

var xx:Float = 0;
var yy:Float = 0;
var mx:Float = 0;
var my:Float = 0;
var zoom:Float = 1;
var zz:Float = 1;
var lerpVal = 0.04;

function update(elapsed) {
    //camMovement
    mx = (FlxG.mouse.screenX - 640) / 10;
    my = (FlxG.mouse.screenY - 320) / 10;
  
    xx = FlxMath.lerp(xx, mx,lerpVal);
    yy = FlxMath.lerp(yy, my, lerpVal);
    zz = FlxMath.lerp(zz, zoom, (lerpVal/4)*3);
  
    FlxG.camera.scroll.x = xx;
    FlxG.camera.scroll.y = yy;
    //

    //selectShit
    chocoMilkSelected.visible = FlxG.mouse.overlaps(chocoMilk);
    vanilaMilkSelected.visible = FlxG.mouse.overlaps(vanilaMilk);

    if (FlxG.mouse.justPressed) {
        if (FlxG.mouse.overlaps(chocoMilk)) {
            CoolUtil.loadSong(mod, "milk");
			LoadingState.loadAndSwitchState(new PlayState());
        }

        if (FlxG.mouse.overlaps(vanilaMilk)) {
            CoolUtil.loadSong(mod, "milk");
			LoadingState.loadAndSwitchState(new PlayState());
        }
    }
}