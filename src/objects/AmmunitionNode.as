package objects
{
	import flash.geom.Vector3D;
	import flash.media.SoundTransform;
	
	import corez.Assets;
	
	import math.Utilities;
	
	import objects.AmmunitionButton;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Sprite3D;
	import starling.events.Event;
	
	import states.Startup;
	import flash.utils.setTimeout;

	
	public class AmmunitionNode extends Sprite
	{
		//information node
		private var ammoInfo:Sprite3D;
		public var opacitySquare:Image;
		public var imageContainer:Vector.<Image>;
		
		private var oneAmmoLongBar:Image;
		private var oneAmmoMoveSquare:Image;
		private var tweenOneAmmo:Tween;
		
		private var twoAmmoLongBar:Image;
		private var twoAmmoMoveSquare:Image;
		private var tweenTwoAmmo:Tween;
		
		private var threeAmmoLongBar:Image;
		private var threeAmmoMoveSquare:Image;
		private var tweenThreeAmmo:Tween;
		
		private var fourAmmoLongBar:Image;
		private var fourAmmoMoveSquare:Image;
		private var tweenFourAmmo:Tween;
		
		private var dial1:Image;
		private var dialSpine1:Image;
		private var dialSpine2:Image;
		
		private var dial2:Image;
		private var dialSpine3:Image;
		private var dialSpine4:Image;
			
		//circular ammunition node
		private var sphere:Sprite3D;
		private var overlay:Image;
		private var overlayScope:Image;
		private var overlayScopeOuter:Image;
		private var outerOcto:Image;
		private var outerOcto2:Image;
		private var outerGlow:Boolean;
		private var outerGlow2:Boolean;
		
		//up
		private var node90:AmmunitionButton;
		//right
		private var node0:AmmunitionButton;
		//left
		private var node180:AmmunitionButton;
		//down
		private var node270:AmmunitionButton;
		//upright
		private var node45:AmmunitionButton;
		//upleft
		private var node135:AmmunitionButton;
		//down right
		private var node315:AmmunitionButton;
		//down left
		private var node225:AmmunitionButton;
		//conatainer button
		public var aContainer:Vector.<AmmunitionButton>;
		//container tween
		private var tContainer:Vector.<Tween>;
		//vector3D container
		private var vContainer:Vector.<Vector3D>;
		//array tween to hold arguments
		private var iContainer:Array;
		
		//tweens for nodes
		private var tween90:Tween;
		private var tween45:Tween;
		private var tween0:Tween;
		private var tween315:Tween;
		private var tween270:Tween;
		private var tween225:Tween;
		private var tween180:Tween;
		private var tween135:Tween;
		private var tweenSprite:Tween;
		
		//image ammunition
		public var ammunitionCount:Image;
		public var textureContainer:Vector.<Image>;
		private var startup:Startup;
		
		//sphere fade out tween
		private var sphereTween:Tween;
		//information fade out tween
		private var infoTween:Tween;
		
		
		
		
		
		public function AmmunitionNode(startup:Startup)
		{
			this.startup = startup;		
		}
		
		public function AmmNode():void
		{
			Assets.button2.play(0,0,new SoundTransform(1));
			startup.motionActive = true;
			
			if(startup.armorActive)
			{
				startup.armorActive = false;
				startup.removeArmorObject();
			}
			
			if(!startup.ammoActive)
			{
			
			if(startup.winterActive)
			{
				startup.winterActive = false;
				startup.disableWinter();
				startup.activeSpaceBottom();
			}
				
			startup.ammoActive = true;
			Assets.ammo.play();
			
			outerGlow = false;
			outerGlow2 = true;
			
			aContainer = new Vector.<AmmunitionButton>();		
			aContainer.push(node90, node45, node0, node315, node270, node225, node180, node135); 
			
			tContainer = new Vector.<Tween>();		
			tContainer.push(tween90, tween45, tween0, tween315, tween270, tween225, tween180, tween135); 
			
			vContainer = new Vector.<Vector3D>();
			iContainer = new Array;
			
			textureContainer = new Vector.<Image>();
			
			sphere = new Sprite3D();
			sphere.pivotX = sphere.width * 0.5;
			sphere.pivotY = sphere.height * 0.5;
			sphere.x = 600;
			sphere.y = 400;
			this.addChild(sphere);
			
			initAmmoImages();
			
			outerOcto = new Image(Assets.button1textureAtlas.getTexture("outOcto"));
			outerOcto.pivotX = outerOcto.width * 0.5;
			outerOcto.pivotY = outerOcto.height * 0.5;
			outerOcto.alpha = 0;
			outerOcto.x = sphere.pivotX;
			outerOcto.y = sphere.pivotY;
			sphere.addChild(outerOcto);
			
			outerOcto2 = new Image(Assets.button1textureAtlas.getTexture("outOcto2"));
			outerOcto2.pivotX = outerOcto2.width * 0.5;
			outerOcto2.pivotY = outerOcto2.height * 0.5;
			outerOcto2.x = sphere.pivotX;
			outerOcto2.alpha = 1;
			outerOcto2.y = sphere.pivotY;
			sphere.addChild(outerOcto2);
			
			overlay = new Image(Assets.button1textureAtlas.getTexture("AmmMainNode"));
			overlay.pivotX = overlay.width * 0.5;
			overlay.pivotY = overlay.height * 0.5;
			overlay.x = sphere.pivotX;
			overlay.y = sphere.pivotY;
			sphere.addChild(overlay);
			
			overlayScope = new Image(Assets.button1textureAtlas.getTexture("AmmNodeScope"));
			overlayScope.pivotX = overlayScope.width * 0.5;
			overlayScope.pivotY = overlayScope.height * 0.5;
			overlayScope.x = sphere.pivotX;
			overlayScope.y = sphere.pivotY;
			sphere.addChild(overlayScope);
			
			overlayScopeOuter = new Image(Assets.button1textureAtlas.getTexture("AmmNodeScopeOuter"));
			overlayScopeOuter.pivotX = overlayScopeOuter.width * 0.5;
			overlayScopeOuter.pivotY = overlayScopeOuter.height * 0.5;
			overlayScopeOuter.x = sphere.pivotX;
			overlayScopeOuter.y = sphere.pivotY;
			sphere.addChild(overlayScopeOuter);
			
			findPoints();
			syncButton();
			addNodeTween(0);
			runRotationSphere(0);
			
			//ammo info goes here
			setTimeout(startup.fadeoutgunHud,1775);
			imageContainer = new Vector.<Image>();
			createInformationNode();
			createInformationTween(startup.ammoIcon);
			}
			else
			{
			startup.ammoActive = false;
			startup.motionActive = false;
			disableAmmNode();
			}
			
		}
		public function disableAmmNode():void
		{
			saveAmmoSelection();
			
			startup.fadeingunHud();
			
			sphereTween = new Tween(sphere,.5);
			sphereTween.animate("alpha",0);
			sphereTween.onComplete = removeSphere;
			Starling.juggler.add(sphereTween);
			
			infoTween = new Tween(ammoInfo,.5);
			infoTween.animate("alpha",0);
			Starling.juggler.add(infoTween);
			
		}
		public function shutdownAmmNode():void
		{
			saveAmmoSelection();
			
			sphereTween = new Tween(sphere,.5);
			sphereTween.animate("alpha",0);
			sphereTween.onComplete = removeSphere;
			Starling.juggler.add(sphereTween);
			
			infoTween = new Tween(ammoInfo,.5);
			infoTween.animate("alpha",0);
			Starling.juggler.add(infoTween);
		}
		public function removeSphere():void
		{
			this.removeChild(sphere);
			sphere = null;
			
			this.removeChild(ammoInfo);
			ammoInfo = null;
		}

		public function createInformationTween(value:int):void
		{
			infoTween = new Tween(ammoInfo,.35);
			infoTween.delay = 4;
			infoTween.animate("alpha",1);
			infoTween.onComplete = setActiveAmmo;
			infoTween.onCompleteArgs = [value];
			Starling.juggler.add(infoTween);
			
			
			setTimeout(setMotion, 4100);
		}
		public function setMotion():void
		{
			startup.motionActive = false;
		}
		public function createInformationNode():void
		{
			
			ammoInfo = new Sprite3D();
			ammoInfo.pivotX = ammoInfo.width * 0.5;
			ammoInfo.pivotY = ammoInfo.height * 0.5;
			ammoInfo.x = 155;
			ammoInfo.y = 400;
			//ammoInfo.rotationY = -0.436332;
			ammoInfo.alpha = 0;
			this.addChild(ammoInfo);
			
			//load each ammunition information image into vector(imageContainer)
			loadInfo();
			
			//starting from the bottom under uses
			fourAmmoLongBar = new Image(Assets.suittextureplusAtlas.getTexture("ammoLongBar"));
			fourAmmoLongBar.pivotX = fourAmmoLongBar.width * 0.5;
			fourAmmoLongBar.pivotY = fourAmmoLongBar.height * 0.5;
			fourAmmoLongBar.x = 0;
			fourAmmoLongBar.y = 25;
			fourAmmoLongBar.scale = .35;
			fourAmmoLongBar.alpha = .7;
			ammoInfo.addChild(fourAmmoLongBar);
			
			fourAmmoMoveSquare = new Image(Assets.suittextureplusAtlas.getTexture("ammoMovementSquare"));
			fourAmmoMoveSquare.pivotX = fourAmmoMoveSquare.width * 0.5;
			fourAmmoMoveSquare.pivotY = fourAmmoMoveSquare.height * 0.5;
			fourAmmoMoveSquare.x = 0;
			fourAmmoMoveSquare.y = 25;
			fourAmmoMoveSquare.scale = .35;
			fourAmmoMoveSquare.alpha = .8;
			ammoInfo.addChild(fourAmmoMoveSquare);
			
			oneAmmoLongBar = new Image(Assets.suittextureplusAtlas.getTexture("ammoLongBar"));
			oneAmmoLongBar.pivotX = oneAmmoLongBar.width * 0.5;
			oneAmmoLongBar.pivotY = oneAmmoLongBar.height * 0.5;
			oneAmmoLongBar.x = 0;
			oneAmmoLongBar.y = -50;
			oneAmmoLongBar.scale = .35;
			oneAmmoLongBar.alpha = .7;
			ammoInfo.addChild(oneAmmoLongBar);
			
			oneAmmoMoveSquare = new Image(Assets.suittextureplusAtlas.getTexture("ammoMovementSquare"));
			oneAmmoMoveSquare.pivotX = oneAmmoMoveSquare.width * 0.5;
			oneAmmoMoveSquare.pivotY = oneAmmoMoveSquare.height * 0.5;
			oneAmmoMoveSquare.x = 0;
			oneAmmoMoveSquare.y = -50;
			oneAmmoMoveSquare.scale = .35;
			oneAmmoMoveSquare.alpha = .8;
			ammoInfo.addChild(oneAmmoMoveSquare);
			
			twoAmmoLongBar = new Image(Assets.suittextureplusAtlas.getTexture("ammoLongBar"));
			twoAmmoLongBar.pivotX = twoAmmoLongBar.width * 0.5;
			twoAmmoLongBar.pivotY = twoAmmoLongBar.height * 0.5;
			twoAmmoLongBar.x = 0;
			twoAmmoLongBar.y = -135;
			twoAmmoLongBar.scale = .35;
			twoAmmoLongBar.alpha = .7;
			ammoInfo.addChild(twoAmmoLongBar);
			
			twoAmmoMoveSquare = new Image(Assets.suittextureplusAtlas.getTexture("ammoMovementSquare"));
			twoAmmoMoveSquare.pivotX = twoAmmoMoveSquare.width * 0.5;
			twoAmmoMoveSquare.pivotY = twoAmmoMoveSquare.height * 0.5;
			twoAmmoMoveSquare.x = 0;
			twoAmmoMoveSquare.y = -135;
			twoAmmoMoveSquare.scale = .35;
			twoAmmoMoveSquare.alpha = .8;
			ammoInfo.addChild(twoAmmoMoveSquare);
			
			threeAmmoLongBar = new Image(Assets.suittextureplusAtlas.getTexture("ammoLongBar"));
			threeAmmoLongBar.pivotX = threeAmmoLongBar.width * 0.5;
			threeAmmoLongBar.pivotY = threeAmmoLongBar.height * 0.5;
			threeAmmoLongBar.x = 0;
			threeAmmoLongBar.y = -215;
			threeAmmoLongBar.scale = .35;
			threeAmmoLongBar.alpha = .7;
			ammoInfo.addChild(threeAmmoLongBar);
			
			threeAmmoMoveSquare = new Image(Assets.suittextureplusAtlas.getTexture("ammoMovementSquare"));
			threeAmmoMoveSquare.pivotX = threeAmmoMoveSquare.width * 0.5;
			threeAmmoMoveSquare.pivotY = threeAmmoMoveSquare.height * 0.5;
			threeAmmoMoveSquare.x = 0;
			threeAmmoMoveSquare.y = -215;
			threeAmmoMoveSquare.scale = .35;
			threeAmmoMoveSquare.alpha = .8;
			ammoInfo.addChild(threeAmmoMoveSquare);
			
			
			//dial movements
			dial1 = new Image(Assets.button1textureAtlas.getTexture("AmmMovementCircle"));
			dial1.pivotX = dial1.width * 0.5;
			dial1.pivotY = dial1.height * 0.5;
			dial1.x = -50;
			dial1.y = 200;
			dial1.scale = .9;
			ammoInfo.addChild(dial1);
			
			dialSpine1 = new Image(Assets.button1textureAtlas.getTexture("AmmMovementCircleSpines"));
			dialSpine1.pivotX = dialSpine1.width * 0.5;
			dialSpine1.pivotY = dialSpine1.height * 0.5;
			dialSpine1.x = -50;
			dialSpine1.y = 200;
			dialSpine1.scale = .9;
			ammoInfo.addChild(dialSpine1);
			
			dialSpine2 = new Image(Assets.button1textureAtlas.getTexture("AmmMovementCircleSpines"));
			dialSpine2.pivotX = dialSpine2.width * 0.5;
			dialSpine2.pivotY = dialSpine2.height * 0.5;
			dialSpine2.x = -50;
			dialSpine2.y = 200;
			dialSpine2.scale = .9;
			ammoInfo.addChild(dialSpine2);
			
			//dial2 movements
			dial2 = new Image(Assets.button1textureAtlas.getTexture("AmmMovementCircle"));
			dial2.pivotX = dial2.width * 0.5;
			dial2.pivotY = dial2.height * 0.5;
			dial2.x = 60;
			dial2.y = 200;
			dial2.scale = .9;
			ammoInfo.addChild(dial2);
			
			dialSpine3 = new Image(Assets.button1textureAtlas.getTexture("AmmMovementCircleSpines"));
			dialSpine3.pivotX = dialSpine3.width * 0.5;
			dialSpine3.pivotY = dialSpine3.height * 0.5;
			dialSpine3.x = 60;
			dialSpine3.y = 200;
			dialSpine3.scale = .9;
			ammoInfo.addChild(dialSpine3);
			
			dialSpine4 = new Image(Assets.button1textureAtlas.getTexture("AmmMovementCircleSpines"));
			dialSpine4.pivotX = dialSpine4.width * 0.5;
			dialSpine4.pivotY = dialSpine4.height * 0.5;
			dialSpine4.x = 60;
			dialSpine4.y = 200;
			dialSpine4.scale = .9;
			ammoInfo.addChild(dialSpine4);
			
			MoveForward1();
			MoveForward2();
			MoveForward3();
			MoveForward4();
			
		}
		public function saveAmmoSelection():void
		{
			
			if(startup.ammoIcon != 9)
			{
			for(var z:int = 0;z < aContainer.length; z++)
			{
				
				if(aContainer[z].active == true && aContainer[z].rotatorInActive == true)
				{
					startup.ammoIcon = z;
				}
				
			}
			}
		}
		public function update():void
		{
			if(dialSpine1 != null)
				dialSpine1.rotation += .003;
			
			if(dialSpine2 != null)
				dialSpine2.rotation -= .003;
			
			if(dialSpine3 != null)
				dialSpine3.rotation -= .003;
			
			if(dialSpine4 != null)
				dialSpine4.rotation += .003;
			
			if(overlayScope != null)
			overlayScope.rotation += .003;
			
			if(overlayScopeOuter != null)
			overlayScopeOuter.rotation -= .003;
			
			//outerocto
			if(outerOcto != null)
			if(outerOcto.alpha == 1)
				outerGlow = true;
			
			if(outerOcto != null)
			if(outerOcto.alpha == 0)
				outerGlow = false;
			
			if(outerOcto != null)
			if(outerGlow == false)
				upGLOW();
			
			if(outerOcto != null)
			if(outerGlow == true)
				downGLOW();
			
			//outerocto2
			if(outerOcto2 != null)
			if(outerOcto2.alpha == 1)
				outerGlow2 = true;
			
			if(outerOcto2 != null)
			if(outerOcto2.alpha == 0)
				outerGlow2 = false;
			
			if(outerOcto2 != null)
			if(outerGlow2 == false)
				upGLOW2();
			
			if(outerOcto2 != null)
			if(outerGlow2 == true)
				downGLOW2();
			
			
			
		}
		public function addNodeTween(i:int):void
		{
			
			
			if(i < 8)
			{	
				tContainer[i] = new Tween(aContainer[i],.45);
				tContainer[i].animate("x",vContainer[i].x);
				tContainer[i].animate("y",vContainer[i].y);
				tContainer[i].animate("alpha",1);
				tContainer[i].onComplete = addNodeTween;
				tContainer[i].onCompleteArgs = [i + 1];
				Starling.juggler.add(tContainer[i]);		
			}
			else
			{
				for(var z:int = 0;z < aContainer.length; z++)
				{
					aContainer[z].type.alpha = 1;
				}
			}
		}
		public function runRotationSphere(i:int):void
		{
			if(i < 9)
			{
				tweenSprite = new Tween(sphere,.45);
				tweenSprite.animate("rotationZ", sphere.rotation + -0.785398);
				tweenSprite.onComplete = runRotationSphere;
				tweenSprite.onCompleteArgs = [i + 1];
				Starling.juggler.add(tweenSprite);
			}
		}
		public function findPoints():void
		{
			var vect:Vector3D = new Vector3D(0,-1,0);
			
			for(var i:int = 0; i < 8; i++)
			{
				vect.normalize();
				vect.scaleBy(148);
				vContainer.push(new Vector3D(vect.x,vect.y,vect.z));
				var t:Vector3D = Utilities.rotateBy(vect,0.785398);
				vect.x = t.x;
				vect.y = t.y;
			}
		}
		public function initAmmoImages():void
		{
			
			for(var i:int = 0; i < 8; i++)
			{
				ammunitionCount = new Image(Assets.button1textureAtlas.getTexture("AMMO_0" + i));
				ammunitionCount.pivotX = ammunitionCount.width * 0.5;
				ammunitionCount.pivotY = ammunitionCount.height * 0.5;
				ammunitionCount.x = sphere.pivotX;
				ammunitionCount.y = sphere.pivotY;
				ammunitionCount.alpha = 0;
				ammunitionCount.rotation = 0.785398;
				sphere.addChild(ammunitionCount);
				textureContainer.push(ammunitionCount);
				
			}
		
		}
		public function syncButton():void
		{
			for(var i:int = 0;i < aContainer.length; i++)
			{
				aContainer[i] = new AmmunitionButton(this, i);
				aContainer[i].addAmmoIcon(Assets.button1textureAtlas.getTexture("TYPE_0" + i));
				aContainer[i].name = "" + i;
				aContainer[i].addEventListener(Event.TRIGGERED, aContainer[i].rotatorIn);
				aContainer[i].scale = 1;
				aContainer[i].alpha = 0;
				sphere.addChild(aContainer[i]);
			}
		}
		public function loadInfo():void
		{
			for(var i:int = 0;i < 8; i++)
			{
				opacitySquare = new Image(Assets.suittextureplusAtlas.getTexture("AMM_0" + i));
				opacitySquare.name = "" + i;
				opacitySquare.pivotX = opacitySquare.width * 0.5;
				opacitySquare.pivotY = opacitySquare.height * 0.5;
				opacitySquare.alpha = 0;
				opacitySquare.x = ammoInfo.pivotX;
				opacitySquare.y = ammoInfo.pivotY;
				ammoInfo.addChild(opacitySquare);
				imageContainer.push(opacitySquare);
			}
		}
		public function setActiveAmmo(i:int):void
		{
			if(i == 9)
			{
					aContainer[1].setSelection();
					imageContainer[1].alpha = .8;
					textureContainer[1].alpha = 1;
					startup.ammoIcon = 1;
			}
			else
			{
				for(var z:int = 0;z < aContainer.length; z++)
				{
					if(i == z)
					{
						aContainer[z].setSelection();
						imageContainer[z].alpha = .8;
						textureContainer[z].alpha = 1;
					}
				}
			}
		}
		public function upGLOW():void
		{
			outerOcto.alpha += .01;
		}
		public function downGLOW():void
		{
			outerOcto.alpha -= .01;
		}
		public function upGLOW2():void
		{
			outerOcto2.alpha += .01;
		}
		public function downGLOW2():void
		{
			outerOcto2.alpha -= .01;
		}
		public function generateRandom(lower:int, higher:int):Number
		{
			var minLimit:int = lower;
			var maxLimit:int = higher;
			var range:int = maxLimit - minLimit;
			var randomNumber:Number = Math.ceil(Math.random()*range) + minLimit;
			return randomNumber;
		}
		public function MoveForward1():void
		{
			var randomNumber:Number = generateRandom(-40,50);
			
			tweenOneAmmo = new Tween(oneAmmoMoveSquare,1);
			tweenOneAmmo.animate("x",randomNumber);
			tweenOneAmmo.onComplete = MoveBack1;
			Starling.juggler.add(tweenOneAmmo);
		}
		public function MoveBack1():void
		{
			var randomNumber:Number = generateRandom(-40,50);
			
			tweenOneAmmo = new Tween(oneAmmoMoveSquare,1);
			tweenOneAmmo.animate("x",randomNumber);
			tweenOneAmmo.onComplete = MoveForward1;
			Starling.juggler.add(tweenOneAmmo);
		}
		public function MoveForward2():void
		{
			var randomNumber:Number = generateRandom(-40,50);
			
			tweenTwoAmmo = new Tween(twoAmmoMoveSquare,.75);
			tweenTwoAmmo.animate("x",randomNumber);
			tweenTwoAmmo.onComplete = MoveBack2;
			Starling.juggler.add(tweenTwoAmmo);
		}
		public function MoveBack2():void
		{
			var randomNumber:Number = generateRandom(-40,50);
			
			tweenTwoAmmo = new Tween(twoAmmoMoveSquare,1);
			tweenTwoAmmo.animate("x",randomNumber);
			tweenTwoAmmo.onComplete = MoveForward2;
			Starling.juggler.add(tweenTwoAmmo);
		}
		public function MoveForward3():void
		{
			var randomNumber:Number = generateRandom(-40,50);
			
			tweenThreeAmmo = new Tween(threeAmmoMoveSquare,1);
			tweenThreeAmmo.animate("x",randomNumber);
			tweenThreeAmmo.onComplete = MoveBack3;
			Starling.juggler.add(tweenThreeAmmo);
		}
		public function MoveBack3():void
		{
			var randomNumber:Number = generateRandom(-40,50);
			
			tweenThreeAmmo = new Tween(threeAmmoMoveSquare,1.25);
			tweenThreeAmmo.animate("x",randomNumber);
			tweenThreeAmmo.onComplete = MoveForward3;
			Starling.juggler.add(tweenThreeAmmo);
		}
		public function MoveForward4():void
		{
			var randomNumber:Number = generateRandom(-40,50);
			
			tweenFourAmmo = new Tween(fourAmmoMoveSquare,1);
			tweenFourAmmo.animate("x",randomNumber);
			tweenFourAmmo.onComplete = MoveBack4;
			Starling.juggler.add(tweenFourAmmo);
		}
		public function MoveBack4():void
		{
			var randomNumber:Number = generateRandom(-40,50);
			
			tweenFourAmmo = new Tween(fourAmmoMoveSquare,1);
			tweenFourAmmo.animate("x",randomNumber);
			tweenFourAmmo.onComplete = MoveForward4;
			Starling.juggler.add(tweenFourAmmo);
		}
		
		
	}
}