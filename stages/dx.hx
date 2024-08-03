//adriiv was here
//brandon was here paige your code fucking sucks

import openfl.filters.ShaderFilter;

EngineSettings.maxRatingsAllowed = 0;
EngineSettings.showTimer = false;

// var window = Window;
// import lime.ui.Window;

var shader:CustomShader = null;
var shader2:CustomShader = null;
var shader3:CustomShader = null;
var shader4:CustomShader = null;

import flixel.FlxCamera;

var camChars:FlxCamera;
var camChars2:FlxCamera;

var dx:Character = null;

function create() {

    camDXNotes = new FlxCamera(0, -30, 1280, 960, 1);
    camDXNotes.bgColor = new FlxColor(0x00000000);
    FlxG.cameras.add(camDXNotes, false);
    camDXNotes.height = 700;

    camPicoNotes = new FlxCamera(0, 0, 1280, 960, 1);
    camPicoNotes.bgColor = new FlxColor(0x00000000);
    FlxG.cameras.add(camPicoNotes, false);

    if (PlayState.get_difficulty() != "V1")
        camDXNotes.addShader(shader3 = new CustomShader(Paths.shader("dx"))); //ty yoshi
    
    FlxG.scaleMode.width = 1280;
    FlxG.scaleMode.height = 960;
    FlxG.scaleMode.isWidescreen = false;

    camBG = new FlxCamera(0, 0, 1280, 960, 1);
    camBG.bgColor = new FlxColor(0x00000000);
    FlxG.cameras.add(camBG, false);

    camChars = new FlxCamera(0, 0, 1280, 960, 1);
    camChars.bgColor = new FlxColor(0x00000000);

    camChars2 = new FlxCamera(0, 0, 1280, 960, 1);
    camChars2.bgColor = new FlxColor(0x00000000);
    FlxG.cameras.add(camChars2, false);
    FlxG.cameras.add(camChars, false);

    bg = new FlxSprite(-913, -500).loadGraphic(Paths.image('stages/dx/bg'));
    bg.antialiasing = true;
    bg.scrollFactor.set(0.3, 0.4);
    PlayState.add(bg);

    hill = new FlxSprite(-350, 1).loadGraphic(Paths.image('stages/dx/hills'));
    hill.antialiasing = true;
    hill.scale.set(0.6, 0.6);
    hill.scrollFactor.set(0.3, 0.4);
    PlayState.add(hill);

    trees = new FlxSprite(-913, 134).loadGraphic(Paths.image('stages/dx/trees'));
    trees.antialiasing = true;
    trees.scale.set(0.7, 0.7);
    trees.scrollFactor.set(0.6, 0.4);
    PlayState.add(trees);

    pillar2 = new FlxSprite(-498, -1116).loadGraphic(Paths.image('stages/dx/pillar2'));
    pillar2.antialiasing = true;
    pillar2.scrollFactor.set(0.85, 0.85);
    pillar2.cameras = [camBG];
    PlayState.add(pillar2);

    pillar1 = new FlxSprite(700, -1257).loadGraphic(Paths.image('stages/dx/pillar1'));
    pillar1.antialiasing = true;
    pillar1.scrollFactor.set(0.9, 0.9);
    pillar1.cameras = [camBG];
    PlayState.add(pillar1);

    green = new FlxSprite(200, -700).loadGraphic(Paths.image('stages/dx/top'));
    green.antialiasing = true;
    green.scale.set(3, 3);
    green.cameras = [camBG];
    PlayState.add(green);  

	floor = new FlxSprite(-565, 275).loadGraphic(Paths.image('stages/dx/floor'));
    floor.antialiasing = true;
    floor.scale.set(0.8, 0.8);
    floor.cameras = [camBG];
    PlayState.add(floor);    

    if (PlayState.get_difficulty() == "gay") {
        camGame.addShader(new CustomShader(Paths.shader("rainbow"))); //ty yoshi
        camBG.addShader(new CustomShader(Paths.shader("rainbow"))); //ty yoshi
        camChars.addShader(new CustomShader(Paths.shader("rainbow"))); //ty yoshi
        camChars2.addShader(new CustomShader(Paths.shader("rainbow"))); //ty yoshi
        camHUD.addShader(new CustomShader(Paths.shader("rainbow"))); //ty yoshi
        camPicoNotes.addShader(new CustomShader(Paths.shader("rainbow"))); //ty yoshi
        camDXNotes.addShader(new CustomShader(Paths.shader("rainbow"))); //ty yoshi
    }

    /*bushes = new FlxSprite(-1654, -58).loadGraphic(Paths.image('stages/dx/bushes'));
    bushes.antialiasing = true;
    bushes.scale.set(0.7, 0.7);
    bushes.cameras = [camChars];
    PlayState.add(bushes);*/

    dx = PlayState.dad;
}

var bfX:Int = 489 + 69 + (9 + 10) + 21; //nice
var bfY:Int = 280; 
var bfCamX:Float = 0;
var dadCamY:Float = 0;
var shader:CustomShader = null;

function createPost() {

    for (i in 0...PlayState.cpuStrums.length) {
      //PlayState.cpuStrums.members[i].set_notesAngle(90);
      PlayState.cpuStrums.cameras = [camDXNotes];
      for (i in unspawnNotes) if (!i.mustPress) i.cameras = [camDXNotes];
      
      //sets individual note X positions
      //sets strumline Y coords to the variable
      PlayState.getStrum(i).angle = 90;
      PlayState.getStrum(i).visible = false;
      PlayState.getStrum(i).cameras = [camDXNotes];
    }

    PlayState.cpuStrums.members[0].x += 1300;
    PlayState.cpuStrums.members[1].x += 1195;
    PlayState.cpuStrums.members[2].x += 1085;
    PlayState.cpuStrums.members[3].x += 970;
    PlayState.cpuStrums.members[0].y += 64;
    PlayState.cpuStrums.members[1].y += 128 + 64;
    PlayState.cpuStrums.members[2].y += 64 + 64 + 64 + 64 + 64;
    PlayState.cpuStrums.members[3].y += 64 + 64 + 64 + 64 + 64 + 64 + 64;

    FlxG.cameras.add(camHUD, false);

    PlayState.healthBarBG.visible = false;
    PlayState.healthBar.visible = false;
    PlayState.iconP1.visible = false;
    PlayState.iconP2.visible = false;
    PlayState.scoreTxt.visible = false;
    PlayState.dad.cameras = [camChars2];
    PlayState.boyfriend.cameras = [camChars2];

    FlxG.resizeWindow(1024, 768);

    PlayState.boyfriend.x = bfX;
    PlayState.boyfriend.y = bfY;
    // PlayState.boyfriend.scrollFactor.set(0.9, 0.9);

    if (FlxG.state.SONG.song.toLowerCase() != "cuckshedder") {
        PlayState.dad.x = 134.55;
        PlayState.dad.y = 244.3;
    }
    
    PlayState.gf.visible = false;

    dadCamY = 444;
}

function update(elapsed:Float) {

    camChars.scroll.x = PlayState.camGame.scroll.x;
    camChars.scroll.y = PlayState.camGame.scroll.y;
    camChars.zoom = PlayState.camGame.zoom;

    camChars2.scroll.x = PlayState.camGame.scroll.x;
    camChars2.scroll.y = PlayState.camGame.scroll.y;
    camChars2.zoom = PlayState.camGame.zoom;

    camBG.scroll.x = PlayState.camGame.scroll.x;
    camBG.scroll.y = PlayState.camGame.scroll.y;
    camBG.zoom = PlayState.camGame.zoom;

    camDXNotes.zoom = PlayState.camGame.zoom - 0.3;

    /*if (shader != null)
        shader.shaderData.iTime.value = [curDecBeat / 2];

    if (shader2 != null)
        shader2.shaderData.iTime.value = [curDecBeat / 2];

    if (shader4 != null)
        shader4.shaderData.iTime.value = [curDecBeat / 2];*/

    //PlayState.autoCamZooming = false;
    //PlayState.camZooming = false;

    if (PlayState.section != null && PlayState.section.mustHitSection) {
        PlayState.camFollow.setPosition(530, 480);
        if (PlayState.get_difficulty() == "V1")
            PlayState.defaultCamZoom = 1.2;
        else
            PlayState.defaultCamZoom = 0.75;
    } else {
        if (curStep > 815 && PlayState.get_difficulty() != "V1") {
            PlayState.camFollow.setPosition(420, dadCamY - 350);
            PlayState.defaultCamZoom = 0.55;
        } else {
            PlayState.camFollow.setPosition(420, dadCamY);
            PlayState.defaultCamZoom = 1.3;
        }
    }

  if (FlxG.keys.justPressed.SEVEN) {
    FlxG.resizeWindow(1280, 720);
    FlxG.scaleMode.width = 1280;
    FlxG.scaleMode.height = 720;
    FlxG.scaleMode.isWidescreen = false;
  }

//   window.width = 1024 / FlxG.camera.zoom;
//   window.height = 768 / FlxG.camera.zoom;
//   window.x = 460 + (FlxG.camera.scroll.x - (window.width * (1 - FlxG.camera.zoom) / 2));
//   window.y = 240 + (FlxG.camera.scroll.y - (window.height * (1 - FlxG.camera.zoom) / 2));

}

var lerpShit:Float = 0;

var bfScaler:Float = 0;
var curBfScale:Float = 0;
var newBfScale:Float = 0;

var hillScaler:Float = 0;
var curHillScale:Float = 0;
var newHillScale:Float = 0;

var tree2Scaler:Float = 0;
var curTree2Scale:Float = 0;
var newTree2Scale:Float = 0;
var treeScaler:Float = 0;
var curTreeScale:Float = 0;
var newTreeScale:Float = 0;

// var pillar2Scaler:Float = 0;
// var curPillar2Scale:Float = 0;
// var newPillar2Scale:Float = 0;

// var pillar1Scaler:Float = 0;
// var curPillar1Scale:Float = 0;
// var newPillar1Scale:Float = 0;

function updatePost(elapsed) {
    lerpShit = 0.08 * 60 * elapsed;

    //PlayState.camFollowLerp = lerpShit;
    //FlxG.camera.zoom = FlxMath.lerp(FlxG.camera.zoom, defaultCamZoom, lerpShit);

    curBfScale = PlayState.boyfriend.scale.x;
    bfScaler = FlxMath.lerp(curBfScale, newBfScale, lerpShit);
	PlayState.boyfriend.scale.set(bfScaler, bfScaler);


    curHillScale = hill.scale.y;
    hillScaler = FlxMath.lerp(curHillScale, newHillScale, lerpShit);
    hill.scale.set(hillScaler, hillScaler);
    hill.y = -50 * hillScaler;

    /*curTree2Scale = trees2.scale.x;
    tree2Scaler = FlxMath.lerp(curTree2Scale, newTree2Scale, lerpShit);
    trees2.scale.set(tree2Scaler, tree2Scaler);
    trees2.y = -44 * tree2Scaler; 
    // trees2.x = -913 +tree2Scaler; */

    curTreeScale = trees.scale.x;
    treeScaler = FlxMath.lerp(curTreeScale, newTreeScale, lerpShit);
    trees.scale.set(treeScaler, treeScaler);
    trees.y = 134 * treeScaler; 
    // trees.x = -913 +treeScaler; 


    if (PlayState.section != null && PlayState.section.mustHitSection) {
        newBfScale = 1;
        newHillScale = 0.56;
        newTree2Scale = 0.64;
        newTreeScale = 0.66;
        newPillar2Scale = 0.95;
        //bushes.scale.y = 1;
        PlayState.boyfriend.x = bfX * bfScaler;
        PlayState.boyfriend.y = bfY * bfScaler;
    } else {
        newBfScale = 2;
        newHillScale = 0.525;
        newTree2Scale = 0.62;
        newTreeScale = 0.64;
        newPillar2Scale = 1;
        //bushes.scale.y = 1.2;
        FlxTween.tween(PlayState.boyfriend, {x: 1061}, 1, {ease: FlxEase.quadOut});
        PlayState.boyfriend.y = bfY * bfScaler;
        
    }

}

var boingySproingy:Bool = false;
var poopFartShittay:Float = 1.25;
var camRight:Bool = true;

function stepHit(curStep:Int) {

    if (boingySproingy){

     if (curStep % 4 == 0) {
          FlxTween.tween(PlayState.camHUD, {y: 0}, 0.2, {ease: FlxEase.circOut});

      }     
      if (curStep % 4 == 2) {
          FlxTween.tween(PlayState.camHUD, {y: 15}, 0.2, {ease: FlxEase.sineIn});
      }
      }

    if (curStep == 302){
        /*dx.visible = false;
            dx2old.visible = true;
        dx2old.shader = (shader = new CustomShader(Paths.shader("hotlineChara")));*/

        if (PlayState.get_difficulty() == "V1")
            changeDad(mod + ":scrapped");
        else
            changeDad(mod + ":dx2");

        dad.cameras = [camChars];
        boyfriend.cameras = [camChars];
    }

    if (curStep == 815 && PlayState.get_difficulty() != "V1") {
        camBG.flash(0xAAFF0000, 1);
        pillar1.color = 0xFFFF3333;
        pillar2.color = 0xFFFF3333;
        floor.color = 0xFFFF3333;
        bushes.color = 0xFFFF3333;
        green.color = 0xFFFF3333;
        bg.color = 0xFFFF3333;
        hill.color = 0xFFFF3333;
        trees2.color = 0xFFFF3333;
        trees.color = 0xFFFF3333;

        changeDad(mod + ":dxbutgay");

        dad.cameras = [camChars];
        boyfriend.cameras = [camChars];
    }
}

function beatHit(curBeat)
{

    if (curBeat == 140)
      boingySproingy = true;

    if (curBeat == 72){
    // FlxTween.tween(PlayState.dad.scale, {y: 2}, 1.5, {ease: FlxEase.linear});
    // FlxTween.tween(PlayState.dad, {y: 129.55 / 2}, 1.5, {ease: FlxEase.linear});
    FlxTween.color(bg, 2, 0xFFFFFFFF, 0xFFFFAAAA, {ease: FlxEase.quadInOut});
    FlxTween.color(hill, 2, 0xFFFFFFFF, 0xFFFFAAAA, {ease: FlxEase.quadInOut});
    FlxTween.color(trees2, 2, 0xFFFFFFFF, 0xFFFFAAAA, {ease: FlxEase.quadInOut});
    FlxTween.color(trees, 2, 0xFFFFFFFF, 0xFFFFAAAA, {ease: FlxEase.quadInOut});
    }

    

    if (curBeat == 156){
        // pillar1.shader = (shader = new CustomShader(Paths.shader("hotlineVHS")));
        PlayState.camGame.addShader(shader2 = new CustomShader(Paths.shader("hotlineVHS"))); //ty yoshi
        PlayState.camGame.flash(0xFFFF0000, 1);
    }

    if (curBeat == 204 && PlayState.get_difficulty() == "V1"){
        // pillar1.shader = (shader = new CustomShader(Paths.shader("hotlineVHS")));
        camBG.flash(0xAAFF0000, 1);
        pillar1.color = 0xFFFF3333;
        pillar2.color = 0xFFFF3333;
        floor.color = 0xFFFF3333;
        bushes.color = 0xFFFF3333;
        green.color = 0xFFFF3333;
        bg.color = 0xFFFF3333;
        hill.color = 0xFFFF3333;
        trees2.color = 0xFFFF3333;
        trees.color = 0xFFFF3333;
    }

   if (boingySproingy){
      PlayState.autoCamZooming = false;
      if (curBeat % 2 == 0){

            if (!camRight){
              poopFartShittay = -1.25;
              camRight = true;
            }
            else{
              poopFartShittay = 1.25;
              camRight = false;
            }

            camHUD.zoom += 0.02;
            camHUD.angle = poopFartShittay;
            FlxTween.tween(camHUD, {angle: 0}, 0.5, {ease: FlxEase.quadInOut});
            FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.quadInOut});
        
        }
        
    }

    }

// var camTween:FlxTween;
// var alsoCamTween:FlxTween;
// var camMoving:Bool = false;
// var cum:Float;

// function camTweenin(xx, yy, scalex, scaley){

//   if (!camMoving){

//     var tweenTime:Float = 1;

//     camMoving = true;
//     camTween = FlxTween.tween(cam, {x: xx, y: yy}, tweenTime, {
//       ease: FlxEase.backIn,
//       onComplete: function(twn:FlxTween)
//         {
//           camMoving = false;
//           camTween.cancel();
//         }
//     });

//     alsoCamTween = FlxTween.tween(cam.scale, {x:scalex, y:scaley}, tweenTime, {
//       ease: FlxEase.quadInOut,
//       onComplete: function(twn:FlxTween)
//         {
//           alsoCamTween.cancel();
//         }
//     });
    
//   }

//   PlayState.camFollow.setPosition(cam.x, cam.y);
//   FlxG.camera.zoom = cam.scale.x;
  
// }
