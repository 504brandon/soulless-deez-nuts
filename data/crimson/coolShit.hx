function setCamZoom(amt:Float) {
    defaultCamZoom = amt;
}

function flashCamLol(color:String, length:Float) {
    var realColor = 0xffffffff;

    switch (color.toLowerCase()) {
        case "red":
            realColor = 0xff9f0000;
    }

    FlxG.camera.bgColor = realColor;
    FlxG.camera.flash(realColor, length);
}

function flashAndZoom(color:String, length:Float, zoom:Float) {
    flashCamLol(color, length);
    setCamZoom(zoom);
}

function faggot() {
    var faggot = new FlxText(0, -500, FlxG.width, "FAGGOT :3", 25);
	faggot.color = 0xffff0000;
	faggot.font = Paths.font("silly.ttf");
	faggot.alignment = "center";
	faggot.cameras = [camHUD];
    FlxTween.tween(faggot, {y: 0, size: 235}, 0.15, {ease: FlxEase.elasticInOut});
    FlxTween.tween(faggot, {y: -500, size: 25}, 0.3, {ease: FlxEase.elasticInOut, startDelay: 0.25});
	add(faggot);
}