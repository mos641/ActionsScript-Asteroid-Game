//scene "gamePlay" frame 1, transitiong to gameplay
transitionin.addEventListener(MouseEvent.CLICK, skipTransition2);

function skipTransition2 (eventInfo) {
	gotoAndPlay("loop", "gameMenu")
}

//scene "gamePlay" frame 96, actual gameplay
import flash.sensors.Accelerometer; 
import flash.events.AccelerometerEvent;
var accel:Accelerometer = new Accelerometer();

stop();

stage.addEventListener(Event.ENTER_FRAME, handleTick);
stage.addEventListener(MouseEvent.MOUSE_MOVE, handleMove);

stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown);
stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
stage.addEventListener(MouseEvent.CLICK, shoot);

accel.addEventListener(AccelerometerEvent.UPDATE, onAccUpdate);

//set a speed and acceleration
var maxSpeed = 17;
var v = 6;
var a = 0.1;
if (v >= 10){
	v = 10
}

//dealing with movement
var mouseMove = true;

var shouldMoveLeft = false;
var shouldMoveRight = false;


// track how long we've been playing
var tickCount = 0;

//movement with Accelerometer
function onAccUpdate(e:AccelerometerEvent):void{
	player.x -= (e.accelerationX*10);
}


function handleTick(eventInfo) {
	tickCount++;
	
	// lets move the player to where the mouse is
	var distance = stage.mouseX - player.x;
	
	// only when we're paying attention the mouse do we examine its position
	if(mouseMove) {
		if(distance > maxSpeed) {			// if we're to the right, go right
			shouldMoveLeft = false;
			shouldMoveRight = true;
		} else if(distance < -maxSpeed) {	// if we're to the left, go left
			shouldMoveRight = false;
			shouldMoveLeft = true;
		} else {							// if we're on target, don't move
			shouldMoveLeft = false;
			shouldMoveRight = false;
		}
	}
	
	// actually perform the movement
	if(shouldMoveLeft) {
		player.x -= maxSpeed;
	}
	if(shouldMoveRight) {
		player.x += maxSpeed;
	}
	
	//lets stop the players movement from leaving the screen
	if(player.x < 60) {
		player.x = 60;
	}
	if(player.x > 580) {
		player.x = 580;
	}
	
	if(tickCount%30 == 0){
		v += a;
	}
	
	var i=0
	// lets go over every falling object 1
	for(i=0; i < spawnBox1.activeObjects.length; i++){
		var object = spawnBox1.activeObjects[i];
				
		// make the object fall down
		object.y += v;


		// if our position is lower than the screen
		if(object.y > stage.stageHeight + 80){
			// then remove it
			spawnBox1.deleteObject(object);
			stage.removeChild(object);
			// move back now the array is smaller
			i--;
		}
		
		// if the player hits the object
		if(player.checkCollision(object)){
			// do something
			player.gotoAndPlay("hit");
			object.gotoAndPlay("hit");
			// then remove it
			spawnBox1.deleteObject(object);
			//ending the game
			gameOver();
			return;
		}
		
	}

		// lets go over every falling object 2
	for(i=0; i < spawnBox2.activeObjects.length; i++){
		object = spawnBox2.activeObjects[i];
		
		
		// make the object fall down
		object.y += v;


		// if our position is lower than the screen
		if(object.y > stage.stageHeight + 80){
			// then remove it
			spawnBox2.deleteObject(object);
			stage.removeChild(object);
			// move back now the array is smaller
			i--;
		}
		
		// if the player hits the object
		if(player.checkCollision(object)){
			// do something
			player.gotoAndPlay("hit");
			object.gotoAndPlay("hit");
			// then remove it
			spawnBox2.deleteObject(object);
			//ending the game
			gameOver();
			return;
		}
		
	}
	
	// lets go over every falling object 3
	for(i=0; i < spawnBox3.activeObjects.length; i++){
		object = spawnBox3.activeObjects[i];
		
		
		// make the object fall down
		object.y += v;


		// if our position is lower than the screen
		if(object.y > stage.stageHeight + 80){
			// then remove it
			spawnBox3.deleteObject(object);
			stage.removeChild(object);
			// move back now the array is smaller
			i--;
		}
		
		// if the player hits the object
		if(player.checkCollision(object)){
			// do something
			player.gotoAndPlay("hit");
			object.gotoAndPlay("hit");
			// then remove it
			spawnBox3.deleteObject(object);
			//ending the game
			gameOver();
			return;
		}
	}
		
		// lets go over every falling object gem 1
	for(i=0; i < spawnGem1.activeObjects.length; i++){
		object = spawnGem1.activeObjects[i];
		
		
		// make the object fall down
		object.y += (v + 1);


		// if our position is lower than the screen
		if(object.y > stage.stageHeight + 80){
			// then remove it
			spawnGem1.deleteObject(object);
			stage.removeChild(object);
			// move back now the array is smaller
			i--;
		}
		
		// if the player hits the object
		if(player.checkCollision(object)){
			// do something
			count.addPoints(5);
			object.gotoAndPlay("hit");
			// then remove it
			spawnGem1.deleteObject(object);
		}
		
	}
	
			// lets go over every falling object gem 2
	for(i=0; i < spawnGem2.activeObjects.length; i++){
		object = spawnGem2.activeObjects[i];
		
		
		// make the object fall down
		object.y += (v + 2);


		// if our position is lower than the screen
		if(object.y > stage.stageHeight + 80){
			// then remove it
			spawnGem2.deleteObject(object);
			stage.removeChild(object);
			// move back now the array is smaller
			i--;
		}
		
		// if the player hits the object
		if(player.checkCollision(object)){
			// do something
			count.addPoints(5);
			object.gotoAndPlay("hit");
			// then remove it
			spawnGem2.deleteObject(object);
		}
		
	}
	
	
	
	// lets go over the shooters
	for(i=0; i < player.spawnShoot.activeObjects.length; i++){
		object = player.spawnShoot.activeObjects[i];
		
		
		// make the object shoot up
		object.y -= (20);


		// if the bullet is higher than the screen
		if(object.y < -80){
			// then remove it
			player.spawnShoot.deleteObject(object);
			stage.removeChild(object);
			// move back now the array is smaller
			i--;
		}
		
		for(i=0; i < spawnGem2.activeObjects.length; i++){
			var fallingObject = spawnGem2.activeObjects[i];
			// if the bullet hits the object
			if(object.checkCollision(fallingObject)){
				// do something
				fallingObject.gotoAndPlay("hit");
				// then remove it
				player.spawnShoot.deleteObject(object);
				spawnBox1.deleteObject(fallingObject);
				spawnBox2.deleteObject(fallingObject);
				spawnBox3.deleteObject(fallingObject);
				stage.removeChild(object);
			}
		}
		
		for(i=0; i < spawnGem1.activeObjects.length; i++){
			fallingObject = spawnGem1.activeObjects[i];
			// if the bullet hits the object
			if(object.checkCollision(fallingObject)){
				// do something
				fallingObject.gotoAndPlay("hit");
				// then remove it
				player.spawnShoot.deleteObject(object);
				spawnBox1.deleteObject(fallingObject);
				spawnBox2.deleteObject(fallingObject);
				spawnBox3.deleteObject(fallingObject);
				stage.removeChild(object);
			}
		}
		
		for(i=0; i < spawnBox1.activeObjects.length; i++){
			fallingObject = spawnBox1.activeObjects[i];
			// if the bullet hits the object
			if(object.checkCollision(fallingObject)){
				// do something
				fallingObject.gotoAndPlay("hit");
				// then remove it
				player.spawnShoot.deleteObject(object);
				spawnBox1.deleteObject(fallingObject);
				spawnBox2.deleteObject(fallingObject);
				spawnBox3.deleteObject(fallingObject);
				stage.removeChild(object);
			}
		}
		
		for(i=0; i < spawnBox2.activeObjects.length; i++){
			fallingObject = spawnBox2.activeObjects[i];
			// if the bullet hits the object
			if(object.checkCollision(fallingObject)){
				// do something
				fallingObject.gotoAndPlay("hit");
				// then remove it
				player.spawnShoot.deleteObject(object);
				spawnBox1.deleteObject(fallingObject);
				spawnBox2.deleteObject(fallingObject);
				spawnBox3.deleteObject(fallingObject);
				stage.removeChild(object);
			}
		}
		
		for(i=0; i < spawnBox3.activeObjects.length; i++){
			fallingObject = spawnBox3.activeObjects[i];
			// if the bullet hits the object
			if(object.checkCollision(fallingObject)){
				// do something
				fallingObject.gotoAndPlay("hit");
				// then remove it
				player.spawnShoot.deleteObject(object);
				spawnBox1.deleteObject(fallingObject);
				spawnBox2.deleteObject(fallingObject);
				spawnBox3.deleteObject(fallingObject);
				stage.removeChild(object);
			}
		}
		
	}
	
	
	
	// every 30 ticks lets add a point
	if(tickCount%30 == 0){
		count.addPoints(1);
	}
	
	// every 40 ticks lets add a new object for spawn box 1
	if(tickCount%40 == 0){
		var newObject;
		newObject = spawnBox1.createNewObject()
		stage.addChild(newObject);
	}
	
	// every 30 ticks lets add a new object for spawn box 2
	if(tickCount%30 == 0){
		newObject = spawnBox2.createNewObject()
		stage.addChild(newObject);
	}
	
	// every 40 ticks lets add a new object for spawn box 3
	if(tickCount%40 == 0){
		newObject = spawnBox3.createNewObject()
		stage.addChild(newObject);
	}
	
	// every 150 ticks lets add a new gem for gem 1
	if(tickCount%150 == 0){
		newObject = spawnGem1.createNewObject()
		stage.addChild(newObject);
	}
	
	// every 250 ticks lets add a new object for spawn box 3
	if(tickCount%250 == 0){
		newObject = spawnGem2.createNewObject()
		stage.addChild(newObject);
	}
	

}

function shoot(eventInfo) {
		var newObject;
		newObject = player.spawnShoot.createNewObject()
		stage.addChild(newObject);
}
	

//saving the score
import flash.net.SharedObject;

var score:SharedObject = SharedObject.getLocal("score")
var hiScore:SharedObject = SharedObject.getLocal("hiScore")

score.data.score = count.counterTextField.text;
score.flush();



// keys are almost as simple as the buttons
// but there's only one key listener so we need figure out which key it was
// it's also a good idea to turn the mouse off so it doesn't fight
function handleKeyDown(eventInfo) {
	if(eventInfo.keyCode == 37){ // left
		shouldMoveLeft = true;
	}
	if(eventInfo.keyCode == 39){ // right
		shouldMoveRight = true;
	}
	mouseMove = false;
}
function handleKeyUp(eventInfo) {
	if(eventInfo.keyCode == 37){ // left
		shouldMoveLeft = false;
	}
	if(eventInfo.keyCode == 39){ // right
		shouldMoveRight = false;
	}
}

// the key presses could turn our mouse off with no way to turn it on
// so lets allow moving the mouse to turn it on so it can re-enable
function handleMove(eventInfo) {
	mouseMove = true;
}

//cleaning up the game
function gameOver() {
	stage.removeEventListener(Event.ENTER_FRAME, handleTick);
	stage.removeEventListener(MouseEvent.MOUSE_MOVE, handleMove);
	stage.removeEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown);
	stage.removeEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
	stage.removeEventListener(MouseEvent.CLICK, shoot);
	gotoAndPlay("transitionOver");
}

//scene "gamePlay" frame 97, game over
transitionOut.addEventListener(MouseEvent.CLICK, skipTransition5);

function skipTransition5 (eventInfo) {
	gotoAndPlay(1, "gameOver")
}

for(var i=0; i < spawnBox1.activeObjects.length; i++){
	
	var object = spawnBox1.activeObjects[i];

	spawnBox1.deleteObject(object);
	stage.removeChild(object);
	
	i--;
}

for(i=0; i < spawnBox2.activeObjects.length; i++){
	
	object = spawnBox2.activeObjects[i];

	spawnBox2.deleteObject(object);
	stage.removeChild(object);
	
	i--;
}

for(i=0; i < spawnBox3.activeObjects.length; i++){
	
	object = spawnBox3.activeObjects[i];

	spawnBox3.deleteObject(object);
	stage.removeChild(object);
	
	i--;
}

for(i=0; i < spawnGem1.activeObjects.length; i++){
	
	object = spawnGem1.activeObjects[i];

	spawnGem1.deleteObject(object);
	stage.removeChild(object);
	
	i--;
}

for(i=0; i < spawnGem2.activeObjects.length; i++){
	
	object = spawnGem2.activeObjects[i];

	spawnGem2.deleteObject(object);
	stage.removeChild(object);
	
	i--;
}

for(i=0; i < player.spawnShoot.activeObjects.length; i++){
	
	object = player.spawnShoot.activeObjects[i];

	player.spawnShoot.deleteObject(object);
	stage.removeChild(object);
	
	i--;
}
