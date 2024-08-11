var options = [
	"Credits" => ["Credits or somthing", true],
	"Souless DX Pause" => ["Makes the pause menu look like the Souless DX one", true],
	"Sunks On Hud" => ["Should the sunks in milk be on the game cam or the hud cam", true],
	"Sunk Invasion" => ["...", false],
    "Sunk Limiter" => ["The sunk is infinite", true]
];

var optionNames = [];
var optionTexts = [];
var optionSelected = 0;
var optionsLength = -1;
var optionDesc;

function create() {
	if (FlxG.save.data.breakerOptions == null) {
		FlxG.save.data.breakerOptions = options;
		trace(FlxG.save.data.breakerOptions);
	}

	for (option in FlxG.save.data.breakerOptions.keys())
		options.set(option, FlxG.save.data.breakerOptions.get(option));

	for (option in options.keys()) {
		optionsLength++;

		var silliText = new FlxText(0, optionsLength * 45, FlxG.width, option + ": " + options.get(option)[1], 45);
		optionTexts.push(silliText);
		add(silliText);

		optionNames.push(option);
	}

	optionDesc = new FlxText(0, FlxG.height * 0.85, FlxG.width, "", 45);
	optionDesc.setFormat(null, 45, 0xFFffffff, "center");
	add(optionDesc);

	changeOption(0);
}

function update(elapsed) {
	if (controls.UP_P)
		changeOption(-1);
	if (controls.DOWN_P)
		changeOption(1);
	if (controls.ACCEPT)
		selectOption();
	if (controls.BACK)
		FlxG.switchState(new MainMenuState());

	var optionIndex = -1;

	for (option in optionTexts) {
		optionIndex++;

		if (optionSelected == optionIndex)
			option.alpha = 1;
		else
			option.alpha = 0.75;
	}
}

function changeOption(amt = 0) {
	optionSelected += amt;

	if (optionSelected >= optionsLength + 1)
		optionSelected = 0;

	if (optionSelected < 0)
		optionSelected = optionsLength;

	var curOption = options.get(optionNames[optionSelected]);
	optionDesc.text = curOption[0];
}

function selectOption() {
	var curOption = options.get(optionNames[optionSelected]);

	options.set(optionNames[optionSelected], [curOption[0], !curOption[1]]);
	optionTexts[optionSelected].text = optionNames[optionSelected] + ": " + options.get(optionNames[optionSelected])[1];

	FlxG.save.data.breakerOptions = options;
}
