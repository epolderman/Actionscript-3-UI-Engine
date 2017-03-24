package objects
{
	
	import flash.filesystem.File;
	import flash.utils.setTimeout;
	
	import corez.Assets;
	
	import dragonBones.Armature;
	import dragonBones.Bone;
	import dragonBones.Slot;
	import dragonBones.objects.DragonBonesData;
	import dragonBones.starling.StarlingArmatureDisplay;
	import dragonBones.starling.StarlingFactory;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	
	import states.Startup;
	
	
	public class ArmorNode extends Sprite
	{ 	
		
		private var assets:AssetManager = new AssetManager();
		private var appDir:File = File.applicationDirectory;
		
		private var armatureDisplay:StarlingArmatureDisplay = null;
		private var factory:StarlingFactory = new StarlingFactory();
		
		private var skeletonData:Object;
		private var textureData:Object;
		private var texture:Texture;
		
		private var startup:Startup;
		
		private var outerRotator:Image
		private var innerRotator:Image;
		private var lines:Image;
		private var grav:Image;
		
		private var outerRotator2:Image
		private var innerRotator2:Image;
		private var lines2:Image;
		private var struct:Image;
		
		private var outerRotator3:Image
		private var innerRotator3:Image;
		private var lines3:Image;
		private var liquid:Image;
		
		private var outerRotator4:Image
		private var innerRotator4:Image;
		private var lines4:Image;
		private var illum:Image;
		
		private var outerRotator5:Image
		private var innerRotator5:Image;
		private var lines5:Image;
		private var hud:Image;
		
		public function ArmorNode(startup:Startup)
		{
			this.startup = startup;
			startArmor();
			setTimeout(buildNodes, 1000);
			//buildNodes();
			
		}
		public function disableArmor():void
		{
			trace("disabling");
			this.removeChild(armatureDisplay);
		}
		public function startArmor():void
		{
			assets.enqueue(appDir.resolvePath("corez/Raynor/"));
			assets.loadQueue (function (ratio1:Number):void 
			{
				if (ratio1 == 1.0) {
					
					skeletonData = assets.getObject ("raynor_ske");
					textureData = assets.getObject ("raynor_tex");
					texture = assets.getTexture ("raynor_texture");
					
					drawScreen ();
					
				}
			});
		}
		//Draws the assets onto the screen.
		private function drawScreen():void 
		{
			var dbData:DragonBonesData = factory.parseDragonBonesData (skeletonData);
			factory.parseTextureAtlasData (textureData, texture);
			
			
			if (dbData) 
			{
				
				armatureDisplay = factory.buildArmatureDisplay (dbData.armatureNames[0]);
				addChild (armatureDisplay);
			}
			
			armatureDisplay.alignPivot("center","center");
			armatureDisplay.x = stage.stageWidth/2;
			armatureDisplay.y = stage.stageHeight/2;
			
			armatureDisplay.animation.play();
				
		}
		
		private function buildNodes():void
		{
			Assets.missionAura.play();
			startup.motionActive = true;
			innerRotator = new Image(Assets.suittextureplusAtlas.getTexture("innerArmorNode"));
			innerRotator.pivotX = innerRotator.width * 0.5;
			innerRotator.pivotY = innerRotator.height * 0.5;
			innerRotator.x = 500;
			innerRotator.y = 550;
			innerRotator.scale = 0;
			this.addChild(innerRotator);
			
			outerRotator = new Image(Assets.suittextureplusAtlas.getTexture("outerArmorNode"));
			outerRotator.pivotX = outerRotator.width * 0.5;
			outerRotator.pivotY = outerRotator.height * 0.5;
			outerRotator.x = 500;
			outerRotator.y = 550;
			outerRotator.scale = 0;
			this.addChild(outerRotator);
			
			lines = new Image(Assets.suittextureplusAtlas.getTexture("dialogLine"));
			lines.pivotX = lines.width * 0.5;
			lines.pivotY = lines.height * 0.5;
			lines.x = 625;
			lines.y = 550;
			lines.scale = 0;
			this.addChild(lines);	
			
			grav = new Image(Assets.suittextureplusAtlas.getTexture("gravtext"));
			grav.pivotX = grav.width * 0.5;
			grav.pivotY = grav.height * 0.5;
			grav.x = 875;
			grav.y = 550;
			grav.scale = 0;
			this.addChild(grav);	
			
			var rotatorInner:Tween = new Tween(innerRotator, 1);
			rotatorInner.animate("scale", 1.5);
			Starling.juggler.add(rotatorInner);
			
			var rotatorOuter:Tween = new Tween(outerRotator, 1);
			rotatorOuter.animate("scale", 1.5);
			Starling.juggler.add(rotatorOuter);
			
			var lineTween:Tween = new Tween(lines, 1.5);
			lineTween.animate("scale", 1.5);
			//lineTween.onComplete = buildNode2;
			Starling.juggler.add(lineTween);
			
			var gravTween:Tween = new Tween(grav, 1.5);
			gravTween.animate("scale", 2.5);
			gravTween.onComplete = buildNode2;
			Starling.juggler.add(gravTween);
	
		}
		public function buildNode2():void
		{
			Assets.missionAura.play();
			innerRotator2 = new Image(Assets.suittextureplusAtlas.getTexture("innerArmorNode"));
			innerRotator2.pivotX = innerRotator2.width * 0.5;
			innerRotator2.pivotY = innerRotator2.height * 0.5;
			innerRotator2.x = 525;
			innerRotator2.y = 200;
			innerRotator2.scale = 0;
			this.addChild(innerRotator2);
			
			outerRotator2 = new Image(Assets.suittextureplusAtlas.getTexture("outerArmorNode"));
			outerRotator2.pivotX = outerRotator2.width * 0.5;
			outerRotator2.pivotY = outerRotator2.height * 0.5;
			outerRotator2.x = 525;
			outerRotator2.y = 200;
			outerRotator2.scale = 0;
			this.addChild(outerRotator2);
			
			lines2 = new Image(Assets.suittextureplusAtlas.getTexture("dialogLine"));
			lines2.pivotX = lines2.width * 0.5;
			lines2.pivotY = lines2.height * 0.5;
			lines2.x = 650;
			lines2.y = 200;
			lines2.scale = 0;
			this.addChild(lines2);
			
			struct = new Image(Assets.suittextureplusAtlas.getTexture("structtext"));
			struct.pivotX = struct.width * 0.5;
			struct.pivotY = struct.height * 0.5;
			struct.x = 900;
			struct.y = 200;
			struct.scale = 0;
			this.addChild(struct);	
			
			var rotatorInner1:Tween = new Tween(innerRotator2, 1);
			rotatorInner1.animate("scale", 1.5);
			Starling.juggler.add(rotatorInner1);
			
			var rotatorOuter1:Tween = new Tween(outerRotator2, 1);
			rotatorOuter1.animate("scale", 1.5);
			Starling.juggler.add(rotatorOuter1);
			
			var lineTween1:Tween = new Tween(lines2, 1.5);
			lineTween1.animate("scale", 1.5);
			//lineTween1.onComplete = buildNode3;
			Starling.juggler.add(lineTween1);
			
			var structTween:Tween = new Tween(struct, 1.5);
			structTween.animate("scale", 2.5);
			structTween.onComplete = buildNode3;
			Starling.juggler.add(structTween);
		}
		public function buildNode3():void
		{
			Assets.missionAura.play();
			innerRotator3 = new Image(Assets.suittextureplusAtlas.getTexture("innerArmorNode"));
			innerRotator3.pivotX = innerRotator3.width * 0.5;
			innerRotator3.pivotY = innerRotator3.height * 0.5;
			innerRotator3.x = 425;
			innerRotator3.y = -100;
			innerRotator3.scale = 0;
			this.addChild(innerRotator3);
			
			outerRotator3 = new Image(Assets.suittextureplusAtlas.getTexture("outerArmorNode"));
			outerRotator3.pivotX = outerRotator3.width * 0.5;
			outerRotator3.pivotY = outerRotator3.height * 0.5;
			outerRotator3.x = 425;
			outerRotator3.y = -100;
			outerRotator3.scale = 0;
			this.addChild(outerRotator3);
			
			lines3 = new Image(Assets.suittextureplusAtlas.getTexture("dialogLine"));
			lines3.pivotX = lines3.width * 0.5;
			lines3.pivotY = lines3.height * 0.5;
			lines3.x = 550;
			lines3.y = -100;
			lines3.scale = 0;
			this.addChild(lines3);
			
			liquid = new Image(Assets.suittextureplusAtlas.getTexture("liquidtext"));
			liquid.pivotX = liquid.width * 0.5;
			liquid.pivotY = liquid.height * 0.5;
			liquid.x = 800;
			liquid.y = -100;
			liquid.scale = 0;
			this.addChild(liquid);	
			
			var rotatorInner2:Tween = new Tween(innerRotator3, 1);
			rotatorInner2.animate("scale", 1.5);
			Starling.juggler.add(rotatorInner2);
			
			var rotatorOuter2:Tween = new Tween(outerRotator3, 1);
			rotatorOuter2.animate("scale", 1.5);
			Starling.juggler.add(rotatorOuter2);
			
			var lineTween2:Tween = new Tween(lines3, 1.5);
			lineTween2.animate("scale", 1.5);
			Starling.juggler.add(lineTween2);
			
			var illumTween:Tween = new Tween(liquid, 1.5);
			illumTween.animate("scale", 2.5);
			illumTween.onComplete = buildNode4;
			Starling.juggler.add(illumTween);
		}
		public function buildNode4():void
		{
			Assets.missionAura.play();
			innerRotator4 = new Image(Assets.suittextureplusAtlas.getTexture("innerArmorNode"));
			innerRotator4.pivotX = innerRotator4.width * 0.5;
			innerRotator4.pivotY = innerRotator4.height * 0.5;
			innerRotator4.x = 500;
			innerRotator4.y = -400;
			innerRotator4.scale = 0;
			this.addChild(innerRotator4);
			
			outerRotator4 = new Image(Assets.suittextureplusAtlas.getTexture("outerArmorNode"));
			outerRotator4.pivotX = outerRotator4.width * 0.5;
			outerRotator4.pivotY = outerRotator4.height * 0.5;
			outerRotator4.x = 500;
			outerRotator4.y = -400;
			outerRotator4.scale = 0;
			this.addChild(outerRotator4);
			
			lines4 = new Image(Assets.suittextureplusAtlas.getTexture("dialogLine"));
			lines4.pivotX = lines4.width * 0.5;
			lines4.pivotY = lines4.height * 0.5;
			lines4.x = 625;
			lines4.y = -400;
			lines4.scale = 0;
			this.addChild(lines4);	
			
			illum = new Image(Assets.suittextureplusAtlas.getTexture("mountedtext"));
			illum.pivotX = illum.width * 0.5;
			illum.pivotY = illum.height * 0.5;
			illum.x = 875;
			illum.y = -400;
			illum.scale = 0;
			this.addChild(illum);	
			
			var rotatorInner3:Tween = new Tween(innerRotator4, 1);
			rotatorInner3.animate("scale", 1.5);
			Starling.juggler.add(rotatorInner3);
			
			var rotatorOuter3:Tween = new Tween(outerRotator4, 1);
			rotatorOuter3.animate("scale", 1.5);
			Starling.juggler.add(rotatorOuter3);
			
			var lineTween3:Tween = new Tween(lines4, 1.5);
			lineTween3.animate("scale", 1.5);
			Starling.juggler.add(lineTween3);
			
			var mountedTween:Tween = new Tween(illum, 1.5);
			mountedTween.animate("scale", 2.5);
			mountedTween.onComplete = buildNode5;
			Starling.juggler.add(mountedTween);
		}
		public function buildNode5():void
		{
			Assets.missionAura.play();
			innerRotator5 = new Image(Assets.suittextureplusAtlas.getTexture("innerArmorNode"));
			innerRotator5.pivotX = innerRotator5.width * 0.5;
			innerRotator5.pivotY = innerRotator5.height * 0.5;
			innerRotator5.x = 400;
			innerRotator5.y = -550;
			innerRotator5.scale = 0;
			this.addChild(innerRotator5);
			
			outerRotator5 = new Image(Assets.suittextureplusAtlas.getTexture("outerArmorNode"));
			outerRotator5.pivotX = outerRotator5.width * 0.5;
			outerRotator5.pivotY = outerRotator5.height * 0.5;
			outerRotator5.x = 400;
			outerRotator5.y = -550;
			outerRotator5.scale = 0;
			this.addChild(outerRotator5);
			
			lines5 = new Image(Assets.suittextureplusAtlas.getTexture("dialogLine"));
			lines5.pivotX = lines5.width * 0.5;
			lines5.pivotY = lines5.height * 0.5;
			lines5.x = 525;
			lines5.y = -550;
			lines5.scale = 0;
			this.addChild(lines5);
			
			hud = new Image(Assets.suittextureplusAtlas.getTexture("hudtext"));
			hud.pivotX = hud.width * 0.5;
			hud.pivotY = hud.height * 0.5;
			hud.x = 775;
			hud.y = -550;
			hud.scale = 0;
			this.addChild(hud);	
			
			var rotatorInner4:Tween = new Tween(innerRotator5, 1);
			rotatorInner4.animate("scale", 1.5);
			Starling.juggler.add(rotatorInner4);
			
			var rotatorOuter4:Tween = new Tween(outerRotator5, 1);
			rotatorOuter4.animate("scale", 1.5);
			Starling.juggler.add(rotatorOuter4);
			
			var lineTween4:Tween = new Tween(lines5, 1.5);
			lineTween4.animate("scale", 1.5);
			//lineTween2.onComplete = buildNode4;
			Starling.juggler.add(lineTween4);
			
			var hudTween:Tween = new Tween(hud, 1.5);
			hudTween.animate("scale", 2.5);
			//lineTween2.onComplete = buildNode4;
			Starling.juggler.add(hudTween);
			
			
			startup.motionActive = false;
		}
		public function update():void
		{
			if(innerRotator != null)
			innerRotator.rotation += .03;
			
			if(outerRotator != null)
			outerRotator.rotation += -.03;
			
			if(innerRotator2 != null)
				innerRotator2.rotation += .03;
			
			if(outerRotator2 != null)
				outerRotator2.rotation += -.03;
			
			if(innerRotator3 != null)
				innerRotator3.rotation += .03;
			
			if(outerRotator3 != null)
				outerRotator3.rotation += -.03;
			
			if(innerRotator4 != null)
				innerRotator4.rotation += .03;
			
			if(outerRotator4 != null)
				outerRotator4.rotation += -.03;
			
			if(innerRotator5 != null)
				innerRotator5.rotation += .03;
			
			if(outerRotator5 != null)
				outerRotator5.rotation += -.03;
		}
	}
}