package objects
{
	import flash.media.SoundTransform;
	import flash.utils.setTimeout;
	
	import corez.Assets;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.display.Sprite3D;
	import starling.events.Event;
	
	import states.Startup;
	
	public class WinterMask extends Sprite
	{
		//gas mask module
		private var scope:Image;
		private var rotationRight:Sprite3D;
		private var rotationrightOxy:Image;
		private var rotationLeft:Sprite3D;
		private var rotationleftOxy:Image;
		private var rotationrightOxyWhite:Image;
		private var rotationleftOxyWhite:Image;
		private var rotationrightOxyBig:Image;
		private var rotationrightOxyBigWhite:Image;
		private var rotationrightOxyBigLeft:Image;
		private var rotationleftOxyBig:Image;
		private var rotationleftOxyBigWhite:Image;
		
		//tweens
		private var tweenRight:Tween;
		private var tweenLeft:Tween;
		private var tweenScope:Tween;
		
		//startup 
		private var start:Startup;
		//space suit
		private var spaceSuit:SpaceSuit;
		
		//cross hairs
		private var OuterCross:Image;
		private var OuterTris:Image;
		private var OuterCrossMids:Image;
		private var OuterCrossMidsTween:Tween;
		private var Outer1:Image;
		private var Outer2:Image;
		private var Outer3:Image;
		
		//tweens cross hairs
		private var outerCrossT1:Tween;
		private var outerCrossT2:Tween;
		private var outerCrossT3:Tween;
		private var outerCrossT4:Tween;
		private var outerCrossT5:Tween;
		
		//information nodes
		private var oneNode:Image;
		private var twoNode:Image;
		private var threeNode:Image;
		private var fourNode:Image;
		private var oneTween:Tween;	
		private var twoTween:Tween;
		private var threeTween:Tween;
		private var fourTween:Tween;
		
		//intializing modules
		private var loadingWinter:MovieClip;
		private var leftloadingModule:MovieClip;
		private var rightloadingModule:MovieClip;
		
		private var toploadingModule:Image;
		private var toploadingone:Image;
		private var toploadingtwo:Image;
		private var toploadingthree:Image;
		private var toploadingoneTween:Tween;
		private var toploadingtwoTween:Tween;
		private var toploadingthreeTween:Tween;
		
		private var topRloadingModule:MovieClip;
		
		private var topRloadingTween:Tween;
		private var toploadingTween:Tween;
		private var leftLoadingTween:Tween;
		private var rightLoadingTween:Tween;
		private var loadingWinterTween:Tween;
			
		private var centerOS:Image;
		private var TcenterOS:Tween;
			
		private var outerDecal:Image;
		private var outerDecal2:Image;
		private var emblem:Image;
		private var cell:Image;
		private var glow:Image;
		private var outer1Tween:Tween;
		
		private var out2T:Tween;
		private var out1T:Tween;
		private var emblemT:Tween;
		private var cellT:Tween;
		
		private var leftAlpha:MovieClip;
		private var leftATween:Tween;
		private var rightAlpha:MovieClip;
		private var rightATween:Tween;
		//end information modules
		
		//launch modules
		private var leftLaunch:MovieClip;
		private var leftLaunchAlpha:MovieClip;
		private var leftLaunchT:Tween;
		private var leftLaunchAlphaT:Tween;
		
		private var rightLaunch:MovieClip;
		private var rightLaunchAlpha:MovieClip;
		private var rightLaunchT:Tween;
		private var rightLaunchAlphaT:Tween;
		
		private var playlistPanel:Image;
		private var bracket:Image;
		private var footer:Image;
		private var loadingText:Image;
		private var playButton:Image;
		private var playText:Image;
		
		private var playList:MovieClip;
		private var playListT:Tween;
		private var playListReplica:MovieClip;
		private var playListReplicaT:Tween;
			
		public function WinterMask(start:Startup, spaceSuit:SpaceSuit)
		{
			this.start = start;
			this.spaceSuit = spaceSuit;
		}
		public function triggerWinter():void
		{
			Assets.button2.play(0,0,new SoundTransform(1));
			
			if(!start.winterActive)
			{
				start.motionActive = true;
				start.winterActive = true;
				
				initializeWinter();
				
				if(start.ammoActive)
				{
					start.ammoActive = false;
					start.disableAmmoNode();
				}
				
				if(start.armorActive)
				{
					start.removeArmorObject();
					start.armorActive = false;
				}
			}
			else
			{
				disableWinter();
				start.winterActive = false;
				spaceSuit.activateBottom();
			}
		}
		public function buildPlaylist():void
		{
			///launch
			playList = new MovieClip(Assets.nodeTextureAtlas.getTextures("play00"));
			playList.setFrameDuration(0,1);
			playList.addFrame(Assets.nodeTextureAtlas.getTexture("play01"),null, .25);
			playList.addFrame(Assets.nodeTextureAtlas.getTexture("play02"),null, .1);
			playList.addFrame(Assets.nodeTextureAtlas.getTexture("play03"),null, .1);
			playList.addFrame(Assets.nodeTextureAtlas.getTexture("play04"),null, .1);
			playList.addFrame(Assets.nodeTextureAtlas.getTexture("play05"),null, 1);
			playList.addFrame(Assets.nodeTextureAtlas.getTexture("play02"),null, .2);
			playList.addFrame(Assets.nodeTextureAtlas.getTexture("play03"),null, .2);
			playList.addFrame(Assets.nodeTextureAtlas.getTexture("play04"),null, .2);
			playList.addFrame(Assets.nodeTextureAtlas.getTexture("play05"),null, .2);
			playList.addFrame(Assets.nodeTextureAtlas.getTexture("play02"),null, .2);
			playList.addFrame(Assets.nodeTextureAtlas.getTexture("play03"),null, .2);
			playList.addFrame(Assets.nodeTextureAtlas.getTexture("play04"),null, .2);
			playList.addFrame(Assets.nodeTextureAtlas.getTexture("play05"),null, .2);
			playList.addFrame(Assets.nodeTextureAtlas.getTexture("play02"),null, .2);
			playList.addFrame(Assets.nodeTextureAtlas.getTexture("play03"),null, .2);
			playList.addFrame(Assets.nodeTextureAtlas.getTexture("play04"),null, .2);
			playList.addFrame(Assets.nodeTextureAtlas.getTexture("play05"),null, .2);
			playList.setFrameAction(2,startSecondP);
			playList.setFrameAction(5,startThirdP);
			//playList.addEventListener(Event.COMPLETE, removePlayList);
			playList.loop = false;
			playList.pivotX = playList.width * 0.5;
			playList.pivotY = playList.height * 0.5;
			playList.x = 600;
			playList.y = 400;
			playList.scale = .1;
			playList.alpha = 0;
			this.addChild(playList);
			Starling.juggler.add(playList);
			playList.pause();
			
			///launch
			playListReplica = new MovieClip(Assets.nodeTextureAtlas.getTextures("play00"));
			playListReplica.setFrameDuration(0,1);
			playListReplica.addFrame(Assets.nodeTextureAtlas.getTexture("play01"),null, .25);
			playListReplica.addFrame(Assets.nodeTextureAtlas.getTexture("play02"),null, .1);
			playListReplica.addFrame(Assets.nodeTextureAtlas.getTexture("play03"),null, .1);
			playListReplica.addFrame(Assets.nodeTextureAtlas.getTexture("play04"),null, .1);
			playListReplica.addFrame(Assets.nodeTextureAtlas.getTexture("play05"),null, 1);
			playListReplica.addFrame(Assets.nodeTextureAtlas.getTexture("play02"),null, .2);
			playListReplica.addFrame(Assets.nodeTextureAtlas.getTexture("play03"),null, .2);
			playListReplica.addFrame(Assets.nodeTextureAtlas.getTexture("play04"),null, .2);
			playListReplica.addFrame(Assets.nodeTextureAtlas.getTexture("play05"),null, .2);
			playListReplica.addFrame(Assets.nodeTextureAtlas.getTexture("play02"),null, .2);
			playListReplica.addFrame(Assets.nodeTextureAtlas.getTexture("play03"),null, .2);
			playListReplica.addFrame(Assets.nodeTextureAtlas.getTexture("play04"),null, .2);
			playListReplica.addFrame(Assets.nodeTextureAtlas.getTexture("play05"),null, .2);
			playListReplica.addFrame(Assets.nodeTextureAtlas.getTexture("play02"),null, .2);
			playListReplica.addFrame(Assets.nodeTextureAtlas.getTexture("play03"),null, .2);
			playListReplica.addFrame(Assets.nodeTextureAtlas.getTexture("play04"),null, .2);
			playListReplica.addFrame(Assets.nodeTextureAtlas.getTexture("play05"),null, .2);
			playListReplica.loop = false;
			playListReplica.pivotX = playListReplica.width * 0.5;
			playListReplica.pivotY = playListReplica.height * 0.5;
			playListReplica.x = 600;
			playListReplica.y = 400;
			playListReplica.scale = .1;
			playListReplica.alpha = 0;
			this.addChild(playListReplica);
			Starling.juggler.add(playListReplica);
			playListReplica.pause();
		}
		public function startPlaylist():void
		{
			playListT = new Tween(playList,1);
			playListT.animate("alpha", .8);
			playListT.animate("scale",.7);
			playListT.animate("x", 900);
			playListT.onComplete = playPlaylist;
			playListT.animate("y",220);
			Starling.juggler.add(playListT);
			
			playListReplicaT = new Tween(playListReplica,1);
			playListReplicaT.animate("alpha", .3);
			playListReplicaT.animate("scale",.7);
			playListReplicaT.animate("x", 950);
			playListReplicaT.animate("y",200);
			Starling.juggler.add(playListReplicaT);
		}
		public function playPlaylist():void
		{
			playList.play();
			playListReplica.play();
		}
		public function startSecondP():void
		{
			Assets.launch.play(0,0,new SoundTransform(1));
		}
		public function startThirdP():void
		{
			playListT = new Tween(playList,4);
			playListT.animate("alpha", 0);
			Starling.juggler.add(playListT);
			
			playListReplicaT = new Tween(playListReplica,4);
			playListReplicaT.animate("alpha", 0);
			playListReplicaT.onComplete = removePlayList;
			Starling.juggler.add(playListReplicaT);
		}

		public function removePlayList():void
		{
			this.removeChild(playList);
			playList = null;
			
			this.removeChild(playListReplica);
			playListReplica = null;
			
		}
		public function initializeLaunch():void
		{
			Assets.launchB.play(0,0,new SoundTransform(.35));
			buildPlaylist();
				
			///launch
			leftLaunch = new MovieClip(Assets.nodeTextureAtlas.getTextures("panel00"));
			leftLaunch.setFrameDuration(0,1.5);
			leftLaunch.addFrame(Assets.nodeTextureAtlas.getTexture("panel01"),null, .1);
			leftLaunch.addFrame(Assets.nodeTextureAtlas.getTexture("panel02"),null,.1);
			leftLaunch.addFrame(Assets.nodeTextureAtlas.getTexture("panel03"),null,.1);
			leftLaunch.addFrame(Assets.nodeTextureAtlas.getTexture("panel04"),null,.1);
			leftLaunch.addFrame(Assets.nodeTextureAtlas.getTexture("panel05"),null,.1);
			leftLaunch.addFrame(Assets.nodeTextureAtlas.getTexture("panel06"),null,.1);
			leftLaunch.addEventListener(Event.COMPLETE, launchNode);
			leftLaunch.loop = false;
			leftLaunch.pivotX = leftLaunch.width * 0.5;
			leftLaunch.pivotY = leftLaunch.height * 0.5;
			leftLaunch.x = 600;
			leftLaunch.y = 400;
			leftLaunch.scale = .1;
			leftLaunch.alpha = 0;
			this.addChild(leftLaunch);
			Starling.juggler.add(leftLaunch);
			leftLaunch.play();
			
			leftLaunchAlpha = new MovieClip(Assets.nodeTextureAtlas.getTextures("panel00"));
			leftLaunchAlpha.setFrameDuration(0,1.5);
			leftLaunchAlpha.addFrame(Assets.nodeTextureAtlas.getTexture("panel01"),null,.1);
			leftLaunchAlpha.addFrame(Assets.nodeTextureAtlas.getTexture("panel02"),null,.1);
			leftLaunchAlpha.addFrame(Assets.nodeTextureAtlas.getTexture("panel03"),null,.1);
			leftLaunchAlpha.addFrame(Assets.nodeTextureAtlas.getTexture("panel04"),null,.1);
			leftLaunchAlpha.addFrame(Assets.nodeTextureAtlas.getTexture("panel05"),null,.1);
			leftLaunchAlpha.addFrame(Assets.nodeTextureAtlas.getTexture("panel06"),null,.1);
			leftLaunchAlpha.loop = false;
			leftLaunchAlpha.pivotX = leftLaunch.width * 0.5;
			leftLaunchAlpha.pivotY = leftLaunch.height * 0.5;
			leftLaunchAlpha.x = 195;
			leftLaunchAlpha.y = 410;
			leftLaunchAlpha.scale = .1;
			leftLaunchAlpha.alpha = 0;
			this.addChild(leftLaunchAlpha);
			Starling.juggler.add(leftLaunchAlpha);
			leftLaunchAlpha.play();
			
			leftLaunchT = new Tween(leftLaunch,1.0);
			leftLaunchT.animate("alpha", .8);
			leftLaunchT.animate("scale", .6);
			leftLaunchT.animate("x", 200);
			Starling.juggler.add(leftLaunchT);
			
			leftLaunchAlphaT = new Tween(leftLaunchAlpha,1.0);
			leftLaunchAlphaT.animate("alpha", .2);
			leftLaunchAlphaT.animate("scale", .6);
			leftLaunchAlphaT.animate("x",195);
			Starling.juggler.add(leftLaunchAlphaT);
			
			startPlaylist();
			
			
		}
		public function launchNode():void
		{
			///launch
			rightLaunch = new MovieClip(Assets.nodeTextureAtlas.getTextures("3"));
			rightLaunch.setFrameDuration(0,1.5);
			rightLaunch.addFrame(Assets.nodeTextureAtlas.getTexture("2"),null,1.5);
			rightLaunch.addFrame(Assets.nodeTextureAtlas.getTexture("1"),null,1.5);
			rightLaunch.addFrame(Assets.nodeTextureAtlas.getTexture("4"),null,1.5);
			rightLaunch.loop = false;
			rightLaunch.pivotX = rightLaunch.width * 0.5;
			rightLaunch.pivotY = rightLaunch.height * 0.5;
			rightLaunch.x = 600;
			rightLaunch.y = 400;
			rightLaunch.scale = .1;
			rightLaunch.alpha = 0;
			this.addChild(rightLaunch);
			Starling.juggler.add(rightLaunch);
			rightLaunch.pause();
			
			rightLaunchAlpha = new MovieClip(Assets.nodeTextureAtlas.getTextures("3"));
			rightLaunchAlpha.setFrameDuration(0,1.5);
			rightLaunchAlpha.addFrame(Assets.nodeTextureAtlas.getTexture("2"),null,1.5);
			rightLaunchAlpha.addFrame(Assets.nodeTextureAtlas.getTexture("1"),null,1.5);
			rightLaunchAlpha.addFrame(Assets.nodeTextureAtlas.getTexture("4"),null,1.5);
			rightLaunchAlpha.addEventListener(Event.COMPLETE, startLaunching);
			rightLaunchAlpha.loop = false;
			rightLaunchAlpha.pivotX = rightLaunchAlpha.width * 0.5;
			rightLaunchAlpha.pivotY = rightLaunchAlpha.height * 0.5;
			rightLaunchAlpha.x = 195;
			rightLaunchAlpha.y = 410;
			rightLaunchAlpha.scale = .1;
			rightLaunchAlpha.alpha = 0;
			this.addChild(rightLaunchAlpha);
			Starling.juggler.add(rightLaunchAlpha);
			rightLaunchAlpha.pause();
			
			rightLaunchT = new Tween(rightLaunch,.5);
			rightLaunchT.animate("alpha", .8);
			rightLaunchT.animate("scale", .5);
			rightLaunchT.animate("y", 200);
			rightLaunchT.animate("x",195);
			Starling.juggler.add(rightLaunchT);
			
			rightLaunchAlphaT = new Tween(rightLaunchAlpha,.5);
			rightLaunchAlphaT.animate("alpha", .2);
			rightLaunchAlphaT.animate("scale", .5);
			rightLaunchAlphaT.animate("x",250);
			rightLaunchAlphaT.animate("y",250);
			rightLaunchAlphaT.onComplete = playLaunch;
			Starling.juggler.add(rightLaunchAlphaT);

		}
		public function playLaunch():void
		{
			rightLaunch.play();
			rightLaunchAlpha.play();
			start.shakeButtons();
			start.playExtraPS();
			start.missionActive = false;
			start.winterActive = false;
			start.motionActive = false;
			start.End();
		}
		public function startLaunching():void
		{
			rightLaunchT = new Tween(rightLaunch,2);
			rightLaunchT.animate("alpha", 0);
			rightLaunchT.animate("scale", .5);
			Starling.juggler.add(rightLaunchT);
			
			rightLaunchAlphaT = new Tween(rightLaunchAlpha,2);
			rightLaunchAlphaT.animate("alpha", 0);
			Starling.juggler.add(rightLaunchAlphaT);
			
			leftLaunchT = new Tween(leftLaunch,2.0);
			leftLaunchT.animate("alpha", 0);
			Starling.juggler.add(leftLaunchT);
			
			leftLaunchAlphaT = new Tween(leftLaunchAlpha,2.0);
			leftLaunchAlphaT.animate("alpha", 0);
			leftLaunchAlphaT.onComplete = removeLaunchNodes;
			Starling.juggler.add(leftLaunchAlphaT);
		}
		public function removeLaunchNodes():void
		{
			this.removeChild(rightLaunch);
			this.removeChild(rightLaunchAlpha);
			this.removeChild(leftLaunch);
			this.removeChild(leftLaunchAlpha);
		}
		public function initializeWinter():void
		{			
								
			centerOS = new Image(Assets.winterTextureAtlas.getTexture("OperatingSystemsDisplay"));
			centerOS.x = 600;
			centerOS.y = 400;
			centerOS.scale = .9;
			centerOS.pivotX = centerOS.width * 0.5;
			centerOS.pivotY = centerOS.height * 0.5;
			centerOS.alpha = 0;
			this.addChild(centerOS);
				
			toploadingModule = new Image(Assets.winterTextureAtlas.getTexture("w_03"));
			toploadingModule.pivotX = toploadingModule.width * 0.5;
			toploadingModule.pivotY = toploadingModule.height * 0.5;
			toploadingModule.x = 600;
			toploadingModule.y = 400;
			toploadingModule.scale = .1;
			toploadingModule.alpha = .8;
			this.addChild(toploadingModule);
			
			toploadingone = new Image(Assets.winterTextureAtlas.getTexture("w_00"));
			toploadingone.pivotX = toploadingone.width * 0.5;
			toploadingone.pivotY = toploadingone.height * 0.5;
			toploadingone.x = 325;
			toploadingone.y = 200;
			toploadingone.scale = .1;
			toploadingone.alpha = 0;
			this.addChild(toploadingone);
			
			toploadingtwo = new Image(Assets.winterTextureAtlas.getTexture("w_01"));
			toploadingtwo.pivotX = toploadingtwo.width * 0.5;
			toploadingtwo.pivotY = toploadingtwo.height * 0.5;
			toploadingtwo.x = 325;
			toploadingtwo.y = 200;
			toploadingtwo.scale = .1;
			toploadingtwo.alpha = 0;
			this.addChild(toploadingtwo);
			
			toploadingthree = new Image(Assets.winterTextureAtlas.getTexture("w_02"));
			toploadingthree.pivotX = toploadingthree.width * 0.5;
			toploadingthree.pivotY = toploadingthree.height * 0.5;
			toploadingthree.x = 325;
			toploadingthree.y = 200;
			toploadingthree.scale = .1;
			toploadingthree.alpha = 0;
			this.addChild(toploadingthree);
				
			topRloadingModule = new MovieClip(Assets.winterTextureAtlas.getTextures("x00"));
			topRloadingModule.setFrameDuration(0,.2);
			topRloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("x01"),null,.2);
			topRloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("x02"),null,.2);
			topRloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("x03"),null,.1);
			topRloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("x04"),null,.1);
			topRloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("x05"),null,.5);
			topRloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("x06"),null,.1);
			topRloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("x07"),null,.1);
			topRloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("x08"),null,.5);
			topRloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("x03"),null,.1);
			topRloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("x04"),null,.1);
			topRloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("x05"),null,.2);
			topRloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("x06"),null,.1);
			topRloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("x07"),null,.5);
			topRloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("x08"),null,.5);
			topRloadingModule.loop = false;
			topRloadingModule.pivotX = topRloadingModule.width * 0.5;
			topRloadingModule.pivotY = topRloadingModule.height * 0.5;
			topRloadingModule.x = 600;
			topRloadingModule.y = 400;
			topRloadingModule.scale = .1;
			topRloadingModule.alpha = .8;
			this.addChild(topRloadingModule);
			Starling.juggler.add(topRloadingModule);
			topRloadingModule.pause();
			
			leftloadingModule = new MovieClip(Assets.winterTextureAtlas.getTextures("root_00"));
			leftloadingModule.setFrameDuration(0,0.1);
			leftloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("root_01"),null,.1);
			leftloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("root_02"),null,.1);
			leftloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("root_03"),null,.1);
			leftloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("root_04"),null,.1);
			leftloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("root_05"),null,.5);
			leftloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("root_06"),null,.5);
			leftloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("root_07"),null,.1);
			leftloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("root_08"),null,.1);
			leftloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("root_09"),null,1);
			leftloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("root_10"),null,1);
			leftloadingModule.loop = false;
			leftloadingModule.pivotX = leftloadingModule.width * 0.5;
			leftloadingModule.pivotY = leftloadingModule.height * 0.5;
			leftloadingModule.x = 600;
			leftloadingModule.y = 400;
			leftloadingModule.scale = .1;
			leftloadingModule.alpha = .8;
			this.addChild(leftloadingModule);
			Starling.juggler.add(leftloadingModule);
			leftloadingModule.pause();
			
			leftAlpha = new MovieClip(Assets.winterTextureAtlas.getTextures("root_00"));
			leftAlpha.setFrameDuration(0,0.1);
			leftAlpha.addFrame(Assets.winterTextureAtlas.getTexture("root_01"),null,.1);
			leftAlpha.addFrame(Assets.winterTextureAtlas.getTexture("root_02"),null,.1);
			leftAlpha.addFrame(Assets.winterTextureAtlas.getTexture("root_03"),null,.1);
			leftAlpha.addFrame(Assets.winterTextureAtlas.getTexture("root_04"),null,.1);
			leftAlpha.addFrame(Assets.winterTextureAtlas.getTexture("root_05"),null,.5);
			leftAlpha.addFrame(Assets.winterTextureAtlas.getTexture("root_06"),null,.5);
			leftAlpha.addFrame(Assets.winterTextureAtlas.getTexture("root_07"),null,.1);
			leftAlpha.addFrame(Assets.winterTextureAtlas.getTexture("root_08"),null,.1);
			leftAlpha.addFrame(Assets.winterTextureAtlas.getTexture("root_09"),null,1);
			leftAlpha.addFrame(Assets.winterTextureAtlas.getTexture("root_10"),null,1);
			leftAlpha.loop = false;
			leftAlpha.pivotX = leftAlpha.width * 0.5;
			leftAlpha.pivotY = leftAlpha.height * 0.5;
			leftAlpha.x = 600;
			leftAlpha.y = 400;
			leftAlpha.scale = .1;
			leftAlpha.alpha = .3;
			this.addChild(leftAlpha);
			Starling.juggler.add(leftAlpha);
			leftAlpha.pause();
			
			rightloadingModule = new MovieClip(Assets.winterTextureAtlas.getTextures("suit_00"));
			rightloadingModule.setFrameDuration(0,0.1);
			rightloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("suit_01"),null,.1);
			rightloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("suit_02"),null,.1);
			rightloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("suit_03"),null,.1);
			rightloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("suit_04"),null,.1);
			rightloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("suit_05"),null,.5);
			rightloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("suit_06"),null,.1);
			rightloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("suit_07"),null,.1);
			rightloadingModule.addFrame(Assets.winterTextureAtlas.getTexture("suit_08"),null,.1);
			rightloadingModule.loop = false;
			rightloadingModule.pivotX = rightloadingModule.width * 0.5;
			rightloadingModule.pivotY = rightloadingModule.height * 0.5;
			rightloadingModule.x = 600;
			rightloadingModule.y = 400;
			rightloadingModule.scale = .1;
			rightloadingModule.alpha = .8;
			this.addChild(rightloadingModule);
			Starling.juggler.add(rightloadingModule);
			rightloadingModule.pause();	
			
			rightAlpha = new MovieClip(Assets.winterTextureAtlas.getTextures("suit_00"));
			rightAlpha.setFrameDuration(0,0.1);
			rightAlpha.addFrame(Assets.winterTextureAtlas.getTexture("suit_01"),null,.1);
			rightAlpha.addFrame(Assets.winterTextureAtlas.getTexture("suit_02"),null,.1);
			rightAlpha.addFrame(Assets.winterTextureAtlas.getTexture("suit_03"),null,.1);
			rightAlpha.addFrame(Assets.winterTextureAtlas.getTexture("suit_04"),null,.1);
			rightAlpha.addFrame(Assets.winterTextureAtlas.getTexture("suit_05"),null,.5);
			rightAlpha.addFrame(Assets.winterTextureAtlas.getTexture("suit_06"),null,.1);
			rightAlpha.addFrame(Assets.winterTextureAtlas.getTexture("suit_07"),null,.1);
			rightAlpha.addFrame(Assets.winterTextureAtlas.getTexture("suit_08"),null,.1);
			rightAlpha.loop = false;
			rightAlpha.pivotX = rightAlpha.width * 0.5;
			rightAlpha.pivotY = rightAlpha.height * 0.5;
			rightAlpha.x = 600;
			rightAlpha.y = 400;
			rightAlpha.scale = .1;
			rightAlpha.alpha = .3;
			this.addChild(rightAlpha);
			Starling.juggler.add(rightAlpha);
			rightAlpha.pause();		
			
			glow = new Image(Assets.button1textureAtlas.getTexture("glow"));
			glow.x = 600;
			glow.y = 400;
			glow.alpha = 0;
			glow.pivotX = glow.width * 0.5;
			glow.pivotY = glow.height * 0.5;
			this.addChild(glow);
			
			outerDecal = new Image(Assets.button1textureAtlas.getTexture("outer1decal"));
			outerDecal.x = 600;
			outerDecal.y = 400;
			outerDecal.alpha = 0;
			outerDecal.pivotX = outerDecal.width * 0.5;
			outerDecal.pivotY = outerDecal.height * 0.5;
			this.addChild(outerDecal);
			
			outerDecal2 = new Image(Assets.button1textureAtlas.getTexture("outer2decal"));
			outerDecal2.x = 600;
			outerDecal2.y = 400;
			outerDecal2.alpha = 0;
			outerDecal2.pivotX = outerDecal.width * 0.5;
			outerDecal2.pivotY = outerDecal.height * 0.5;
			this.addChild(outerDecal2);
			
			cell = new Image(Assets.button1textureAtlas.getTexture("cell"));
			cell.x = 600;
			cell.y = 400;
			cell.alpha = 0;
			cell.pivotX = cell.width * 0.5;
			cell.pivotY = cell.height * 0.5;
			this.addChild(cell);
			
			emblem = new Image(Assets.button1textureAtlas.getTexture("emblem"));
			emblem.x = 600;
			emblem.y = 400;
			emblem.alpha = 0;
			emblem.pivotX = emblem.width * 0.5;
			emblem.pivotY = emblem.height * 0.5;
			this.addChild(emblem);
			
			initTweens();
			
		}
		public function initTweens():void
		{
			out1T = new Tween(outerDecal,1);
			out1T.animate("alpha",1);
			//out1T.onComplete = playEmblem;
			Starling.juggler.add(out1T);
			
			out2T = new Tween(outerDecal2,1);
			out2T.animate("alpha",1);
			Starling.juggler.add(out2T);
			
			Assets.emblemAura.play(0,0,new SoundTransform(.25));
			
			emblemT = new Tween(emblem,2);
			emblemT.animate("alpha",1);
			Starling.juggler.add(emblemT);
			
			cellT = new Tween(cell,2);
			cellT.animate("alpha",1);
			cellT.onComplete = loadTweens;
			Starling.juggler.add(cellT);
			
			setTimeout(playdata, 2275);
		}
		public function playdata():void
		{
			//Assets.emblemNoise.play(0,0,new SoundTransform(.25));
			Assets.emblemData.play(0,0,new SoundTransform(.25));
		}
		public function playTop():void
		{
			toploadingoneTween = new Tween(toploadingone, 0.5);
			toploadingoneTween.animate("x",265);
			toploadingoneTween.animate("y",195);
			toploadingoneTween.animate("scale",.2);
			toploadingoneTween.animate("alpha",1);
			Starling.juggler.add(toploadingoneTween);
			
			toploadingtwoTween = new Tween(toploadingtwo, 0.5);
			toploadingtwoTween.animate("x",340);
			toploadingtwoTween.animate("y",195);
			toploadingtwoTween.animate("alpha",1);
			toploadingtwoTween.animate("scale",.2);
			toploadingtwoTween.delay = 0.5;
			Starling.juggler.add(toploadingtwoTween);
			
			toploadingthreeTween = new Tween(toploadingthree, 0.5);
			toploadingthreeTween.animate("x",310);
			toploadingthreeTween.animate("y",235);
			toploadingthreeTween.animate("alpha",1);
			toploadingthreeTween.animate("scale",.4);
			toploadingthreeTween.delay = 0.5;
			Starling.juggler.add(toploadingthreeTween);
		}
		public function loadTweens():void
		{
			
			loadingWinterTween = new Tween(glow,1);
			loadingWinterTween.animate("alpha",1);
			loadingWinterTween.onComplete = glowBack;
			Starling.juggler.add(loadingWinterTween);
			
			TcenterOS = new Tween(centerOS,.5);
			TcenterOS.animate("alpha",1);
			TcenterOS.animate("y",600);
			Starling.juggler.add(TcenterOS);
			
			toploadingTween = new Tween(toploadingModule,.5);
			toploadingTween.animate("scale",.5);
			toploadingTween.animate("x", 300);
			toploadingTween.animate("y", 225);
			toploadingTween.onComplete = playTop;
			Starling.juggler.add(toploadingTween);
			
			topRloadingTween = new Tween(topRloadingModule,.5);
			topRloadingTween.animate("scale",.5);
			topRloadingTween.animate("x", 900);
			topRloadingTween.animate("y", 225);
			topRloadingTween.onComplete = playTopR;
			Starling.juggler.add(topRloadingTween);
					
			leftLoadingTween = new Tween(leftloadingModule,.5);
			leftLoadingTween.animate("scale",.8);
			leftLoadingTween.animate("x", 175);
			leftLoadingTween.animate("y", 475);
			leftLoadingTween.onComplete = playLeft;
			Starling.juggler.add(leftLoadingTween);
			
			leftATween = new Tween(leftAlpha,.5);
			leftATween.animate("scale",1);
			leftATween.animate("x", 145);
			leftATween.animate("y", 520);
			leftATween.onComplete = playLeft;
			Starling.juggler.add(leftATween);
			
			rightLoadingTween = new Tween(rightloadingModule,.5);
			rightLoadingTween.animate("scale",1);
			rightLoadingTween.animate("x",1025);
			rightLoadingTween.animate("y",475);
			rightLoadingTween.onComplete = playRight;
			Starling.juggler.add(rightLoadingTween);
			
			rightATween = new Tween(rightAlpha,.5);
			rightATween.animate("scale",1);
			rightATween.animate("x",1055);
			rightATween.animate("y",520);
			rightATween.onComplete = playRight;
			Starling.juggler.add(rightATween);
			
		}
		public function glowIn():void
		{
			loadingWinterTween = new Tween(glow,2);
			loadingWinterTween.animate("alpha",1);
			loadingWinterTween.onComplete = enableWinter;
			Starling.juggler.add(loadingWinterTween);
		}
		public function deactivateLoadingModules():void
		{
			loadingWinterTween = new Tween(glow,1);
			loadingWinterTween.animate("alpha",0);
			Starling.juggler.add(loadingWinterTween);
			
			out1T = new Tween(outerDecal,1);
			out1T.animate("alpha",0);
			out1T.animate("scale", 0);
			Starling.juggler.add(out1T);
			
			out2T = new Tween(outerDecal2,1);
			out2T.animate("alpha",0);
			out2T.animate("scale", 0);
			Starling.juggler.add(out2T);
			
			emblemT = new Tween(emblem,1);
			emblemT.animate("alpha",0);
			emblemT.animate("scale", 0);
			Starling.juggler.add(emblemT);
			
			cellT = new Tween(cell,1);
			cellT.animate("alpha",0);
			cellT.animate("scale", 0);
			Starling.juggler.add(cellT);
			
			rightLoadingTween = new Tween(rightloadingModule,1);
			rightLoadingTween.animate("alpha",0);
			rightLoadingTween.animate("x", 600);
			rightLoadingTween.animate("y", 400);
			Starling.juggler.add(rightLoadingTween);
			
			leftLoadingTween = new Tween(leftloadingModule,1);
			leftLoadingTween.animate("alpha",0);
			leftLoadingTween.animate("x", 600);
			leftLoadingTween.animate("y", 400);
			Starling.juggler.add(leftLoadingTween);
			
			leftAlpha.alpha = 0;
			rightAlpha.alpha = 0;
			
			toploadingoneTween = new Tween(toploadingone,0.2);
			toploadingoneTween.animate("alpha",0);
			Starling.juggler.add(toploadingoneTween);
			
			toploadingtwoTween = new Tween(toploadingtwo,0.2);
			toploadingtwoTween.animate("alpha",0);
			Starling.juggler.add(toploadingtwoTween);
			
			toploadingthreeTween = new Tween(toploadingthree,0.2);
			toploadingthreeTween.animate("alpha",0);
			Starling.juggler.add(toploadingthreeTween);
			
			toploadingTween = new Tween(toploadingModule,1);
			toploadingTween.animate("alpha",0);
			toploadingTween.animate("x", 600);
			toploadingTween.animate("y", 400);
			Starling.juggler.add(toploadingTween);
			
			topRloadingTween = new Tween(topRloadingModule,1);
			topRloadingTween.animate("alpha",0);
			topRloadingTween.animate("x", 600);
			topRloadingTween.animate("y", 400);
			Starling.juggler.add(topRloadingTween);
			
			TcenterOS = new Tween(centerOS,1);
			TcenterOS.animate("alpha",0);
			TcenterOS.animate("x", 600);
			TcenterOS.animate("y", 400);
			TcenterOS.onComplete = removeLoadingNodes;
			Starling.juggler.add(TcenterOS);
			
		}
		public function removeLoadingNodes():void
		{
			
			this.removeChild(toploadingtwo);
			toploadingone.alpha = 0;
			
			this.removeChild(toploadingthree);
			toploadingone.alpha = 0;
			
			this.removeChild(toploadingone);
			toploadingone.alpha = 0;
			
			this.removeChild(rightAlpha);
			rightAlpha = null;
			
			this.removeChild(leftAlpha);
			leftAlpha = null;
			
			this.removeChild(glow);
			glow = null;
			
			this.removeChild(outerDecal2);
			outerDecal2 = null;
			
			this.removeChild(outerDecal);
			outerDecal = null;
			
			this.removeChild(emblem);
			emblem = null;
			
			this.removeChild(cell);
			cell = null;
			
			this.removeChild(loadingWinter);
			loadingWinter = null;
			
			this.removeChild(leftloadingModule);
			leftloadingModule = null;
			
			this.removeChild(rightloadingModule);
			loadingWinter = null;
			
			this.removeChild(topRloadingModule);
			loadingWinter = null;
			
			this.removeChild(toploadingModule);
			loadingWinter = null;
			
			
		}
		public function playTopR():void
		{
			topRloadingModule.play();
		}
		public function glowBack():void
		{
			loadingWinterTween = new Tween(glow,1);
			loadingWinterTween.animate("alpha",0);
			loadingWinterTween.onComplete = glowIn;
			Starling.juggler.add(loadingWinterTween);
		}
		public function playLeft():void
		{
			leftloadingModule.play();
			leftAlpha.play();
		}
		public function playRight():void
		{
			rightloadingModule.play();
			rightAlpha.play();
		}
		//SCOPE ANIMATIONS
		public function createScope():void
		{
			OuterCross = new Image(Assets.suittextureplusAtlas.getTexture("OuterCrossHairs"));
			OuterCross.pivotX = OuterCross.width * 0.5;
			OuterCross.pivotY = OuterCross.height * 0.5;
			OuterCross.x = 600;
			OuterCross.y = 370;
			OuterCross.scale = 2.5;
			OuterCross.alpha = 0;
			this.addChild(OuterCross);
			
			OuterTris = new Image(Assets.suittextureplusAtlas.getTexture("OuterCrossHairsTriangles"));
			OuterTris.pivotX = OuterTris.width * 0.5;
			OuterTris.pivotY = OuterTris.height * 0.5;
			OuterTris.x = 600;
			OuterTris.y = 370;
			OuterTris.scale = 2.5;
			OuterTris.alpha = 0;
			this.addChild(OuterTris);
			
			OuterCrossMids = new Image(Assets.suittextureplusAtlas.getTexture("OuterSideSkews"));
			OuterCrossMids.pivotX = OuterCrossMids.width * 0.5;
			OuterCrossMids.pivotY = OuterCrossMids.height * 0.5;
			OuterCrossMids.x = 600;
			OuterCrossMids.y = 370;
			OuterCrossMids.scale = 2.5;
			OuterCrossMids.alpha = 0;
			this.addChild(OuterCrossMids);
			
			Outer1 = new Image(Assets.suittextureplusAtlas.getTexture("OuterCrossSkews"));
			Outer1.pivotX = Outer1.width * 0.5;
			Outer1.pivotY = Outer1.height * 0.5;
			Outer1.x = 600;
			Outer1.y = 370;
			Outer1.scale = 2.5;
			Outer1.alpha = 0;
			this.addChild(Outer1);
			
			Outer2 = new Image(Assets.suittextureplusAtlas.getTexture("OuterCrossSquares"));
			Outer2.pivotX = Outer2.width * 0.5;
			Outer2.pivotY = Outer2.height * 0.5;
			Outer2.x = 600;
			Outer2.y = 370;
			Outer2.scale = 2.5;
			Outer2.alpha = 0;
			this.addChild(Outer2);
			
			Outer3 = new Image(Assets.suittextureplusAtlas.getTexture("OuterSkewsFinal"));
			Outer3.pivotX = Outer3.width * 0.5;
			Outer3.pivotY = Outer3.height * 0.5;
			Outer3.x = 600;
			Outer3.y = 370;
			Outer3.scale = .001;
			Outer3.alpha = 0;
			this.addChild(Outer3);
		}
		public function animateScope():void
		{
			outerCrossT1 = new Tween(OuterCross,.8);
			outerCrossT1.animate("alpha",.4);
			outerCrossT1.animate("scale",.95);
			Starling.juggler.add(outerCrossT1);
			
			outerCrossT2 = new Tween(OuterTris,.9);
			outerCrossT2.animate("alpha",.4);
			outerCrossT2.animate("scale",.95);
			outerCrossT2.onComplete = ActivateInnerScope;
			Starling.juggler.add(outerCrossT2);
			
			setTimeout(animateNodes, 1750);
			
		}
		public function ActivateInnerScope():void
		{
			outerCrossT3 = new Tween(Outer1,.5);
			outerCrossT3.animate("alpha",1);
			outerCrossT3.animate("scale",.95);
			Starling.juggler.add(outerCrossT3);
			
			outerCrossT4 = new Tween(Outer2,.5);
			outerCrossT4.animate("alpha",1);
			outerCrossT4.animate("scale",.95);
			Starling.juggler.add(outerCrossT4);
			
			OuterCrossMidsTween = new Tween(OuterCrossMids, .5);
			OuterCrossMidsTween.animate("alpha",1);
			OuterCrossMidsTween.animate("scale",.95);
			Starling.juggler.add(OuterCrossMidsTween);
			
			outerCrossT5 = new Tween(Outer3,.5);
			outerCrossT5.animate("alpha",1);
			outerCrossT5.animate("scale",.95);
			outerCrossT5.onComplete = removeOuterScopes;
			Starling.juggler.add(outerCrossT5);
		}
		public function removeOuterScopes():void
		{
			outerCrossT1 = new Tween(OuterCross,2.5);
			outerCrossT1.animate("alpha",0);
			Starling.juggler.add(outerCrossT1);
			
			outerCrossT2 = new Tween(OuterTris,2.5);
			outerCrossT2.animate("alpha",0);
			Starling.juggler.add(outerCrossT2);
			
			outer1Tween = new Tween(Outer1,2.5);
			outer1Tween.animate("scale",.85);
			Starling.juggler.add(outer1Tween);
			
			OuterCrossMidsTween = new Tween(OuterCrossMids,2.5);
			OuterCrossMidsTween.animate("scale",.85);
			Starling.juggler.add(OuterCrossMidsTween);
		}
		//WINTER INFORMATION NODES ->
		public function buildInformationNodes():void
		{
			oneNode = new Image(Assets.suittextureplusAtlas.getTexture("cry_00"));
			oneNode.pivotX = oneNode.width * 0.5;
			oneNode.pivotY = (oneNode.height * 0.5);
			oneNode.x = 800;
			oneNode.y = 495;
			oneNode.scale = .95;
			oneNode.alpha = 0;
			this.addChild(oneNode);
			
			twoNode = new Image(Assets.suittextureplusAtlas.getTexture("ice_00"));
			twoNode.pivotX = twoNode.width * 0.5;
			twoNode.pivotY = (twoNode.height * 0.5);
			twoNode.x = 800;
			twoNode.y = 495;
			twoNode.scale = .95;
			twoNode.alpha = 0;
			this.addChild(twoNode);
			
			threeNode = new Image(Assets.suittextureplusAtlas.getTexture("acc_00"));
			threeNode.pivotX = threeNode.width * 0.5;
			threeNode.pivotY = (threeNode.height * 0.5);
			threeNode.x = 800;
			threeNode.y = 495;
			threeNode.scale = .95;
			threeNode.alpha = 0;
			this.addChild(threeNode);
			
			fourNode = new Image(Assets.suittextureplusAtlas.getTexture("mo_00"));
			fourNode.pivotX = fourNode.width * 0.5;
			fourNode.pivotY = (fourNode.height * 0.5);
			fourNode.x = 800;
			fourNode.y = 495;
			fourNode.scale = .95;
			fourNode.alpha = 0;
			this.addChild(fourNode);
		}
		public function fadeModules():void
		{	
			start.motionActive = false;
			
			oneTween = new Tween(oneNode,1);
			oneTween.animate("alpha", 0);
			Starling.juggler.add(oneTween);
				
			twoTween = new Tween(twoNode,2);
			twoTween.animate("alpha", 0);
			Starling.juggler.add(twoTween);
			
			threeTween = new Tween(threeNode,3);
			threeTween.animate("alpha", 0);
			Starling.juggler.add(threeTween);
			
			fourTween = new Tween(fourNode,4);
			fourTween.animate("alpha", 0);
			fourTween.onComplete = removeModules;
			Starling.juggler.add(fourTween);
		}
		public function removeModules():void
		{
			this.removeChild(oneNode);
			this.removeChild(twoNode);
			this.removeChild(threeNode);
			this.removeChild(fourNode);
		}
		public function animateNodes():void
		{
			if(start.missionActive)
			initializeLaunch();
			 
			Assets.winterData.play(0,0,new SoundTransform(0.1));
			
			oneTween = new Tween(oneNode,.5);
			oneTween.animate("x", 600);
			oneTween.animate("alpha", 1);
			oneTween.onComplete = animateNode2;
			Starling.juggler.add(oneTween);
		}
		public function animateNode2():void
		{
			Assets.winterData.play(0,0,new SoundTransform(0.1));
			
			twoTween = new Tween(twoNode,.5);
			twoTween.animate("x", 600);
			twoTween.animate("alpha", 1);
			twoTween.onComplete = animateNode3;
			Starling.juggler.add(twoTween);
		}
		public function animateNode3():void
		{
			Assets.winterData.play(0,0,new SoundTransform(0.1));
			
			threeTween = new Tween(threeNode,.5);
			threeTween.animate("x", 600);
			threeTween.animate("alpha", 1);
			threeTween.onComplete = animateNode4;
			Starling.juggler.add(threeTween);
		}
		public function animateNode4():void
		{
			Assets.winterData.play(0,0,new SoundTransform(0.1));
			
			fourTween = new Tween(fourNode,.5);
			fourTween.animate("x", 600);
			fourTween.animate("alpha", 1);
			fourTween.onComplete = fadeModules;
			Starling.juggler.add(fourTween);
			
		}
		public function playWinterData():void
		{
			Assets.winterData.play(0,0,new SoundTransform(.25));
		}
		public function enableWinter():void
		{
			start.winterActive = true;
			buildInformationNodes();
			spaceSuit.deactivateBottom();
			deactivateLoadingModules();
			
			//main winter mask image
			scope = new Image(Assets.maskTexture);
			scope.pivotX = scope.width * 0.5;
			scope.pivotY = (scope.height * 0.5) - 90;
			scope.x = 600;
			scope.y = 400;
			scope.scale = 2.5;
			scope.alpha = 0;
			this.addChild(scope);
				
			///GAS MASK MODULES
			
			//RIGHT MODULE ->
			//right module(gas mask)
			rotationRight = new Sprite3D();
			rotationRight.pivotX = rotationRight.width * 0.5;
			rotationRight.pivotY = rotationRight.height * 0.5;
			rotationRight.x = 600;
			rotationRight.y = 400;
			rotationRight.scale = 2.5;
			rotationRight.alpha = 0;
			rotationRight.rotationY = 2.6;

			
			//image oxy blue small
			rotationrightOxy = new Image(Assets.oxyBlueTexture);
			rotationrightOxy.pivotX = rotationrightOxy.width * 0.5;
			rotationrightOxy.pivotY = rotationrightOxy.height * 0.5;
			rotationrightOxy.x = (rotationRight.width * 0.5) - 120;
			rotationrightOxy.y = (rotationRight.height * 0.5) + 320;
			rotationrightOxy.scale = 0.4;
			
			//image oxy white small
			rotationrightOxyWhite = new Image(Assets.oxyWhiteTexture);
			rotationrightOxyWhite.pivotX = rotationrightOxyWhite.width * 0.5;
			rotationrightOxyWhite.pivotY = rotationrightOxyWhite.height * 0.5;
			rotationrightOxyWhite.x = (rotationRight.width * 0.5) - 120;
			rotationrightOxyWhite.y = (rotationRight.height * 0.5) + 320;
			rotationrightOxyWhite.scale = 0.4;
			
			//image oxy blue BIG
			rotationrightOxyBig = new Image(Assets.oxyBlueTexture);
			rotationrightOxyBig.pivotX = rotationrightOxyBig.width * 0.5;
			rotationrightOxyBig.pivotY = rotationrightOxyBig.height * 0.5;
			rotationrightOxyBig.x = (rotationRight.width * 0.5) - 145;
			rotationrightOxyBig.y = (rotationRight.height * 0.5) + 249;
			rotationrightOxyBig.scale = 0.42;
			
			//image oxy white BIG
			rotationrightOxyBigWhite = new Image(Assets.oxyWhiteTexture);
			rotationrightOxyBigWhite.pivotX = rotationrightOxyBigWhite.width * 0.5;
			rotationrightOxyBigWhite.pivotY = rotationrightOxyBigWhite.height * 0.5;
			rotationrightOxyBigWhite.x = (rotationRight.width * 0.5) - 145;
			rotationrightOxyBigWhite.y = (rotationRight.height * 0.5) + 249;
			rotationrightOxyBigWhite.scale = 0.42;
			
			
			//LEFT MODULE ->
			
			//left module(gas mask)
			rotationLeft = new Sprite3D();
			rotationLeft.pivotX = rotationLeft.width * 0.5;
			rotationLeft.pivotY = rotationLeft.height * 0.5;
			rotationLeft.x = 600;
			rotationLeft.y = 400;
			rotationLeft.scale = 2.5;
			rotationLeft.alpha = 0;
			rotationLeft.rotationY = -2.6;
			
			//image oxy blue SMALL
			rotationleftOxy = new Image(Assets.oxyBlueTexture);
			rotationleftOxy.pivotX = rotationleftOxy.width * 0.5;
			rotationleftOxy.pivotY = rotationleftOxy.height * 0.5;
			rotationleftOxy.x = (rotationLeft.width * 0.5) + 115;
			rotationleftOxy.y = (rotationLeft.height * 0.5) + 320;
			rotationleftOxy.scale = 0.4;
			
			//image oxy white SMALL
			rotationleftOxyWhite = new Image(Assets.oxyWhiteTexture);
			rotationleftOxyWhite.pivotX = rotationleftOxyWhite.width * 0.5;
			rotationleftOxyWhite.pivotY = rotationleftOxyWhite.height * 0.5;
			rotationleftOxyWhite.x = (rotationLeft.width * 0.5) + 115;
			rotationleftOxyWhite.y = (rotationLeft.height * 0.5) + 320;
			rotationleftOxyWhite.scale = 0.4;
			
			//image oxy blue BIG
			rotationleftOxyBig = new Image(Assets.oxyBlueTexture);
			rotationleftOxyBig.pivotX = rotationleftOxyBig.width * 0.5;
			rotationleftOxyBig.pivotY = rotationleftOxyBig.height * 0.5;
			rotationleftOxyBig.x = (rotationLeft.width * 0.5) + 140;
			rotationleftOxyBig.y = (rotationLeft.height * 0.5) + 249;
			rotationleftOxyBig.scale = 0.42;
			
			//image oxy blue BIG
			rotationleftOxyBigWhite = new Image(Assets.oxyWhiteTexture);
			rotationleftOxyBigWhite.pivotX = rotationleftOxyBigWhite.width * 0.5;
			rotationleftOxyBigWhite.pivotY = rotationleftOxyBigWhite.height * 0.5;
			rotationleftOxyBigWhite.x = (rotationLeft.width * 0.5) + 140;
			rotationleftOxyBigWhite.y = (rotationLeft.height * 0.5) + 249;
			rotationleftOxyBigWhite.scale = 0.42;
			
			
			
			//3d sprite left additions
			rotationLeft.addChild(rotationleftOxy);
			rotationLeft.addChild(rotationleftOxyWhite);
			rotationLeft.addChild(rotationleftOxyBig);
			rotationLeft.addChild(rotationleftOxyBigWhite);
			
			//3d sprite right additions
			rotationRight.addChild(rotationrightOxy);
			rotationRight.addChild(rotationrightOxyWhite);
			rotationRight.addChild(rotationrightOxyBig);
			rotationRight.addChild(rotationrightOxyBigWhite);
			
			this.addChild(rotationRight);
			this.addChild(rotationLeft);
			
			createScope();
			
			Assets.winter.play();
			
			tweenRight = new Tween(rotationRight,.5);
			tweenRight.animate("alpha",1);
			tweenRight.animate("scale",1);
			tweenRight.onComplete = animateScope;
			Starling.juggler.add(tweenRight);
			
			tweenLeft = new Tween(rotationLeft,.5);
			tweenLeft.animate("alpha",1);
			tweenLeft.animate("scale",1);
			Starling.juggler.add(tweenLeft);
			
			tweenScope = new Tween(scope,.3);
			tweenScope.animate("alpha",1);
			tweenScope.animate("scale",.95);
			Starling.juggler.add(tweenScope);
				
		}
		public function disableWinter():void
		{
			tweenRight = new Tween(rotationRight,.5);
			tweenRight.animate("alpha",0);
			Starling.juggler.add(tweenRight);
			
			tweenLeft = new Tween(rotationLeft,.5);
			tweenLeft.animate("alpha",0);
			Starling.juggler.add(tweenLeft);
			
			tweenScope = new Tween(scope,.9);
			tweenScope.animate("alpha",0);
			tweenScope.onComplete = removeNodes;
			Starling.juggler.add(tweenScope);
			
			Outer1.alpha = 0;
			Outer2.alpha = 0;
			Outer3.alpha = 0;
			OuterCrossMids.alpha = 0;
			
		}
		public function removeNodes():void
		{
			this.removeChild(OuterCrossMids);
			OuterCrossMids = null;
			
			this.removeChild(OuterCross);
			OuterCross = null;
			
			this.removeChild(OuterTris);
			OuterTris = null;
			
			this.removeChild(Outer1);
			Outer1 = null;
			
			this.removeChild(Outer2);
			Outer2 = null;
			
			this.removeChild(Outer3);
			Outer3 = null;
			
			this.removeChild(rotationRight);
			rotationRight = null;
			
			this.removeChild(rotationLeft);
			rotationLeft = null
				
			this.removeChild(scope);
			scope = null;
		}
		
		public function update():void
		{			
			if(cell != null)
			cell.rotation += .009;
			
			if(outerDecal != null)
			outerDecal.rotation += .003;
			
			if(outerDecal2 != null)
				outerDecal2.rotation -= .003;
				
			if(OuterTris != null)
			OuterTris.rotation += .009;
			
			if(rotationrightOxyBig != null)
			rotationrightOxyBig.rotation += .03;
			
			if(rotationrightOxy != null)
			rotationrightOxy.rotation += .03;
			
			if(rotationleftOxy != null)
			rotationleftOxy .rotation += -.03;
			
			if(rotationleftOxyBig != null)
			rotationleftOxyBig.rotation += -.03;
		}
	}
}