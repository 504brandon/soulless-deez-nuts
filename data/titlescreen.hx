function create() {
  FlxG.save.data.gayMode = false;
  FlxG.switchState(new ModState("BreakerTitle", mod));
}