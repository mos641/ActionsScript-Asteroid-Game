//Symbol definitions
//variables refer to symbol names and parameters are animated actions


//Instructions frame 50
meteor.gotoAndPlay("hit")
ship.gotoAndPlay("hit")
//Instructions frame 91
meteor.gotoAndPlay("rush")
ship.gotoAndPlay("rush")
//Instructions frame 230
gem.gotoAndPlay("hit")

  
//[Red, Green] Rush frame 1
gotoAndPlay("rush")
//[Red, Green] Rush frame 30
gotoAndPlay("rush")
//[Red, Green] Rush frame 40
stop()
this.parent.removeChild(this);


//Meteor Rush [1 - 6] frame 40
gotoAndPlay("rush")
//Meteor Rush [1 - 6] frame 63
stop();
this.parent.removeChild(this);


//Rocket ship rushing frame 1 Actions
import flash.display.DisplayObject;
import flash.geom.Rectangle;
import flash.display.Bitmap;
import flash.display.BitmapData;

/////////////////////////////////////////////////////
//
//
//		ONLY EDIT IF YOU KNOW WHAT YOU'RE DOING :)
//		you won't have to change this to pass
//
//
/////////////////////////////////////////////////////
// README:
//
//
// 		When you want to find out if things overlap call "checkCollision".
//		Pass in the object you want me to check if I hit, I will return
//		whether the objects overlap as a true/false
// 		Should things run slowly just use hitTestObject instead, it's a
//		built in function that will be less accurate but faster to run.
//
//
////////////////////////////////////////////////////
function checkCollision(object:DisplayObject, simple:Boolean = false):Boolean {
	// there's nothing to collide
	if(!object || (object as Object).dead) { return false; }
	
	// rule out anything that we know can't collide
	if(hitTestObject(object)) { 
		if(simple) { return true; }
	} else {
		return false;
	}

	// get overlap
	var self:Rectangle = this.getBounds(this);
	var bounds:Rectangle = object.getBounds(this);
	
	// set up the image to use
	var img:BitmapData = new BitmapData(stage.stageWidth|0, stage.stageHeight|0, false);
	var mtx:Matrix;

	// draw in the first image
	var rootOffset = root.transform.concatenatedMatrix.clone();
	rootOffset.invert();
	
	mtx = transform.concatenatedMatrix.clone();
	mtx.concat(rootOffset);
	img.draw(this, mtx, new ColorTransform(1,1,1,1, 255,-255,-255, 255));
	
	mtx = object.transform.concatenatedMatrix.clone();
	mtx.concat(rootOffset);
	img.draw(object, mtx, new ColorTransform(1,1,1,1, 255,255,255, 255), "difference");
	
	// find the intersection
	var intersection:Rectangle = img.getColorBoundsRect(0xFFFFFFFF, 0xFF00FFFF);
	
	// if there is no intersection, return false
	return intersection.width != 0;
}
//Rocket ship rushing frame 55 Actions
stop();
this.parent.removeChild(this);
//Rocket ship rushing frame 1 Labels
gotoAndPlay("rush")
//Rocket ship rushing frame 55 Labels
stop()
  

//Shooter frame 1
  import flash.display.DisplayObject;

/////////////////////////////////////////////////////////////////
// README:
//
// All the objects you add to this movie clip will be made into a "list" of objects, using the 
// provided function you can ask for one and I will manage creating one of them at random for you.
//
// YOU MUST "EXPORT FOR ACTIONSCRIPT" THE SMYBOL AS WE USE IT IN CODE OTHERWISE THINGS WONT WORK
//
// You can add the same thing twice, but that just means it will be twice as likely to show up
// I've hidden all the code you don't need to see or care about on srcBox so look there or don't. :)
//
/////////////////////////////////////////////////////////////////

var activeObjects = [bullet];	// I'm an array of all the objects that have been made, loop over me with a "for loop" to do things to all my objects

// call this function when you want to make a new random object ( you'll need to *add* me to the display tree as a *child* )
function createNewObject():DisplayObject {
	return srcBox.createNewObject();
}

// call this function when you want to remove an object from your "active" objects ( don't forget to remove me from the display! )
function deleteObject(object) {
	srcBox.deleteObject(object);
}


//Bullet Frame 1
import flash.display.DisplayObject;
import flash.geom.Rectangle;
import flash.display.Bitmap;
import flash.display.BitmapData;

stop();
/////////////////////////////////////////////////////
//
//
//		ONLY EDIT IF YOU KNOW WHAT YOU'RE DOING :)
//		you won't have to change this to pass
//
//
/////////////////////////////////////////////////////
// README:
//
//
// 		When you want to find out if things overlap call "checkCollision".
//		Pass in the object you want me to check if I hit, I will return
//		whether the objects overlap as a true/false
// 		Should things run slowly just use hitTestObject instead, it's a
//		built in function that will be less accurate but faster to run.
//
//
////////////////////////////////////////////////////
function checkCollision(object:DisplayObject, simple:Boolean = false):Boolean {
	// there's nothing to collide
	if(!object || (object as Object).dead) { return false; }
	
	// rule out anything that we know can't collide
	if(hitTestObject(object)) { 
		if(simple) { return true; }
	} else {
		return false;
	}

	// get overlap
	var self:Rectangle = this.getBounds(this);
	var bounds:Rectangle = object.getBounds(this);
	
	// set up the image to use
	var img:BitmapData = new BitmapData(stage.stageWidth|0, stage.stageHeight|0, false);
	var mtx:Matrix;

	// draw in the first image
	var rootOffset = root.transform.concatenatedMatrix.clone();
	rootOffset.invert();
	
	mtx = transform.concatenatedMatrix.clone();
	mtx.concat(rootOffset);
	img.draw(this, mtx, new ColorTransform(1,1,1,1, 255,-255,-255, 255));
	
	mtx = object.transform.concatenatedMatrix.clone();
	mtx.concat(rootOffset);
	img.draw(object, mtx, new ColorTransform(1,1,1,1, 255,255,255, 255), "difference");
	
	// find the intersection
	var intersection:Rectangle = img.getColorBoundsRect(0xFFFFFFFF, 0xFF00FFFF);
	
	// if there is no intersection, return false
	return intersection.width != 0;
}
//Bullet Frame 2
stop();

//srcBox shooter frame 1
/////////////////////////////////////////////////////
//
//
//		ONLY EDIT IF YOU KNOW WHAT YOU'RE DOING :)
//		you won't have to change this to pass
//
//
/////////////////////////////////////////////////////
import flash.display.DisplayObject;
import flash.geom.Point;

// keep an easy reference to my parent as that's where the other clips are
var target:MovieClip = this.parent as MovieClip;

// create a place to store all the data sources I have
var sources:Array = [];
target.activeObjects = new Vector.<DisplayObject>();

// while it has children
while(target.numChildren){
	// remove them
	var o = target.removeChildAt(0);

	// if they're me, I don't want to store them
	if(this === o){ continue; }

	// otherwise add what type of thing it is (constructor) to the list of things I can make (push)
	sources.push({
		trns: o.alpha,
		ctor: o.constructor,
		mtx: o.transform.matrix
	});
}

// add myself back to the stage, and hide myself
target.addChild(this);
visible = false;

// store this off for easy math
var itemCount = sources.length;

// allow an easy way to make a new source inside the hitbox
function createNewObject():DisplayObject {
	// nothing to make!
	if(itemCount == 0){ return null; }
	
	// get the info randomly from the list
	var randIndex = Math.floor(Math.random() * itemCount);
	var srcData = sources[randIndex];
	
	// make a new object and its properties
	var newObj = new srcData.ctor();
	newObj.transform.matrix = srcData.mtx;
	newObj.alpha = srcData.trns;
	
	// get a random position
	var position:Point = new Point(
		width * Math.random(),
		height * Math.random()
	);
	
	// get the starting position
	var origin = localToGlobal(new Point(0,0));
	
	// use the point's position information
	newObj.x = position.x + origin.x;
	newObj.y = position.y + origin.y;
	
	// add to active list
	target.activeObjects.push(newObj);
	
	// send the new object back
	return newObj;
}

// allow an easy way to get rid of things
function deleteObject(oldObj:DisplayObject) {
	// do nothing if there isn't anything to do something with
	if(!oldObj) { return; }
	(oldObj as Object).dead = true;
	
	// find where what we want to remove is
	var pos = target.activeObjects.indexOf(oldObj);
	
	// remove only it
	target.activeObjects.splice(pos, 1);
}


//Spawn Box frame 1
import flash.display.DisplayObject;

/////////////////////////////////////////////////////////////////
// README:
//
// All the objects you add to this movie clip will be made into a "list" of objects, using the 
// provided function you can ask for one and I will manage creating one of them at random for you.
//
// YOU MUST "EXPORT FOR ACTIONSCRIPT" THE SMYBOL AS WE USE IT IN CODE OTHERWISE THINGS WONT WORK
//
// You can add the same thing twice, but that just means it will be twice as likely to show up
// I've hidden all the code you don't need to see or care about on srcBox so look there or don't. :)
//
/////////////////////////////////////////////////////////////////

var activeObjects = [rock1, rock2, rock3, rock4, rock5, rock6];	// I'm an array of all the objects that have been made, loop over me with a "for loop" to do things to all my objects

// call this function when you want to make a new random object ( you'll need to *add* me to the display tree as a *child* )
function createNewObject():DisplayObject {
	return srcBox.createNewObject();
}

// call this function when you want to remove an object from your "active" objects ( don't forget to remove me from the display! )
function deleteObject(object) {
	srcBox.deleteObject(object);
}

//srcBox frame 1
/////////////////////////////////////////////////////
//
//
//		ONLY EDIT IF YOU KNOW WHAT YOU'RE DOING :)
//		you won't have to change this to pass
//
//
/////////////////////////////////////////////////////
import flash.display.DisplayObject;
import flash.geom.Point;

// keep an easy reference to my parent as that's where the other clips are
var target:MovieClip = this.parent as MovieClip;

// create a place to store all the data sources I have
var sources:Array = [];
target.activeObjects = new Vector.<DisplayObject>();

// while it has children
while(target.numChildren){
	// remove them
	var o = target.removeChildAt(0);

	// if they're me, I don't want to store them
	if(this === o){ continue; }

	// otherwise add what type of thing it is (constructor) to the list of things I can make (push)
	sources.push({
		trns: o.alpha,
		ctor: o.constructor,
		mtx: o.transform.matrix
	});
}

// add myself back to the stage, and hide myself
target.addChild(this);
visible = false;

// store this off for easy math
var itemCount = sources.length;

// allow an easy way to make a new source inside the hitbox
function createNewObject():DisplayObject {
	// nothing to make!
	if(itemCount == 0){ return null; }
	
	// get the info randomly from the list
	var randIndex = Math.floor(Math.random() * itemCount);
	var srcData = sources[randIndex];
	
	// make a new object and its properties
	var newObj = new srcData.ctor();
	newObj.transform.matrix = srcData.mtx;
	newObj.alpha = srcData.trns;
	
	// get a random position
	var position:Point = new Point(
		width * Math.random(),
		height * Math.random()
	);
	
	// get the starting position
	var origin = localToGlobal(new Point(0,0));
	
	// use the point's position information
	newObj.x = position.x + origin.x;
	newObj.y = position.y + origin.y;
	
	// add to active list
	target.activeObjects.push(newObj);
	
	// send the new object back
	return newObj;
}

// allow an easy way to get rid of things
function deleteObject(oldObj:DisplayObject) {
	// do nothing if there isn't anything to do something with
	if(!oldObj) { return; }
	(oldObj as Object).dead = true;
	
	// find where what we want to remove is
	var pos = target.activeObjects.indexOf(oldObj);
	
	// remove only it
	target.activeObjects.splice(pos, 1);
}


//SpawnBox Gem[1,2] Frame 1
import flash.display.DisplayObject;

/////////////////////////////////////////////////////////////////
// README:
//
// All the objects you add to this movie clip will be made into a "list" of objects, using the 
// provided function you can ask for one and I will manage creating one of them at random for you.
//
// YOU MUST "EXPORT FOR ACTIONSCRIPT" THE SMYBOL AS WE USE IT IN CODE OTHERWISE THINGS WONT WORK
//
// You can add the same thing twice, but that just means it will be twice as likely to show up
// I've hidden all the code you don't need to see or care about on srcBox so look there or don't. :)
//
/////////////////////////////////////////////////////////////////

var activeObjects = [gem1];	// I'm an array of all the objects that have been made, loop over me with a "for loop" to do things to all my objects

// call this function when you want to make a new random object ( you'll need to *add* me to the display tree as a *child* )
function createNewObject():DisplayObject {
	return srcBox.createNewObject();
}

// call this function when you want to remove an object from your "active" objects ( don't forget to remove me from the display! )
function deleteObject(object) {
	srcBox.deleteObject(object);
}


//Score frame 1
import fl.motion.easing.Sine;
import fl.transitions.Tween;
import fl.transitions.TweenEvent;
import flash.events.Event;

/////////////////////////////////////////////////////
// README:
//
//
// 		Call "addPoints" or "subPoints" to add or
//		subtract points respectively.
//		Feel free to adjust the max/min or the booleans
//		they'll change the display to your liking
//
////////////////////////////////////////////////////

var maxPoints:Number = Number.MAX_VALUE;
var minPoints:Number = 0;
var currentPoints:Number = 0;

var commaSeperator:Boolean = true;
var forceInteger:Boolean = true;
var animation:Boolean = true;

/////////////////////////////////////////////////////
//
//
//		ONLY EDIT IF YOU KNOW WHAT YOU'RE DOING :)
//		you won't have to change this to pass
//
//
/////////////////////////////////////////////////////
var currentTween:Tween;
var _showPoints:Number = currentPoints;
updatePoints(currentPoints);	// init everything

// add points
function addPoints(count:Number) {
	// get rid of any decimals
	if(forceInteger){ count = count|0; }
	
	// see which number we should update with
	if(currentPoints + count < maxPoints){
		return updatePoints(currentPoints + count);
	} else {
		return updatePoints(maxPoints);
	}
}

// subtract points
function subPoints(count:Number) {
	// get rid of any decimals
	if(forceInteger){ count = count|0; }
	
	// see which number we should update with
	if(currentPoints - count > minPoints){
		return updatePoints(currentPoints - count);
	} else {
		return updatePoints(minPoints);
	}
}

// shared funciton to actually show the value
function updatePoints(count:Number) {
	// update the value
	currentPoints = count;
	
	// how long to take to aniamte the number up
	var time:Number = animation ? 0.64 : 0.01;
	
	// show the update
	if(currentTween){ currentTween.stop(); }
	currentTween = new Tween(this, "_showPoints", Sine.easeOut, _showPoints, currentPoints, time, true);
	currentTween.addEventListener(TweenEvent.MOTION_CHANGE, _handlePointDelta, false, 0, true);
	
	// just be helpfull and give the new value
	return currentPoints;
}

// seperate function for animations sake
function _handlePointDelta(count:Number) {
	// what's the text we're showing
	var src:String = forceInteger ? (_showPoints|0).toString() : _showPoints.toFixed(2);
	
	// setup some numbers
	var string:String = "", remainder:Number;
	var i:Number = 0, l:Number = src.length;
	
	// got across the entire string
	while(i < l) {
		if(i){
			// do we need a comma?
			if(commaSeperator && src.substr(i, 1) != "."){
				string += ",";
			}
			// if it not the first loop then we know we're dealing with blocks of 3
			remainder = 3;
		} else {
			// if it's the first block
			remainder = (l%3) || 3;
			
			// handle negative comma seperators
			if(remainder == 1 && src.substr(0, 1) == "-"){
				remainder = 4;
			}
		}
		
		// keep building the string
		string += src.substr(i, remainder);
		
		// move forward the number of characters we've pulled out
		i += remainder;
	}
	
	// show it
	counterTextField.text = string;
}

//End Rocket Frame 760
gotoAndPlay(1);