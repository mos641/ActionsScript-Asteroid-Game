//Note: This code is embeded as actions in a Flash file and is not meant to be run as actionsScript files
//Some code was provided by the instructor, mostly symbol definitions, this is indicated by the box comments

//initial logo, scene "gameLogo", frame 1
transition.addEventListener(MouseEvent.CLICK, skipTransition1);

function skipTransition1 (eventInfo) {
	gotoAndPlay(1, "gameMenu")
}


//initial menu, scene "gameMenu", frame 1
transitionin.addEventListener(MouseEvent.CLICK, skipTransition2);

function skipTransition2 (eventInfo) {
	gotoAndPlay("loop", "gameMenu")
}

//scene "gameMenu", frame 95 loop
stop();
playInitial.addEventListener(MouseEvent.CLICK, playGame);

function playGame (eventInfo) {
	gotoAndPlay("transitionOut")
}

import flash.display.StageScaleMode;
import flash.display.StageAlign;

stage.addEventListener(Event.RESIZE, handleResize);

stage.scaleMode = StageScaleMode.NO_SCALE;
stage.align = StageAlign.TOP_LEFT;
handleResize(null);

function handleResize(eventInfo) {
	if (stage.stageWidth >= 620, stage.stageHeight >= 860) {
	logo.x = (stage.stageWidth / 2) | 0;
	logo.y = 190;
	
	playInitial.x = (stage.stageWidth / 2) | 0;
	playInitial.y = (stage.stageHeight / 2) | 0;
	
	info.x = (stage.stageWidth / 2) - 275 | 0;
	info.y = stage.stageHeight - 360;
	
	dark.x = (stage.stageWidth / 2) | 0;
	dark.y = (stage.stageHeight / 2) | 0;
	dark.width = stage.stageWidth;
	dark.height = stage.stageHeight;
	
	stars.x = (stage.stageWidth / 2) | 0;
	stars.y = (stage.stageHeight / 2) | 0;
	stars.width = stage.stageWidth;
	stars.height = stage.stageHeight;
	
	bg.x = (stage.stageWidth / 2) | 0;
	bg.y = (stage.stageHeight / 2) | 0;
	bg.width = stage.stageWidth;
	bg.height = stage.stageHeight;
	
} else {
	logo.width = ((stage.stageWidth / 16) * 15) | 0;
	logo.height = (stage.stageHeight / 5) | 0;
	logo.x = (stage.stageWidth / 2) | 0;
	logo.y = (stage.stageHeight / 6) | 0;
	
	playInitial.width = (stage.stageWidth / 3) | 0;
	playInitial.height = (stage.stageHeight / 9) | 0;
	playInitial.x = (stage.stageWidth / 2) | 0;
	playInitial.y = (stage.stageHeight / 2) | 0;
	
	info.width = ((stage.stageWidth / 16) * 14) | 0;
	info.height = (stage.stageHeight / 3) | 0;
	info.x = (stage.stageWidth / 2) - (info.width / 2) | 0;
	info.y = stage.stageHeight - (info.height + (stage.stageHeight / 16));
	
	dark.x = (stage.stageWidth / 2) | 0;
	dark.y = (stage.stageHeight / 2) | 0;
	dark.width = stage.stageWidth;
	dark.height = stage.stageHeight;
	
	stars.x = (stage.stageWidth / 2) | 0;
	stars.y = (stage.stageHeight / 2) | 0;
	stars.width = stage.stageWidth;
	stars.height = stage.stageHeight;
	
	bg.x = (stage.stageWidth / 2) | 0;
	bg.y = (stage.stageHeight / 2) | 0;
	bg.width = stage.stageWidth;
	bg.height = stage.stageHeight;
}
}

//transition out of menu, scene "gameMenu" frame 96
transitionout.addEventListener(MouseEvent.CLICK, skipTransition3);

function skipTransition3 (eventInfo) {
	gotoAndPlay(1, "gamePlay")
}