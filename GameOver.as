//scene "gameOver" frame 99
stop();
playAgain.addEventListener(MouseEvent.CLICK, transitionToGame);
menu.addEventListener(MouseEvent.CLICK, transitionToMenu);

function transitionToGame (eventInfo) {
	gotoAndPlay("transitionGame")
}

function transitionToMenu (eventInfo) {
	gotoAndPlay("transitionMenu")
}


//scene "gameOver" frame 130
gotoAndPlay(1,"gamePlay");

//scene "gameOver" frame 161
gotoAndPlay(1,"gameMenu");