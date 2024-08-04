var sunkTween;

function beatHit() {
	if (curBeat > 100 && curBeat < 219 && FlxG.state.SONG.song == "Milk" || curBeat > 292 && FlxG.state.SONG.song == "Milk" || FlxG.save.data.breakerOptions.get("Sunk Invasion")[1] == true) {
		sunkinTime();
	}
}

function sunkinTime() { // recoded some of this it aint all paiges code lol
    if (sunkTween == null || FlxG.save.data.breakerOptions.get("Sunk Limiter")[1] == false) {
        var sunkee = new FlxSprite(0, 0).loadGraphic(Paths.image('sunks/sunkee' + FlxG.random.int(1, 39)));
        sunkee.updateHitbox();
        sunkee.antialiasing = true;
        sunkee.scrollFactor.set(0, 0);
        sunkee.active = false;
        if (FlxG.save.data.breakerOptions.get("Sunks On Hud")[1] == true)
            sunkee.cameras = [camHUD];
        // sunkee.flipX = sunkFlip;
        sunkee.scale.x = FlxG.random.float(1.2, 2.2);
        sunkee.scale.y = sunkee.scale.x;
        sunkee.updateHitbox();
        add(sunkee);

        var sunkTime:Int = 0;
        sunkTime = FlxG.random.int(5, 10);

        switch (FlxG.random.int(1, 4)) {
            case 1:
                sunkee.x = 0 - sunkee.width;
                sunkee.y = FlxG.random.int(0 + sunkee.height, 960 - sunkee.height);

                sunkTween = FlxTween.tween(sunkee, {x: 1280 + sunkee.width}, sunkTime, {
                    onComplete: function(twn:FlxTween) {
                        sunkee.destroy();
                        sunkTween = null;
                    }
                });

            case 2:
                sunkee.x = FlxG.random.int(0 + sunkee.width, 1280 - sunkee.width);
                sunkee.y = 0 - sunkee.height;

                sunkTween = FlxTween.tween(sunkee, {y: 960 + sunkee.height}, sunkTime, {
                    onComplete: function(twn:FlxTween) {
                        sunkee.destroy();
                        sunkTween = null;
                    }
                });

            case 3:
                sunkee.x = 0 - sunkee.width;
                sunkee.y = 0 - sunkee.height;

                sunkTween = FlxTween.tween(sunkee, {x: 1280 + sunkee.width, y: 960 + sunkee.height}, sunkTime, {
                    onComplete: function(twn:FlxTween) {
                        sunkee.destroy();
                        sunkTween = null;
                    }
                });

            case 4:
                sunkee.x = 1280 + sunkee.width;
                sunkee.y = 960 + sunkee.height;

                sunkTween = FlxTween.tween(sunkee, {x: 0 - sunkee.width, y: 0 - sunkee.height}, sunkTime, {
                    onComplete: function(twn:FlxTween) {
                        sunkee.destroy();
                        sunkTween = null;
                    }
                });
        }

        return sunkee;
    }
}