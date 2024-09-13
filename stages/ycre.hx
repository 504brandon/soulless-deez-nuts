var stage:Stage = null;
function create() {
	stage = loadStage('ycre');
}
function update(elapsed) {
	stage.update(elapsed);
}
function beatHit(curBeat) {
	stage.onBeat();
}