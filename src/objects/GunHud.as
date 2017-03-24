package objects
{
	import corez.Assets;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	
	import states.Startup;
	
	public class GunHud extends Sprite
	{
		
		private var square:Image;
		private var squareStim:Image;
		private var squareCombat:Image;
		private var squareAmmo:Image;
		private var rifle:Image;
		private var stim1:Image;
		private var ammoCount:Image;
		private var combat:Image;
		private var ammo:Image;
		private var ammoIcon:Image;
		private var clipCount:Image;
		
		
		private var Tsquare:Tween;
		private var TsquareStim:Tween;
		private var TsquareCombat:Tween;
		private var TsquareAmmo:Tween;
		private var Trifle:Tween;
		private var Tstim1:Tween;
		private var TammoCount:Tween;
		private var Tcombat:Tween;
		private var TammoIcon:Tween;
		private var Tammo:Tween;
		private var TclipCount:Tween;
		
		public var textureContainer:Vector.<Image>;
		private var start:Startup;

		public function GunHud(start:Startup)
		{
			this.start = start;
			
			square = new Image(Assets.winterTextureAtlas.getTexture("GH"));
			square.x = 632;
			square.y = 476;
			square.alpha = 0;
			square.pivotX = square.width * 0.5;
			square.pivotY = square.height * 0.5;
			this.addChild(square);
			
			squareStim = new Image(Assets.winterTextureAtlas.getTexture("Scontainer"));
			squareStim.x = 632;
			squareStim.y = 476;
			squareStim.alpha = 0;
			squareStim.pivotX = squareStim.width * 0.5;
			squareStim.pivotY = squareStim.height * 0.5;
			this.addChild(squareStim);
			
			squareCombat = new Image(Assets.winterTextureAtlas.getTexture("Ccontainer"));
			squareCombat.x = 632;
			squareCombat.y = 476;
			squareCombat.alpha = 0;
			squareCombat.pivotX = squareCombat.width * 0.5;
			squareCombat.pivotY = squareCombat.height * 0.5;
			this.addChild(squareCombat);
			
			squareAmmo = new Image(Assets.winterTextureAtlas.getTexture("Acontainer"));
			squareAmmo.x = 632;
			squareAmmo.y = 476;
			squareAmmo.alpha = 0;
			squareAmmo.pivotX = squareAmmo.width * 0.5;
			squareAmmo.pivotY = squareAmmo.height * 0.5;
			this.addChild(squareAmmo);
			
			rifle = new Image(Assets.winterTextureAtlas.getTexture("rifle"));
			rifle.x = 60;
			rifle.alpha = .8;
			rifle.y = 680;
			rifle.scale = .37;
			rifle.alpha = 0;
			rifle.rotation = -0.0698132;
			rifle.pivotX = rifle.width * 0.5;
			rifle.pivotY = rifle.height * 0.5;
			this.addChild(rifle);
			
			clipCount = new Image(Assets.winterTextureAtlas.getTexture("clipCount"));
			clipCount.x = 215;
			clipCount.y = 685;
			clipCount.alpha = 0;
			clipCount.scale = .9;
			clipCount.pivotX = clipCount.width * 0.5;
			clipCount.pivotY = clipCount.height * 0.5;
			this.addChild(clipCount);

			stim1 = new Image(Assets.winterTextureAtlas.getTexture("stim1"));
			stim1.x = 288;
			stim1.y = 690;
			stim1.scale = .7;
			stim1.alpha = 0;
			stim1.pivotX = stim1.width * 0.5;
			stim1.pivotY = stim1.height * 0.5;
			this.addChild(stim1);
			
			combat = new Image(Assets.winterTextureAtlas.getTexture("sheild"));
			combat.x = 348;
			combat.y = 687;
			combat.scale = .7;
			combat.alpha = 0;
			combat.pivotX = combat.width * 0.5;
			combat.pivotY = combat.height * 0.5;
			this.addChild(combat);
			
			ammo = new Image(Assets.winterTextureAtlas.getTexture("icon01"));
			ammo.pivotX = ammo.width * 0.5;
			ammo.pivotY = ammo.height * 0.5;
			ammo.x = 414;
			ammo.y = 690;
			ammo.scale = .7;
			ammo.alpha = 0;
			this.addChild(ammo);
			
			initializeContainer();
			decideIcon(start.ammoIcon);
			
			
		}
		public function initializeContainer():void
		{
			textureContainer = new Vector.<Image>();
			
			for(var i:int = 0; i < 8; i++)
			{
				ammoIcon = new Image(Assets.winterTextureAtlas.getTexture("icon0" + i));
				ammoIcon.pivotX = ammoIcon.width * 0.5;
				ammoIcon.pivotY = ammoIcon.height * 0.5;
				ammoIcon.x = 414;
				ammoIcon.y = 690;
				ammoIcon.scale = .7;
				//ammoIcon.alpha = 0;
				//this.addChild(ammoIcon);
				textureContainer.push(ammoIcon);
				
			}
			
			
		}
		public function decideIcon(i:int):void
		{
			if(i != 9)
			{
				for(var z:int = 0;z < textureContainer.length; z++)
				{
					if(i == z)
					{
						ammo.texture = textureContainer[z].texture;
					}
					
				}
			}
			
			
		}
		public function play():void
		{
			Tsquare = new Tween(square, .5);
			Tsquare.animate("alpha", 1);
			Tsquare.onComplete = buildStim;
			Starling.juggler.add(Tsquare);
		}
		public function buildStim():void
		{
			TsquareStim = new Tween(squareStim,.5);
			TsquareStim.animate("alpha", 1);
			TsquareStim.onComplete = buildCombat;
			Starling.juggler.add(TsquareStim);
		}
		public function buildCombat():void
		{
			TsquareCombat = new Tween(squareCombat,.5);
			TsquareCombat.animate("alpha", 1);
			TsquareCombat.onComplete = buildAmmo;
			Starling.juggler.add(TsquareCombat);
		}
		public function buildAmmo():void
		{
			TsquareAmmo = new Tween(squareAmmo,.5);
			TsquareAmmo.animate("alpha", 1);
			TsquareAmmo.onComplete = buildIcons;
			Starling.juggler.add(TsquareAmmo);
		}
		public function buildIcons():void
		{
			Trifle = new Tween(rifle,.5);
			Trifle.animate("alpha",1);
			Starling.juggler.add(Trifle);
			
			Tstim1 = new Tween(stim1,.5);
			Tstim1.animate("alpha",1);
			Starling.juggler.add(Tstim1);
			
			Tcombat = new Tween(combat,.5);
			Tcombat.animate("alpha",1);
			Starling.juggler.add(Tcombat);	
			
			Tammo = new Tween(ammo,.5);
			Tammo.animate("alpha",1);
			Starling.juggler.add(Tammo);
			
			TclipCount = new Tween(clipCount,.5);
			TclipCount.animate("alpha",1);
			Starling.juggler.add(TclipCount);
		}
		public function retract():void
		{
			Tammo = new Tween(ammo,.5);
			Tammo.animate("alpha",0);
			Starling.juggler.add(Tammo);	
			
			Tcombat = new Tween(combat,.5);
			Tcombat.animate("alpha",0);
			Starling.juggler.add(Tcombat);	
			
			Tstim1 = new Tween(stim1,.5);
			Tstim1.animate("alpha",0);
			Starling.juggler.add(Tstim1);
			
			TclipCount = new Tween(clipCount,.5);
			TclipCount.animate("alpha",0);
			Starling.juggler.add(TclipCount);
			
			Trifle = new Tween(rifle,.5);
			Trifle.animate("alpha",0);
			Trifle.onComplete = retractAmmo;
			Starling.juggler.add(Trifle);
		}
		public function retractAmmo():void
		{
			TsquareAmmo = new Tween(squareAmmo,.5);
			TsquareAmmo.animate("alpha", 0);
			TsquareAmmo.onComplete = retractCombat;
			Starling.juggler.add(TsquareAmmo);
		}
		public function retractStim():void
		{
			TsquareStim = new Tween(squareStim,.5);
			TsquareStim.animate("alpha", 0);
			TsquareStim.onComplete = retractGunHud;
			Starling.juggler.add(TsquareStim);
		}
		public function retractCombat():void
		{
			TsquareCombat = new Tween(squareCombat,.5);
			TsquareCombat.animate("alpha", 0);
			TsquareCombat.onComplete = retractStim;
			Starling.juggler.add(TsquareCombat);
			
		}
		public function retractGunHud():void
		{
			Tsquare = new Tween(square, .5);
			Tsquare.animate("alpha", 0);
			Starling.juggler.add(Tsquare);
		}	
	
	}
}