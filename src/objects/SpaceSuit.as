package objects
{
	import corez.Assets;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.display.Sprite3D;
	import starling.events.Event;
	import starling.text.TextField;
	
	import states.Startup;
	import flash.media.SoundTransform;
	
	
	public class SpaceSuit extends Sprite
	{
		private var state:Startup;
		private var topDots:Image;
		private var bottomDots:Image;
		private var bottomInfoModule:Image;
		private var topInfoModule:Image;
		private var oxygenConnectedText:TextField;
		private var textContainer:Sprite3D;
		private var topDotsWinter:Image;
		private var bottomDotsWinter:Image;
		
		//bottom shell info
		private var bottominfoShell:Image;
		private var OXYGEN:MovieClip
		private var OXYNUMBERS:MovieClip;
		private var PRESSURENUMBERS:MovieClip;
		//system diagnostics
		private var systemDiagnostics:Image;
		private var SYSTEMDIAGNOSTICTEXT:MovieClip;
		//top modules
		private var topinfoShell:Image;
		public var LIQUID:MovieClip;
		//COOLING
		private var leftCoolingWhite:Image;
		private var leftCoolingTeal:Image;
		private var rightCoolingWhite:Image;
		private var rightCoolingTeal:Image;
		private var middleCoolingWhite:Image;
		private var middleCoolingTeal:Image;
		private var middleCoolingWhite3D:Sprite3D;
		private var tweenCooling:Tween;
		private var tweenCoolingleftWhite:Tween;
		private var tweenCoolingleftTeal:Tween;
		private var tweenCoolingrightWhite:Tween;
		private var tweenCoolingrightTeal:Tween;
		private var tweenCoolingmiddleSprite:Tween;
		
		//dashboard
		public var dashBoard:Image;
		
		//tween of bottom info module
		private var tPRESSURENUMBERS:Tween;
		private var tOXYGEN:Tween;
		private var tOXYNUMBERS:Tween;
		private var tsystemDiagnostics:Tween;
		private var tbottominfoShell:Tween;
		private var tbottomInfoModule:Tween;
		private var tSYSTEMDIAGNOSTICTEXT:Tween;
		
		//helpers
		private var gunHelper:Image;
		private var gunHelperTween:Tween;
		private var stimHelper:Image;
		private var stimHelperTween:Tween;
		private var combatHelper:Image;
		private var combatHelperTween:Tween;
		private var ammoHelper:Image;
		private var ammoHelperTween:Tween;
		
		private var solarHelper:Image;
		private var solarHelperTween:Tween;
		private var ammoNodeHelper:Image;
		private var ammoNodeHelperTween:Tween;
		private var armorHelper:Image;
		private var armorHelperTween:Tween;
		private var winterHelper:Image;
		private var winterHelperTween:Tween;
		
		private var topDotsT:Tween;
		private var bottomDotsT:Tween;
		
		
		public function SpaceSuit(state:Startup)
		{
			this.state = state;
			//top
			topDots = new Image(Assets.suittextureplusAtlas.getTexture("suitTop2"));
			topDots.pivotX = topDots.width * 0.5;
			topDots.pivotY = (topDots.height * 0.5) + 90;
			topDots.x = 600;
			topDots.y = 400;
			topDots.scale = .95;
			this.addChild(topDots);
			
			//top Winter
			topDotsWinter = new Image(Assets.suittextureplusAtlas.getTexture("suitTopWinter"));
			topDotsWinter.pivotX = topDotsWinter.width * 0.5;
			topDotsWinter.pivotY = (topDotsWinter.height * 0.5) + 90;
			topDotsWinter.x = 600;
			topDotsWinter.y = 400;
			topDotsWinter.scale = .95;
			topDotsWinter.alpha = 0;
			this.addChild(topDotsWinter);
			
			//info module
			topInfoModule = new Image(Assets.suittextureplusAtlas.getTexture("InfoModuleTop"));
			topInfoModule.pivotX = topInfoModule.width * 0.5;
			topInfoModule.pivotY = (topInfoModule.height * 0.5) + 90;
			topInfoModule.x = 600;
			topInfoModule.y = 400;
			topInfoModule.scale = .95;
			this.addChild(topInfoModule);
			
			//information shell
			topinfoShell = new Image(Assets.suittextureplusAtlas.getTexture("InformationTopShell"));
			topinfoShell.pivotX = topinfoShell.width * 0.5;
			topinfoShell.pivotY = (topinfoShell.height * 0.5) + 90;
			topinfoShell.x = 600;
			topinfoShell.y = 400;
			topinfoShell.scale = .95;
			this.addChild(topinfoShell);
							
			//left cooling TEAL --->
			leftCoolingTeal = new Image(Assets.button1textureAtlas.getTexture("coolingcircteal"));
			leftCoolingTeal.pivotY = leftCoolingTeal.height * 0.5;
			leftCoolingTeal.pivotX = leftCoolingTeal.width * 0.5;
			leftCoolingTeal.x = 502;
			leftCoolingTeal.y = 54;
			leftCoolingTeal.scale = .5;
			leftCoolingTeal.alpha = 0;
			this.addChild(leftCoolingTeal);
			
			//left cooling WHITE --->
			leftCoolingWhite = new Image(Assets.button1textureAtlas.getTexture("coolingcircwhite"));
			leftCoolingWhite.pivotY = leftCoolingWhite.height * 0.5;
			leftCoolingWhite.pivotX = leftCoolingWhite.width * 0.5;
			leftCoolingWhite.x = 502;
			leftCoolingWhite.y = 54;
			leftCoolingWhite.scale = .5;
			leftCoolingWhite.alpha = 0;
			this.addChild(leftCoolingWhite);
			
			//right cooling TEAL --->
			rightCoolingTeal = new Image(Assets.button1textureAtlas.getTexture("coolingcircteal"));
			rightCoolingTeal.pivotY = rightCoolingTeal.height * 0.5;
			rightCoolingTeal.pivotX = rightCoolingTeal.width * 0.5;
			rightCoolingTeal.x = 697;
			rightCoolingTeal.y = 54;
			rightCoolingTeal.scale = .5;
			rightCoolingTeal.alpha = 0;
			this.addChild(rightCoolingTeal);
			
			//right cooling WHITE --->
			rightCoolingWhite = new Image(Assets.button1textureAtlas.getTexture("coolingcircwhite"));
			rightCoolingWhite.pivotY = rightCoolingWhite.height * 0.5;
			rightCoolingWhite.pivotX = rightCoolingWhite.width * 0.5;
			rightCoolingWhite.x = 697;
			rightCoolingWhite.y = 54;
			rightCoolingWhite.scale = .5;
			rightCoolingWhite.alpha = 0;
			this.addChild(rightCoolingWhite);
					
		
			//MIDDLE COOLING SYSTEM -->
			middleCoolingWhite3D = new Sprite3D();
			middleCoolingWhite3D.pivotX = middleCoolingWhite3D.width * 0.5;
			middleCoolingWhite3D.pivotY = middleCoolingWhite3D.height * 0.5;
			middleCoolingWhite3D.x = 600;
			middleCoolingWhite3D.y = 54;
			middleCoolingWhite3D.alpha = 0;
			this.addChild(middleCoolingWhite3D);
			middleCoolingWhite = new Image(Assets.button1textureAtlas.getTexture("coolingcircwhite"));
			middleCoolingWhite.pivotY = middleCoolingWhite.height * 0.5;
			middleCoolingWhite.pivotX = middleCoolingWhite.width * 0.5;
			middleCoolingWhite.scale = .5;
			middleCoolingWhite3D.addChild(middleCoolingWhite);
			middleCoolingTeal = new Image(Assets.button1textureAtlas.getTexture("coolingcircteal"));
			middleCoolingTeal.pivotY = middleCoolingTeal.height * 0.5;
			middleCoolingTeal.pivotX = middleCoolingTeal.width * 0.5;
			middleCoolingTeal.scale = .5;
			middleCoolingTeal.x = 600;
			middleCoolingTeal.y = 54;
			this.addChild(middleCoolingTeal);
				
			//END TOP MODULE
			//---------------------------------------------->
			//BEGIN BOTTOM MODULE
			
			//bottom space suit MODULE -> DOTS
			bottomDots = new Image(Assets.suittextureplusAtlas.getTexture("suitBottom2"));
			bottomDots.pivotX = bottomDots.width * 0.5;
			bottomDots.pivotY = (bottomDots.height * 0.5) - 90;
			bottomDots.x = 600;
			bottomDots.y = 400;
			bottomDots.scale = .95;
			this.addChild(bottomDots);
			
			bottomDotsWinter = new Image(Assets.suittextureplusAtlas.getTexture("suitBottomWinter"));
			bottomDotsWinter.pivotX = bottomDotsWinter.width * 0.5;
			bottomDotsWinter.pivotY = (bottomDotsWinter.height * 0.5) - 90;
			bottomDotsWinter.x = 600;
			bottomDotsWinter.y = 400;
			bottomDotsWinter.scale = .95;
			bottomDotsWinter.alpha = 0;
			this.addChild(bottomDotsWinter);
			bottomDotsWinter
			
			//bottom -> INFOMODULE
			bottomInfoModule = new Image(Assets.suittextureplusAtlas.getTexture("InfoModuleBottom"));
			bottomInfoModule.pivotX = bottomInfoModule.width * 0.5;
			bottomInfoModule.pivotY = (bottomInfoModule.height * 0.5) - 90;
			bottomInfoModule.x = 600;
			bottomInfoModule.y = 400;
			bottomInfoModule.scale = .95;
			this.addChild(bottomInfoModule);
			
			//bottom shell information -> SHELL
			bottominfoShell = new Image(Assets.suittextureplusAtlas.getTexture("InformationBottomShell"));
			bottominfoShell.pivotX = bottominfoShell.width * 0.5;
			bottominfoShell.pivotY = (bottominfoShell.height * 0.5) - 90;
			bottominfoShell.x = 600;
			bottominfoShell.y = 400;
			bottominfoShell.scale = .95;
			this.addChild(bottominfoShell);
			
			//system diagnostic brackets
			systemDiagnostics = new Image(Assets.suittextureplusAtlas.getTexture("SystemDiagnosticBrackets"));
			systemDiagnostics.pivotX = systemDiagnostics.width * 0.5;
			systemDiagnostics.pivotY = (systemDiagnostics.height * 0.5) - 90;
			systemDiagnostics.x = 600;
			systemDiagnostics.y = 400;
			systemDiagnostics.scale = .95;
			this.addChild(systemDiagnostics);
			
			//OXYGEN IMAGE STREAMED / CONNECTED
			OXYGEN = new MovieClip(Assets.suittextureplusAtlas.getTextures("OXY_01"));
			OXYGEN.setFrameDuration(0,5.0);
			OXYGEN.addFrame(Assets.suittextureplusAtlas.getTexture("OXY_00"),null,5.0);
			OXYGEN.addFrame(Assets.suittextureplusAtlas.getTexture("OXY_02"),null,5.0);
			OXYGEN.addFrame(Assets.suittextureplusAtlas.getTexture("OXY_03"),null,5.0);
			OXYGEN.addFrame(Assets.suittextureplusAtlas.getTexture("OXY_04"),null,5.0);
			OXYGEN.loop = true;
			OXYGEN.pivotX = OXYGEN.width * 0.5;
			OXYGEN.pivotY = (OXYGEN.height * 0.5) - 90;
			OXYGEN.x = 600;
			OXYGEN.y = 400;
			OXYGEN.scale = .95;
			this.addChild(OXYGEN);
			Starling.juggler.add(OXYGEN);
			
			OXYNUMBERS = new MovieClip(Assets.textureLOGAtlas.getTextures("NUM_00"),12);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_01"),null,0.3);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_02"),null,0.4);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_03"),null,0.3);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_04"),null,0.4);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_05"),null,0.5);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_06"),null,0.6);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_07"),null,0.4);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_08"),null,0.6);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_09"),null,0.2);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_10"),null,0.75);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_11"),null,0.6);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_12"),null,0.5);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_13"),null,0.75);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_14"),null,0.85);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_15"),null,0.67);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_16"),null,0.75);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_17"),null,0.5);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_18"),null,0.6);
			OXYNUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_19"),null,5.0);
			OXYNUMBERS.loop = true;
			OXYNUMBERS.pivotX = OXYNUMBERS.width * 0.5;
			OXYNUMBERS.pivotY = (OXYNUMBERS.height * 0.5) - 90;
			OXYNUMBERS.x = 600;
			OXYNUMBERS.y = 400;
			OXYNUMBERS.scale = .95;
			this.addChild(OXYNUMBERS);
			Starling.juggler.add(OXYNUMBERS);
			
			PRESSURENUMBERS = new MovieClip(Assets.textureLOGAtlas.getTextures("NUM_19"),12);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_00"),null,0.36);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_18"),null,0.49);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_01"),null,0.35);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_17"),null,0.75);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_02"),null,0.6);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_16"),null,0.1);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_03"),null,0.65);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_15"),null,0.6);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_04"),null,0.2);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_14"),null,0.75);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_05"),null,0.6);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_13"),null,0.5);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_06"),null,0.75);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_00"),null,0.85);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_01"),null,0.67);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_02"),null,0.75);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_03"),null,0.5);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_04"),null,0.6);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_05"),null,1.0);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_12"),null,0.67);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_11"),null,0.75);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_10"),null,0.5);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_05"),null,0.6);
			PRESSURENUMBERS.addFrame(Assets.textureLOGAtlas.getTexture("NUM_04"),null,6.0);
			PRESSURENUMBERS.loop = true;
			PRESSURENUMBERS.pivotX = PRESSURENUMBERS.width * 0.5;
			PRESSURENUMBERS.pivotY = (PRESSURENUMBERS.height * 0.5) - 90;
			PRESSURENUMBERS.x = 718;
			PRESSURENUMBERS.y = 400;
			PRESSURENUMBERS.scale = .95;
			this.addChild(PRESSURENUMBERS);
			Starling.juggler.add(PRESSURENUMBERS);
			
			//dashboard for buttons
			dashBoard = new Image(Assets.suittextureplusAtlas.getTexture("Dashboard"));
			dashBoard.pivotX = dashBoard.width * 0.5;
			dashBoard.pivotY = (dashBoard.height * 0.5);
			dashBoard.x = 600;
			dashBoard.y = 488;
			dashBoard.scale = .95;
			this.addChild(dashBoard);
			
		
		}
		public function playHUD():void
		{
			OXYGEN.play();
			OXYNUMBERS.play();
			PRESSURENUMBERS.play();
			createDiagnostics();
			
			//tween cooling LEFT
			tweenCoolingleftWhite = new Tween(leftCoolingWhite,1.0);
			tweenCoolingleftWhite.delay = 4.0;
			tweenCoolingleftWhite.animate("alpha", 1);
			Starling.juggler.add(tweenCoolingleftWhite);
			
			tweenCoolingleftTeal = new Tween(leftCoolingTeal,1.0);
			tweenCoolingleftTeal.delay = 3.0;
			tweenCoolingleftTeal.animate("alpha", 1);
			Starling.juggler.add(tweenCoolingleftTeal);
			
			//tween cooling RIGHT
			tweenCoolingrightWhite = new Tween(rightCoolingWhite,1.0);
			tweenCoolingrightWhite.delay = 4.0;
			tweenCoolingrightWhite.animate("alpha", 1);
			Starling.juggler.add(tweenCoolingrightWhite);
			
			tweenCoolingrightTeal = new Tween(rightCoolingTeal,1.0);
			tweenCoolingrightTeal.delay = 3.0;
			tweenCoolingrightTeal.animate("alpha", 1);
			Starling.juggler.add(tweenCoolingrightTeal);
			
			//tween cooling MIDDLE
			tweenCoolingmiddleSprite = new Tween(middleCoolingWhite3D,1.0);
			tweenCoolingmiddleSprite.delay = 4.5;
			tweenCoolingmiddleSprite.animate("alpha", 1);
			Starling.juggler.add(tweenCoolingmiddleSprite);
				
		}
		public function pauseHUD():void
		{
			OXYGEN.pause();
			OXYNUMBERS.pause();
			PRESSURENUMBERS.pause();
			disableDiagnostics();
			leftCoolingWhite.alpha = 0;
			leftCoolingTeal.alpha = 0;
			rightCoolingWhite.alpha = 0;
			rightCoolingTeal.alpha = 0;
			middleCoolingWhite3D.alpha = 0;
			
		}
		public function deactivateBottom():void
		{
			tPRESSURENUMBERS = new Tween(PRESSURENUMBERS,.75);
			tPRESSURENUMBERS.animate("alpha",0);
			Starling.juggler.add(tPRESSURENUMBERS);
			
			tOXYGEN = new Tween(OXYGEN,.75);
			tOXYGEN.animate("alpha",0);
			Starling.juggler.add(tOXYGEN);
			
			tOXYNUMBERS = new Tween(OXYNUMBERS,.75);
			tOXYNUMBERS.animate("alpha",0);
			Starling.juggler.add(tOXYNUMBERS);
			
			tsystemDiagnostics = new Tween(systemDiagnostics,.75);
			tsystemDiagnostics.animate("alpha",0);
			Starling.juggler.add(tsystemDiagnostics);
			
			tbottominfoShell = new Tween(bottominfoShell,.75);
			tbottominfoShell.animate("alpha",0);
			Starling.juggler.add(tbottominfoShell);
			
			tbottomInfoModule = new Tween(bottomInfoModule,.75);
			tbottomInfoModule.animate("alpha",0);
			Starling.juggler.add(tbottomInfoModule);
			
			tSYSTEMDIAGNOSTICTEXT = new Tween(SYSTEMDIAGNOSTICTEXT,.75);
			tSYSTEMDIAGNOSTICTEXT.animate("alpha",0);
			Starling.juggler.add(tSYSTEMDIAGNOSTICTEXT);
			
			topDotsWinter.alpha = 1;
			bottomDotsWinter.alpha = 1;
			
		}
		public function activateBottom():void
		{
			PRESSURENUMBERS.alpha = 1;
			OXYGEN.alpha = 1;
			OXYNUMBERS.alpha = 1;
			systemDiagnostics.alpha = 1;
			bottominfoShell.alpha = 1;
			bottomInfoModule.alpha = 1;
			SYSTEMDIAGNOSTICTEXT.alpha = 1;
			
			topDotsWinter.alpha = 0;
			bottomDotsWinter.alpha = 0;
		}
		public function deactivateAll():void
		{
			PRESSURENUMBERS.alpha = 0;
			OXYGEN.alpha = 0;
			OXYNUMBERS.alpha = 0;
			systemDiagnostics.alpha = 0;
			bottominfoShell.alpha = 0;
			bottomInfoModule.alpha = 0;
			topDotsWinter.alpha = 0;
			bottomDotsWinter.alpha = 0;
			topDots.alpha = 0;
			bottomDots.alpha = 0;
			dashBoard.alpha = 0;
			leftCoolingWhite.alpha = 0;
			leftCoolingTeal.alpha = 0;
			rightCoolingWhite.alpha = 0;
			rightCoolingTeal.alpha = 0;
			middleCoolingWhite3D.alpha = 0;
			middleCoolingWhite3D.alpha = 0;
			middleCoolingTeal.alpha = 0;
			topInfoModule.alpha = 0;
			topinfoShell.alpha = 0;
			this.removeChild(LIQUID);
			LIQUID = null;
			SYSTEMDIAGNOSTICTEXT.alpha = 0;
			this.removeChild(SYSTEMDIAGNOSTICTEXT);
			SYSTEMDIAGNOSTICTEXT = null;
		}
		public function update():void
		{
			
			//SYSTEM DIAGNOSTICS
			if(SYSTEMDIAGNOSTICTEXT != null)
			if(SYSTEMDIAGNOSTICTEXT.isComplete && state.winterActive == false)
			{
				SYSTEMDIAGNOSTICTEXT.alpha = .5;
			}
			
			if(LIQUID != null)
				if(LIQUID.isComplete)
						LIQUID.alpha = .5;
			
			//COOLING MODULES 
			leftCoolingWhite.rotation += .03;
			leftCoolingTeal.rotation -= .1;
			rightCoolingWhite.rotation -= .03;
			rightCoolingTeal.rotation += .1;
			middleCoolingWhite3D.rotationX += .03;
			middleCoolingWhite3D.rotationY -= .01;
			middleCoolingTeal.rotation -= .1;
			
		}
		public function createDiagnostics():void
		{
			///SYSTEM DIAGNOSTICS
			SYSTEMDIAGNOSTICTEXT = new MovieClip(Assets.suittextureplusAtlas.getTextures("d-00"));
			SYSTEMDIAGNOSTICTEXT.addFrame(Assets.suittextureplusAtlas.getTexture("d-01"),null,0.5);
			SYSTEMDIAGNOSTICTEXT.addFrame(Assets.suittextureplusAtlas.getTexture("d-02"),null,0.5);
			SYSTEMDIAGNOSTICTEXT.addFrame(Assets.suittextureplusAtlas.getTexture("d-03"),null,0.5);
			SYSTEMDIAGNOSTICTEXT.addFrame(Assets.suittextureplusAtlas.getTexture("d-04"),null,0.5);
			SYSTEMDIAGNOSTICTEXT.addFrame(Assets.suittextureplusAtlas.getTexture("d-05"),null,0.5);
			SYSTEMDIAGNOSTICTEXT.addFrame(Assets.suittextureplusAtlas.getTexture("d-06"),null,0.5);
			SYSTEMDIAGNOSTICTEXT.addFrame(Assets.suittextureplusAtlas.getTexture("d-07"),null,0.5);
			SYSTEMDIAGNOSTICTEXT.addFrame(Assets.suittextureplusAtlas.getTexture("d-11"),null,0.5);
			SYSTEMDIAGNOSTICTEXT.addFrame(Assets.suittextureplusAtlas.getTexture("d-08"),null,0.5);
			SYSTEMDIAGNOSTICTEXT.addFrame(Assets.suittextureplusAtlas.getTexture("d-10"),null,0.5);
			SYSTEMDIAGNOSTICTEXT.addFrame(Assets.suittextureplusAtlas.getTexture("d-09"),null,0.5);
			SYSTEMDIAGNOSTICTEXT.loop = false;
			SYSTEMDIAGNOSTICTEXT.pivotX = SYSTEMDIAGNOSTICTEXT.width * 0.5;
			SYSTEMDIAGNOSTICTEXT.pivotY = (SYSTEMDIAGNOSTICTEXT.height * 0.5) - 90;
			SYSTEMDIAGNOSTICTEXT.x = 600;
			SYSTEMDIAGNOSTICTEXT.y = 400;
			SYSTEMDIAGNOSTICTEXT.scale = .95;
			this.addChild(SYSTEMDIAGNOSTICTEXT);
			Starling.juggler.add(SYSTEMDIAGNOSTICTEXT);
			SYSTEMDIAGNOSTICTEXT.play();
			
			//liquid diagnostics
			LIQUID = new MovieClip(Assets.suittextureplusAtlas.getTextures("d-16"));
			LIQUID.addFrame(Assets.suittextureplusAtlas.getTexture("d-15"),null,1.5);
			LIQUID.addFrame(Assets.suittextureplusAtlas.getTexture("d-14"),null,1.5);
			LIQUID.addFrame(Assets.suittextureplusAtlas.getTexture("d-13"),null,1.5);
			LIQUID.addFrame(Assets.suittextureplusAtlas.getTexture("d-12"),null,1);
			LIQUID.loop = false;
			LIQUID.pivotX = LIQUID.width * 0.5;
			LIQUID.pivotY = (LIQUID.height * 0.5) + 90;
			LIQUID.x = 600;
			LIQUID.y = 400;
			LIQUID.scale = .95;
			LIQUID.addEventListener(Event.COMPLETE, state.disableEYESYNC);
			this.addChild(LIQUID);
			Starling.juggler.add(LIQUID);
			LIQUID.play();
		}
		public function disableDiagnostics():void
		{
			this.removeChild(SYSTEMDIAGNOSTICTEXT);
			SYSTEMDIAGNOSTICTEXT = null;
			this.removeChild(LIQUID);
			LIQUID = null;
		}
		
		//private var gunHelper:Image;
		//private var gunHelperTween:Tween;
		//private var stimHelper:Image;
		//private var stimHelperTween:Tween;
		//private var combatHelper:Image;
		//private var combatHelperTween:Tween;
		//private var ammoHelper:Image;
		//private var ammoHelperTween:Tween;
		
		//private var solarHelper:Image;
		//private var solarHelperTween:Tween;
		//private var ammoNodeHelper:Image;
		//private var ammoNodeHelperTween:Tween;
		//private var armorHelper:Image;
		//private var armorHelperTween:Tween;
		//private var winterHelper:Image;
		//private var winterHelperTween:Image;
		
		public function createHelpers():void
		{
			solarHelper = new Image(Assets.suittextureplusAtlas.getTexture("solarHelper"));
			solarHelper.pivotX = solarHelper.width * 0.5;
			solarHelper.pivotY = solarHelper.height * 0.5;
			solarHelper.x = 590;
			solarHelper.y = 480;
			solarHelper.alpha = 0;
			this.addChild(solarHelper);
			
			ammoNodeHelper = new Image(Assets.suittextureplusAtlas.getTexture("ammoNodeHelper"));
			ammoNodeHelper.pivotX = ammoNodeHelper.width * 0.5;
			ammoNodeHelper.pivotY = ammoNodeHelper.height * 0.5;
			ammoNodeHelper.x = 592;
			ammoNodeHelper.y = 480;
			ammoNodeHelper.alpha = 0;
			this.addChild(ammoNodeHelper);
			
			armorHelper = new Image(Assets.suittextureplusAtlas.getTexture("armorHelper"));
			armorHelper.pivotX = armorHelper.width * 0.5;
			armorHelper.pivotY = armorHelper.height * 0.5;
			armorHelper.x = 605;
			armorHelper.y = 480;
			armorHelper.alpha = 0;
			this.addChild(armorHelper);
			
			winterHelper = new Image(Assets.suittextureplusAtlas.getTexture("winterModeHelper"));
			winterHelper.pivotX = winterHelper.width * 0.5;
			winterHelper.pivotY = winterHelper.height * 0.5;
			winterHelper.x = 620;
			winterHelper.y = 480;
			winterHelper.alpha = 0;
			this.addChild(winterHelper);
			
			gunHelper = new Image(Assets.suittextureplusAtlas.getTexture("gunHelper"));
			gunHelper.pivotX = gunHelper.width * 0.5;
			gunHelper.pivotY = gunHelper.height * 0.5;
			gunHelper.x = 600;
			gunHelper.y = 476;
			gunHelper.alpha = 0;
			this.addChild(gunHelper);
			
			stimHelper = new Image(Assets.suittextureplusAtlas.getTexture("stimHelper"));
			stimHelper.pivotX = stimHelper.width * 0.5;
			stimHelper.pivotY = stimHelper.height * 0.5;
			stimHelper.x = 634;
			stimHelper.y = 476;
			stimHelper.alpha = 0;
			this.addChild(stimHelper);
			
			combatHelper = new Image(Assets.suittextureplusAtlas.getTexture("combatHelper"));
			combatHelper.pivotX = combatHelper.width * 0.5;
			combatHelper.pivotY = combatHelper.height * 0.5;
			combatHelper.x = 634;
			combatHelper.y = 476;
			combatHelper.alpha = 0;
			this.addChild(combatHelper);
			
			ammoHelper = new Image(Assets.suittextureplusAtlas.getTexture("ammoHelper"));
			ammoHelper.pivotX = ammoHelper.width * 0.5;
			ammoHelper.pivotY = ammoHelper.height * 0.5;
			ammoHelper.x = 634;
			ammoHelper.y = 476;
			ammoHelper.alpha = 0;
			this.addChild(ammoHelper);
			
			
		}
		public function startHelpers():void
		{
			Assets.winterData.play(0,0,new SoundTransform(0.1));
			
			gunHelperTween = new Tween(gunHelper, 1.0);
			gunHelperTween.animate("alpha", 1.0);
			gunHelperTween.onComplete = startSecond;
			Starling.juggler.add(gunHelperTween);
			
			solarHelperTween = new Tween(solarHelper, 1.0);
			solarHelperTween.animate("alpha", 1.0);
			Starling.juggler.add(solarHelperTween);
		}
		public function startSecond():void
		{
			Assets.winterData.play(0,0,new SoundTransform(0.1));
			
			stimHelperTween = new Tween(stimHelper, 1.0);
			stimHelperTween.animate("alpha", 1.0);
			stimHelperTween.onComplete = startThird;
			Starling.juggler.add(stimHelperTween);
			
			ammoNodeHelperTween = new Tween(ammoNodeHelper, 1.0);
			ammoNodeHelperTween.animate("alpha", 1.0);
			Starling.juggler.add(ammoNodeHelperTween);
		}
		public function startThird():void
		{
			Assets.winterData.play(0,0,new SoundTransform(0.1));
			
			combatHelperTween = new Tween(combatHelper, 1.0);
			combatHelperTween.animate("alpha", 1.0);
			combatHelperTween.onComplete = startFourth;
			Starling.juggler.add(combatHelperTween);
			
			armorHelperTween = new Tween(armorHelper, 1.0);
			armorHelperTween.animate("alpha", 1.0);
			Starling.juggler.add(armorHelperTween);
		}
		public function startFourth():void
		{
			Assets.winterData.play(0,0,new SoundTransform(0.1));
			
			ammoHelperTween = new Tween(ammoHelper, 1.0);
			ammoHelperTween.animate("alpha", 1.0);
			ammoHelperTween.onComplete = fadeHelpers;
			Starling.juggler.add(ammoHelperTween);
			
			winterHelperTween = new Tween(winterHelper, 1.0);
			winterHelperTween.animate("alpha", 1.0)
			Starling.juggler.add(winterHelperTween);
			
		}
		public function fadeHelpers():void
		{
			gunHelperTween = new Tween(gunHelper, 1.5);
			gunHelperTween.animate("alpha", 0.0);
			Starling.juggler.add(gunHelperTween);
			
			stimHelperTween = new Tween(stimHelper, 2.0);
			stimHelperTween.animate("alpha", 0.0);
			Starling.juggler.add(stimHelperTween);
			
			combatHelperTween = new Tween(combatHelper, 2.5);
			combatHelperTween.animate("alpha", 0.0);
			Starling.juggler.add(combatHelperTween);
			
			ammoHelperTween = new Tween(ammoHelper, 3.0);
			ammoHelperTween.animate("alpha", 0.0);
			ammoHelperTween.onComplete = removeHelpers;
			Starling.juggler.add(ammoHelperTween);
			
			solarHelperTween = new Tween(solarHelper, 1.5);
			solarHelperTween.animate("alpha", 0.0);
			Starling.juggler.add(solarHelperTween);
			
			ammoNodeHelperTween = new Tween(ammoNodeHelper, 2.0);
			ammoNodeHelperTween.animate("alpha", 0.0);
			Starling.juggler.add(ammoNodeHelperTween);
			
			armorHelperTween = new Tween(armorHelper, 2.5);
			armorHelperTween.animate("alpha", 0.0);
			Starling.juggler.add(armorHelperTween);
			
			winterHelperTween = new Tween(winterHelper, 3.0);
			winterHelperTween.animate("alpha", 0.0)
			Starling.juggler.add(winterHelperTween);
			
		}
		public function removeHelpers():void
		{
			this.removeChild(ammoNodeHelper);
			ammoNodeHelper = null;
			
			this.removeChild(armorHelper);
			armorHelper = null;
			
			this.removeChild(solarHelper);
			solarHelper = null;
			
			this.removeChild(winterHelper);
			winterHelper = null;
			
			this.removeChild(ammoHelper);
			ammoHelper = null;
			
			this.removeChild(gunHelper);
			gunHelper = null;
			
			this.removeChild(stimHelper);
			stimHelper = null;
			
			this.removeChild(combatHelper);
			combatHelper = null;
			
		}
		
	
	}
}