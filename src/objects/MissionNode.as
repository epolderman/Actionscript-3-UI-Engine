package objects
{
	import flash.media.SoundTransform;
	import flash.utils.setTimeout;
	
	import corez.Assets;
	
	import objects.cancelButtonMission;
	import objects.startButtonMission;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	import states.Startup;
	
	public class MissionNode extends Sprite
	{
		private var locationSphereRed:Image;
		private var locationSphereRedTween:Tween;
		
		private var locationLine:Image;
		private var locationLineRed:Image;
		private var locationLineTween:Tween;
		private var locationLineRedTween:Tween;
		
		private var locationText:MovieClip;
		private var locationTextTween:Tween;
		
		private var locationtohydra:Image;
		private var locationtohydraRed:Image;
		private var locationtohydraTween:Tween;
		private var locationtohydraRedTween:Tween;
		
		private var hydraTween:Tween;
		
		private var hydratoname:Image;
		private var hydratonameRed:Image;
		private var hydratonameTween:Tween;
		private var hydratonameRedTween:Tween;
		
		private var primalname:MovieClip;
		private var primalnameTween:Tween;
		
		//mission panels
		private var missionPanel:Image;
		private var missionPanelTween:Tween;
		private var missionTopBracket:Image;
		private var missionBottomBracket:Image;
		private var missionTopBracketTween:Tween;
		private var missionBottomBracketTween:Tween;
		private var missionFooter:Image;
		private var missionAssign:MovieClip;
		private var missionCas:MovieClip;
		private var missionReport:MovieClip;
		private var missionSupport:MovieClip;
		private var missionWeapons:MovieClip;
		private var missionNotes:MovieClip;
		
		private var bbTop:Image;
		private var bbTopTween:Tween;
		
		private var bbBot:Image;
		private var bbBotTween:Tween;
		
		private var startButton:startButtonMission;
		private var cancelButton:cancelButtonMission;
		private var startup:Startup;
		
		private var attack1:Image;
		private var attack2:Image;
		private var attack1T:Tween;
		private var attack2T:Tween;
		
		private var winterMask:WinterMask;
		
		private var attackDisplay:MovieClip;
		private var attackDisplayTween:Tween;
		private var attackDisplayAlpha:MovieClip;
		private var attackDisplayAlphaTween:Tween;
		
		private var onsite:MovieClip;
		private var onsiteAlpha:MovieClip;
		private var onsiteTween:Tween;
		private var onsiteAlphaTween:Tween;
		private var hy:MovieClip;
		
		private var biohazard:MovieClip;
		private var biohazardAlpha:MovieClip;
		
		private var bTween:Tween;
		private var bAlphaTween:Tween;
		private var attackline1:Image;
		private var attackline2:Image;
		private var attackline1Red:Image;
		private var attackline2Red:Image;
		
		private var attackline1T:Tween;
		private var attackline2T:Tween;
		private var attackline1RedT:Tween;
		private var attackline2RedT:Tween;
		
		public function MissionNode(start:Startup, winter:WinterMask) 
		{
			this.startup = start;
			this.winterMask = winter;
		}
		public function CANCEL():void
		{
			Assets.button2.play(0,0,new SoundTransform(1));
			startup.stopEvil();
			startup.fadeMissionNode();
			startup.createMission();
			startup.missionActive = false;
		}
		public function LAUNCH():void
		{
			Assets.button2.play(0,0,new SoundTransform(1));
			startup.stopEvil();
			startup.fadeMissionNode();
			winterMask.triggerWinter();
			startup.missionActive = true;
		}
		public function startMissionPanelSequence():void
		{
			startup.missionActive = true;
			createMissionPanel();
			
			missionPanelTween = new Tween(missionPanel,.5);
			missionPanelTween.animate("alpha", .8);
			missionPanelTween.animate("scale", .8);
			missionPanelTween.animate("x", 800);
			missionPanelTween.animate("y", 400);
			missionPanelTween.onComplete = sizeBrackets;
			Starling.juggler.add(missionPanelTween);
			
			attack1 = new Image(Assets.button1textureAtlas.getTexture("attackSpins"));
			attack1.pivotX = attack1.width * 0.5;
			attack1.pivotY = attack1.height * 0.5;
			attack1.x = 269;
			attack1.y = 170;
			attack1.alpha = 0;
			attack1.scale = .1;
			this.addChild(attack1);
			
			attack2 = new Image(Assets.button1textureAtlas.getTexture("attackSpins"));
			attack2.pivotX = attack2.width * 0.5;
			attack2.pivotY = (attack2.height * 0.5);
			attack2.x = 269;
			attack2.y = 170;
			attack2.alpha = 0;
			attack2.scale = .1;
			this.addChild(attack2);
			
			Assets.buttonSlide.play(0,0,new SoundTransform(.75));
			setTimeout(startMission, 1000);
			setTimeout(attackReport, 8000);
		}
		public function attackReport():void
		{
			attackDisplay = new MovieClip(Assets.nodeTextureAtlas.getTextures("attacks"));
			attackDisplay.setFrameDuration(0,0.3);
			attackDisplay.addFrame(Assets.nodeTextureAtlas.getTexture("attacks00"),null,0.3);
			attackDisplay.loop = true;
			attackDisplay.pivotX = attackDisplay.width * 0.5;
			attackDisplay.pivotY = (attackDisplay.height * 0.5);
			attackDisplay.x = 600;
			attackDisplay.y = 400;
			attackDisplay.alpha = 0;
			attackDisplay.scale = .1;
			this.addChild(attackDisplay);
			Starling.juggler.add(attackDisplay);
			attackDisplay.play();
			
			attackDisplayAlpha = new MovieClip(Assets.nodeTextureAtlas.getTextures("attacks"));
			attackDisplayAlpha.setFrameDuration(0,0.3);
			attackDisplayAlpha.addFrame(Assets.nodeTextureAtlas.getTexture("attacks00"),null,0.3);
			attackDisplayAlpha.loop = true;
			attackDisplayAlpha.pivotX = attackDisplayAlpha.width * 0.5;
			attackDisplayAlpha.pivotY = (attackDisplayAlpha.height * 0.5);
			attackDisplayAlpha.x = 600;
			attackDisplayAlpha.y = 400;
			attackDisplayAlpha.alpha = 0;
			attackDisplayAlpha.scale = .1;
			this.addChild(attackDisplayAlpha);
			Starling.juggler.add(attackDisplayAlpha);
			attackDisplayAlpha.play();
			
			Assets.missionAura.play(0,0,new SoundTransform(.4));
			
			attackDisplayTween = new Tween(attackDisplay,.5);
			attackDisplayTween.animate("alpha", .95);
			attackDisplayTween.animate("scale", .6);
			attackDisplayTween.animate("x", 1050);
			attackDisplayTween.animate("y", 170);
			attackDisplayTween.onComplete = onsiteAmmo;
			Starling.juggler.add(attackDisplayTween);
			
			attackDisplayAlphaTween = new Tween(attackDisplayAlpha,.5);
			attackDisplayAlphaTween.animate("alpha", .1);
			attackDisplayAlphaTween.animate("scale", .6);
			attackDisplayAlphaTween.animate("x", 1070);
			attackDisplayAlphaTween.animate("y", 150);
			Starling.juggler.add(attackDisplayAlphaTween);
			
		}
		public function onsiteAmmo():void
		{
			onsite = new MovieClip(Assets.nodeTextureAtlas.getTextures("s00"));
			onsite.setFrameDuration(0,0.1);
			onsite.addFrame(Assets.nodeTextureAtlas.getTexture("s01"),null,0.1);
			onsite.addFrame(Assets.nodeTextureAtlas.getTexture("s02"),null,0.1);
			onsite.addFrame(Assets.nodeTextureAtlas.getTexture("s03"),null,0.1);
			onsite.addFrame(Assets.nodeTextureAtlas.getTexture("s04"),null,0.1);
			onsite.addFrame(Assets.nodeTextureAtlas.getTexture("s05"),null,0.1);
			onsite.loop = false;
			onsite.pivotX = onsite.width * 0.5;
			onsite.pivotY = (onsite.height * 0.5);
			onsite.x = 600;
			onsite.y = 400;
			onsite.alpha = 0;
			onsite.scale = .1;
			this.addChild(onsite);
			Starling.juggler.add(onsite);
			onsite.play();
			
			onsiteAlpha = new MovieClip(Assets.nodeTextureAtlas.getTextures("s00"));
			onsiteAlpha.setFrameDuration(0,0.3);
			onsiteAlpha.addFrame(Assets.nodeTextureAtlas.getTexture("s01"),null,0.3);
			onsiteAlpha.addFrame(Assets.nodeTextureAtlas.getTexture("s02"),null,0.3);
			onsiteAlpha.addFrame(Assets.nodeTextureAtlas.getTexture("s03"),null,0.3);
			onsiteAlpha.addFrame(Assets.nodeTextureAtlas.getTexture("s04"),null,0.3);
			onsiteAlpha.addFrame(Assets.nodeTextureAtlas.getTexture("s05"),null,0.3);
			onsiteAlpha.loop = true;
			onsiteAlpha.pivotX = onsiteAlpha.width * 0.5;
			onsiteAlpha.pivotY = (onsiteAlpha.height * 0.5);
			onsiteAlpha.x = 600;
			onsiteAlpha.y = 400;
			onsiteAlpha.alpha = 0;
			onsiteAlpha.scale = .1;
			this.addChild(onsiteAlpha);
			Starling.juggler.add(onsiteAlpha);
			onsiteAlpha.play();
			
			Assets.missionAura.play(0,0,new SoundTransform(.4));
			
			onsiteTween = new Tween(onsite,.5);
			onsiteTween.animate("alpha", 1);
			onsiteTween.animate("scale", .6);
			onsiteTween.animate("x", 1050);
			onsiteTween.animate("y", 370);
			Starling.juggler.add(onsiteTween);
			
			onsiteAlphaTween = new Tween(onsiteAlpha,.5);
			onsiteAlphaTween.animate("alpha", .1);
			onsiteAlphaTween.animate("scale", .6);
			onsiteAlphaTween.animate("x", 1070);
			onsiteAlphaTween.animate("y", 350);
			onsiteAlphaTween.onComplete = bio;
			Starling.juggler.add(onsiteAlphaTween);
		}
		public function bio():void
		{
			biohazard = new MovieClip(Assets.nodeTextureAtlas.getTextures("bio1"));
			biohazard.setFrameDuration(0,1);
			biohazard.addFrame(Assets.nodeTextureAtlas.getTexture("bio2"),null,1);
			biohazard.addFrame(Assets.nodeTextureAtlas.getTexture("bio3"),null,1);
			biohazard.addFrame(Assets.nodeTextureAtlas.getTexture("bio4"),null,1);
			biohazard.loop = true;
			biohazard.pivotX = biohazard.width * 0.5;
			biohazard.pivotY = (biohazard.height * 0.5);
			biohazard.x = 600;
			biohazard.y = 400;
			biohazard.alpha = 0;
			biohazard.scale = .1;
			this.addChild(biohazard);
			Starling.juggler.add(biohazard);
			biohazard.play();
			
			biohazardAlpha = new MovieClip(Assets.nodeTextureAtlas.getTextures("bio1"));
			biohazardAlpha.setFrameDuration(0,1);
			biohazardAlpha.addFrame(Assets.nodeTextureAtlas.getTexture("bio2"),null,1);
			biohazardAlpha.addFrame(Assets.nodeTextureAtlas.getTexture("bio3"),null,1);
			biohazardAlpha.addFrame(Assets.nodeTextureAtlas.getTexture("bio4"),null,1);
			biohazardAlpha.loop = true;
			biohazardAlpha.pivotX = biohazardAlpha.width * 0.5;
			biohazardAlpha.pivotY = (biohazardAlpha.height * 0.5);
			biohazardAlpha.x = 600;
			biohazardAlpha.y = 400;
			biohazardAlpha.alpha = 0;
			biohazardAlpha.scale = .1;
			this.addChild(biohazardAlpha);
			Starling.juggler.add(biohazardAlpha);
			biohazardAlpha.play();
			
			Assets.missionAura.play(0,0,new SoundTransform(.4));
			
			bTween = new Tween(biohazard,.5);
			bTween.animate("alpha", 1);
			bTween.animate("scale", .6);
			bTween.animate("x", 1050);
			bTween.animate("y", 570);
			Starling.juggler.add(bTween);
			
			bAlphaTween = new Tween(biohazardAlpha,.5);
			bAlphaTween.animate("alpha", .1);
			bAlphaTween.animate("scale", .6);
			bAlphaTween.animate("x", 1070);
			bAlphaTween.animate("y", 550);
			Starling.juggler.add(bAlphaTween);
		}
		public function startAttacks():void
		{
			attack1.alpha = .5;
			
			attack1T = new Tween(attack1,.5);
			attack1T.animate("y", 115);
			attack1T.animate("alpha", 1);
			attack1T.animate("scale", .5);
			attack1T.animate("x",400);
			attack1T.onComplete = attack2go;
			Starling.juggler.add(attack1T);
			
		}
		public function attack2go():void
		{
			attack2.alpha = .5;
			attack2T = new Tween(attack2,.5);
			attack2T.animate("y", 99);
			attack2T.animate("alpha", 1);
			attack2T.animate("scale", .5);
			attack2T.animate("x",355);
			attack2T.onComplete = scaleCross;
			Starling.juggler.add(attack2T);
			
		}
		public function sizeBrackets():void
		{
			missionTopBracketTween = new Tween(missionTopBracket,2.0);
			missionTopBracketTween.animate("alpha", 1);
			missionTopBracketTween.animate("y", 400);
			Starling.juggler.add(missionTopBracketTween);
			
			missionBottomBracketTween = new Tween(missionBottomBracket,2.0);
			missionBottomBracketTween.animate("alpha", 1);
			missionBottomBracketTween.animate("y", 400);
			missionBottomBracketTween.onComplete = startDisplay;
			Starling.juggler.add(missionBottomBracketTween);
		}
		public function startDisplay():void
		{
			missionFooter.alpha = 1;
			
			missionAssign = new MovieClip(Assets.winterTextureAtlas.getTextures("a40"));
			missionAssign.setFrameDuration(0,0.1);
			missionAssign.setFrameSound(0,Assets.typingAura);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a39"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a38"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a37"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a36"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a35"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a34"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a33"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a32"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a31"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a30"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a29"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a28"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a27"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a26"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a25"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a24"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a23"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a22"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a21"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a20"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a19"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a18"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a17"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a16"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a15"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a14"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a13"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a12"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a11"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a10"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a09"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a08"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a07"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a06"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a05"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a04"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a03"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a02"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a01"),Assets.typingAura,0.1);
			missionAssign.addFrame(Assets.winterTextureAtlas.getTexture("a00"),Assets.typingAura,0.1);
			missionAssign.addEventListener(Event.COMPLETE,startDisplaySecond); 
			missionAssign.alpha = 1;
			missionAssign.loop = false;
			missionAssign.pivotX = missionAssign.width * 0.5;
			missionAssign.pivotY = (missionAssign.height * 0.5);
			missionAssign.x = 800;
			missionAssign.y = 420;
			missionAssign.scale = 1;
			this.addChild(missionAssign);
			Starling.juggler.add(missionAssign);
			missionAssign.play();
		}
		public function startDisplaySecond():void
		{
			missionCas = new MovieClip(Assets.winterTextureAtlas.getTextures("cas07"));
			missionCas.setFrameDuration(0,0.1);
			missionCas.setFrameSound(0,Assets.typingAura);
			missionCas.addFrame(Assets.winterTextureAtlas.getTexture("cas06"),Assets.typingAura,0.1);
			missionCas.addFrame(Assets.winterTextureAtlas.getTexture("cas05"),Assets.typingAura,0.1);
			missionCas.addFrame(Assets.winterTextureAtlas.getTexture("cas04"),Assets.typingAura,0.1);
			missionCas.addFrame(Assets.winterTextureAtlas.getTexture("cas03"),Assets.typingAura,0.1);
			missionCas.addFrame(Assets.winterTextureAtlas.getTexture("cas02"),Assets.typingAura,0.1);
			missionCas.addFrame(Assets.winterTextureAtlas.getTexture("cas01"),Assets.typingAura,0.1);
			missionCas.addFrame(Assets.winterTextureAtlas.getTexture("cas00"),Assets.typingAura,0.1);
			missionCas.addEventListener(Event.COMPLETE,startDisplayThird); 
			missionCas.alpha = 1;
			missionCas.loop = false;
			missionCas.pivotX = missionCas.width * 0.5;
			missionCas.pivotY = (missionCas.height * 0.5);
			missionCas.x = 800;
			missionCas.y = 420;
			missionCas.scale = 1;
			this.addChild(missionCas);
			Starling.juggler.add(missionCas);
			missionCas.play();
		}
		public function startDisplayThird():void
		{
			missionReport = new MovieClip(Assets.suittextureplusAtlas.getTextures("r138"));
			missionReport.setFrameDuration(0,0.1);
			missionReport.setFrameSound(0,Assets.typingAura);
			for(var i:int = 137; i >= 0; i--)
			{
				if(i > 9)
					missionReport.addFrame(Assets.suittextureplusAtlas.getTexture("r" + i),Assets.typingAura,0.1);
				else
					missionReport.addFrame(Assets.suittextureplusAtlas.getTexture("r0" + i),Assets.typingAura,0.1);
			}
			missionReport.alpha = 1;
			missionReport.loop = false;
			missionReport.pivotX = missionReport.width * 0.5;
			missionReport.pivotY = (missionReport.height * 0.5);
			missionReport.addEventListener(Event.COMPLETE,startDisplay4); 
			missionReport.x = 800;
			missionReport.y = 420;
			missionReport.scale = 1;
			this.addChild(missionReport);
			Starling.juggler.add(missionReport);
			missionReport.play();
		}
		public function startDisplay4():void
		{
			missionSupport = new MovieClip(Assets.button1textureAtlas.getTextures("sup04"));
			missionSupport.setFrameDuration(0,0.1);
			missionSupport.setFrameSound(0,Assets.typingAura);
			missionSupport.addFrame(Assets.button1textureAtlas.getTexture("sup03"),Assets.typingAura,0.1);
			missionSupport.addFrame(Assets.button1textureAtlas.getTexture("sup02"),Assets.typingAura,0.1);
			missionSupport.addFrame(Assets.button1textureAtlas.getTexture("sup01"),Assets.typingAura,0.1);
			missionSupport.addFrame(Assets.button1textureAtlas.getTexture("sup00"),Assets.typingAura,0.1);
			missionSupport.addEventListener(Event.COMPLETE,startDisplay5); 
			missionSupport.alpha = 1;
			missionSupport.loop = false;
			missionSupport.pivotX = missionSupport.width * 0.5;
			missionSupport.pivotY = (missionSupport.height * 0.5);
			missionSupport.x = 800;
			missionSupport.y = 420;
			missionSupport.scale = 1;
			this.addChild(missionSupport);
			Starling.juggler.add(missionSupport);
			missionSupport.play();
		}
		public function startDisplay5():void
		{
			missionWeapons = new MovieClip(Assets.button1textureAtlas.getTextures("weap30"));
			missionWeapons.setFrameDuration(0,0.1);
			missionWeapons.setFrameSound(0,Assets.typingAura);
			for(var z:int = 29; z >= 0; z--)
			{
				if(z > 9)
					missionWeapons.addFrame(Assets.button1textureAtlas.getTexture("weap" + z),Assets.typingAura,0.1);
				else
					missionWeapons.addFrame(Assets.button1textureAtlas.getTexture("weap0" + z),Assets.typingAura,0.1);
			}
			missionWeapons.addEventListener(Event.COMPLETE,startDisplay6); 
			missionWeapons.alpha = 1;
			missionWeapons.loop = false;
			missionWeapons.pivotX = missionWeapons.width * 0.5;
			missionWeapons.pivotY = (missionWeapons.height * 0.5);
			missionWeapons.x = 800;
			missionWeapons.y = 420;
			missionWeapons.scale = 1;
			this.addChild(missionWeapons);
			Starling.juggler.add(missionWeapons);
			missionWeapons.play();
		}
		public function startDisplay6():void
		{
			missionNotes = new MovieClip(Assets.button1textureAtlas.getTextures("no25"));
			missionNotes.setFrameDuration(0,0.1);
			missionNotes.setFrameSound(0,Assets.typingAura);
			for(var k:int = 24; k >= 0; k--)
			{
				if(k > 9)
					missionNotes.addFrame(Assets.button1textureAtlas.getTexture("no" + k),Assets.typingAura,0.1);
				else
					missionNotes.addFrame(Assets.button1textureAtlas.getTexture("no0" + k),Assets.typingAura,0.1);
			}
			missionNotes.alpha = 1;
			missionNotes.loop = false;
			missionNotes.pivotX = missionNotes.width * 0.5;
			missionNotes.pivotY = (missionNotes.height * 0.5);
			missionNotes.addEventListener(Event.COMPLETE,buildButtonBrackets);
			missionNotes.x = 800;
			missionNotes.y = 420;
			missionNotes.scale = 1;
			this.addChild(missionNotes);
			Starling.juggler.add(missionNotes);
			missionNotes.play();
		}
		
		public function buildButtonBrackets():void
		{
			missionNotes.removeEventListener(Event.COMPLETE, buildButtonBrackets);
			missionWeapons.removeEventListener(Event.COMPLETE,startDisplay6);
			missionSupport.removeEventListener(Event.COMPLETE,startDisplay5); 
			missionReport.removeEventListener(Event.COMPLETE,startDisplay4); 
			
			bbTop = new Image(Assets.winterTextureAtlas.getTexture("missionpaneltopbracket"));
			bbTop.pivotX = bbTop.width * 0.5;
			bbTop.pivotY = (bbTop.height * 0.5);
			bbTop.x = 800;
			bbTop.y = 750;
			bbTop.scale = .8;
			bbTop.alpha = 0;
			this.addChild(bbTop);
			
			bbBot = new Image(Assets.winterTextureAtlas.getTexture("missionpanelbottombracket"));
			bbBot.pivotX = bbBot.width * 0.5;
			bbBot.pivotY = (bbBot.height * 0.5);
			bbBot.x = 800;
			bbBot.y = 300;
			bbBot.scale = .8;
			bbBot.alpha = 0;
			this.addChild(bbBot);
			
			Assets.bracket.play(0,0,new SoundTransform(1));
			
			bbTopTween = new Tween(bbTop,1);
			bbTopTween.animate("y", 685);
			bbTopTween.animate("alpha", 1);
			Starling.juggler.add(bbTopTween);
				
			bbBotTween = new Tween(bbBot,1);
			bbBotTween.animate("y", 365);
			bbBotTween.animate("alpha", 1);
			bbBotTween.onComplete = displayMissionButtons;
			Starling.juggler.add(bbBotTween);	
		}
		public function displayMissionButtons():void
		{			
			startButton = new startButtonMission();
			startButton.x = 800;
			startButton.y = 500;
			startButton.alpha = 1;
			startButton.addEventListener(Event.TRIGGERED, LAUNCH);
			this.addChild(startButton);
			
			cancelButton = new cancelButtonMission();
			cancelButton.x = 800;
			cancelButton.y = 545;
			cancelButton.alpha = 1;
			cancelButton.addEventListener(Event.TRIGGERED, CANCEL);
			this.addChild(cancelButton);
			
		}
		public function createMissionPanel():void
		{
			missionPanel = new Image(Assets.winterTextureAtlas.getTexture("missionpanel"));
			missionPanel.pivotX = missionPanel.width * 0.5;
			missionPanel.pivotY = (missionPanel.height * 0.5);
			missionPanel.x = 553;
			missionPanel.y = 380;
			missionPanel.scale = .1;
			missionPanel.alpha = 0;
			this.addChild(missionPanel);
			
			missionTopBracket = new Image(Assets.winterTextureAtlas.getTexture("missionpaneltopbracket"));
			missionTopBracket.pivotX = missionTopBracket.width * 0.5;
			missionTopBracket.pivotY = (missionTopBracket.height * 0.5);
			missionTopBracket.x = 800;
			missionTopBracket.y = 650;
			missionTopBracket.scale = .8;
			missionTopBracket.alpha = 0;
			this.addChild(missionTopBracket);
			
			missionBottomBracket = new Image(Assets.winterTextureAtlas.getTexture("missionpanelbottombracket"));
			missionBottomBracket.pivotX = missionBottomBracket.width * 0.5;
			missionBottomBracket.pivotY = (missionBottomBracket.height * 0.5);
			missionBottomBracket.x = 800;
			missionBottomBracket.y = 150;
			missionBottomBracket.scale = .8;
			missionBottomBracket.alpha = 0;
			this.addChild(missionBottomBracket);
			
			missionFooter = new Image(Assets.winterTextureAtlas.getTexture("footer"));
			missionFooter.pivotX = missionFooter.width * 0.5;
			missionFooter.pivotY = (missionFooter.height * 0.5);
			missionFooter.x = 777.5;
			missionFooter.y = 345;
			missionFooter.alpha = 0;
			missionFooter.scale = 1;
			this.addChild(missionFooter);
			
				
		}
		public function createMissionLocation():void
		{
			locationLine = new Image(Assets.winterTextureAtlas.getTexture("locationLine"));
			locationLine.pivotX = locationLine.width * 0.5;
			locationLine.pivotY = (locationLine.height * 0.5);
			locationLine.x = 600;
			locationLine.y = 400;
			locationLine.alpha = 0;
			locationLine.scale = .95;
			this.addChild(locationLine);
			
			//red
			locationLineRed = new Image(Assets.winterTextureAtlas.getTexture("locationLineRed"));
			locationLineRed.pivotX = locationLineRed.width * 0.5;
			locationLineRed.pivotY = (locationLineRed.height * 0.5);
			locationLineRed.x = 600;
			locationLineRed.y = 400;
			locationLineRed.alpha = 0;
			locationLineRed.scale = .95;
			this.addChild(locationLineRed);
			
			//sphere
			locationSphereRed = new Image(Assets.winterTextureAtlas.getTexture("locationSphereRed"));
			locationSphereRed.pivotX = locationSphereRed.width * 0.5;
			locationSphereRed.pivotY = (locationSphereRed.height * 0.5);
			locationSphereRed.x = 600;
			locationSphereRed.y = 400;
			locationSphereRed.alpha = 0;
			locationSphereRed.scale = .95;
			this.addChild(locationSphereRed);
			
			locationText = new MovieClip(Assets.winterTextureAtlas.getTextures("L00"));
			locationText.setFrameDuration(0,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L01"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L02"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L03"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L04"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L05"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L06"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L07"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L08"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L09"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L10"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L11"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L12"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L13"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L14"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L15"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L16"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L17"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L18"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L19"),null,0.1);
			locationText.addFrame(Assets.winterTextureAtlas.getTexture("L20"),null,0.1);
			locationText.alpha = 0;
			locationText.loop = false;
			locationText.pivotX = locationText.width * 0.5;
			locationText.pivotY = (locationText.height * 0.5);
			locationText.x = 586;
			locationText.y = 405;
			locationText.scale = .95;
			this.addChild(locationText);
			Starling.juggler.add(locationText);
			locationText.pause();
			
			locationtohydra = new Image(Assets.winterTextureAtlas.getTexture("locationtohydra"));
			locationtohydra.pivotX = locationtohydra.width * 0.5;
			locationtohydra.pivotY = locationtohydra.height * 0.5;
			locationtohydra.x = 600;
			locationtohydra.y = 410;
			locationtohydra.alpha = 0;
			locationtohydra.scale = .95;
			this.addChild(locationtohydra);
			
			//red
			locationtohydraRed = new Image(Assets.winterTextureAtlas.getTexture("locationtohydraRed"));
			locationtohydraRed.pivotX = locationtohydraRed.width * 0.5;
			locationtohydraRed.pivotY = locationtohydraRed.height * 0.5;
			locationtohydraRed.x = 600;
			locationtohydraRed.y = 410;
			locationtohydraRed.alpha = 0;
			locationtohydraRed.scale = .95;
			this.addChild(locationtohydraRed);
					
			hy = new MovieClip(Assets.hybrid1TextureAtlas.getTextures("hybrid00"));
			hy.setFrameDuration(0,0.1);
			hy.addFrame(Assets.hybrid1TextureAtlas.getTexture("hybrid01"),null,0.1);
			hy.addFrame(Assets.hybrid1TextureAtlas.getTexture("hybrid02"),null,0.1);
			hy.addFrame(Assets.hybrid1TextureAtlas.getTexture("hybrid03"),null,0.1);
			hy.addFrame(Assets.hybrid1TextureAtlas.getTexture("hybrid04"),null,0.1);
			hy.addFrame(Assets.hybrid1TextureAtlas.getTexture("hybrid05"),null,0.1);
			hy.addFrame(Assets.hybrid1TextureAtlas.getTexture("hybrid06"),null,0.1);
			hy.addFrame(Assets.hybrid1TextureAtlas.getTexture("hybrid07"),null,0.1);
			hy.addFrame(Assets.hybrid1TextureAtlas.getTexture("hybrid08"),null,0.1);
			hy.addFrame(Assets.hybrid1TextureAtlas.getTexture("hybrid09"),null,0.1);
			hy.addFrame(Assets.hybrid2TextureAtlas.getTexture("hybrid10"),null,0.1);
			hy.addFrame(Assets.hybrid2TextureAtlas.getTexture("hybrid11"),null,0.1);
			hy.addFrame(Assets.hybrid2TextureAtlas.getTexture("hybrid12"),null,0.1);
			hy.addFrame(Assets.hybrid2TextureAtlas.getTexture("hybrid13"),null,0.1);
			hy.addFrame(Assets.hybrid2TextureAtlas.getTexture("hybrid14"),null,0.1);
			hy.addFrame(Assets.hybrid2TextureAtlas.getTexture("hybrid15"),null,0.1);
			hy.addFrame(Assets.hybrid2TextureAtlas.getTexture("hybrid16"),null,0.1);
			hy.addFrame(Assets.hybrid2TextureAtlas.getTexture("hybrid17"),null,0.1);
			hy.addFrame(Assets.hybrid2TextureAtlas.getTexture("hybrid18"),null,0.1);
			hy.addFrame(Assets.hybrid2TextureAtlas.getTexture("hybrid19"),null,0.1);
			hy.addFrame(Assets.button1textureAtlas.getTexture("hybrid20"),null,0.1);
			hy.alpha = 0;
			hy.loop = true;
			hy.pivotX = hy.width * 0.5;
			hy.pivotY = (hy.height * 0.5);
			hy.x = 157.5;
			hy.y = 600;
			hy.scale = .5;
			this.addChild(hy);
			Starling.juggler.add(hy);
			hy.pause();
			
			hydratoname = new Image(Assets.winterTextureAtlas.getTexture("hydratoname"));
			hydratoname.pivotX = hydratoname.width * 0.5;
			hydratoname.pivotY = (hydratoname.height * 0.5);
			hydratoname.x = 200;
			hydratoname.y = 330;
			hydratoname.alpha = 0;
			hydratoname.scale = .75;
			this.addChild(hydratoname);
			
			hydratonameRed = new Image(Assets.winterTextureAtlas.getTexture("hydratonameRed"));
			hydratonameRed.pivotX = hydratonameRed.width * 0.5;
			hydratonameRed.pivotY = (hydratonameRed.height * 0.5);
			hydratonameRed.x = 200;
			hydratonameRed.y = 330;
			hydratonameRed.alpha = 0;
			hydratonameRed.scale = .75;
			this.addChild(hydratonameRed);
			
			primalname = new MovieClip(Assets.winterTextureAtlas.getTextures("T00"));
			primalname.setFrameDuration(0,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T01"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T02"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T03"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T04"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T05"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T06"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T07"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T08"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T09"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T10"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T11"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T12"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T13"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T14"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T15"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T16"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T17"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T18"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T19"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T20"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T21"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T22"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T23"),null,0.1);
			primalname.addFrame(Assets.winterTextureAtlas.getTexture("T24"),null,0.1);
			primalname.addEventListener(Event.COMPLETE,playRedSequence1);
			primalname.alpha = 0;
			primalname.loop = false;
			primalname.pivotX = primalname.width * 0.5;
			primalname.pivotY = (primalname.height * 0.5);
			primalname.x = 540;
			primalname.y = 260;
			primalname.scale = .95;
			this.addChild(primalname);
			Starling.juggler.add(primalname);
			primalname.pause();
			
			attackline1 = new Image(Assets.winterTextureAtlas.getTexture("hydratoname"));
			attackline1.pivotX = attackline1.width * 0.5;
			attackline1.pivotY = (attackline1.height * 0.5);
			attackline1.x = 269;
			attackline1.y = 170;
			attackline1.rotation = 0.890118;
			attackline1.alpha = 0;
			attackline1.scale = .1;
			this.addChild(attackline1);
			
			attackline2 = new Image(Assets.winterTextureAtlas.getTexture("hydratoname"));
			attackline2.pivotX = attackline2.width * 0.5;
			attackline2.pivotY = (attackline2.height * 0.5);
			attackline2.x = 293;
			attackline2.y = 172.5;
			attackline2.rotation = 1.06465;
			attackline2.alpha = 0;
			attackline2.scale = .1;
			this.addChild(attackline2);
			
			attackline1Red = new Image(Assets.winterTextureAtlas.getTexture("hydratonameRed"));
			attackline1Red.pivotX = attackline1Red.width * 0.5;
			attackline1Red.pivotY = (attackline1Red.height * 0.5);
			attackline1Red.x = 269;
			attackline1Red.y = 170;
			attackline1Red.rotation = 0.890118;
			attackline1Red.alpha = 0;
			attackline1Red.scale = 1.15;
			this.addChild(attackline1Red);
			
			attackline2Red = new Image(Assets.winterTextureAtlas.getTexture("hydratonameRed"));
			attackline2Red.pivotX = attackline2Red.width * 0.5;
			attackline2Red.pivotY = (attackline2Red.height * 0.5);
			attackline2Red.x = 293;
			attackline2Red.y = 172.5;
			attackline2Red.rotation = 1.06465;
			attackline2Red.alpha = 0;
			attackline2Red.scale = 1.4;
			this.addChild(attackline2Red);
			
		}
		public function startMission():void
		{
			createMissionLocation();
			
			Assets.logicAura.play(0,0,new SoundTransform(.9));
			
			locationLineTween = new Tween(locationLine,1.0);
			locationLineTween.animate("alpha", 1);
			Starling.juggler.add(locationLineTween);
			
			locationTextTween = new Tween(locationText,1.25);
			locationTextTween.animate("alpha", 1);
			locationTextTween.onComplete = playLocation;
			Starling.juggler.add(locationTextTween);
		}
		public function playLocation():void
		{
			locationText.play();
			setTimeout(secondSequence,2000);
		}
		public function secondSequence():void
		{
			locationtohydraTween = new Tween(locationtohydra,1.0);
			locationtohydraTween.animate("alpha", 1);
			Starling.juggler.add(locationtohydraTween);
			
			Assets.psionic.play(0,0,new SoundTransform(.6));
			hy.play();
			
			hydraTween = new Tween(hy,1.25);
			hydraTween.animate("alpha", 1);
			hydraTween.onComplete = thirdSequence;
			Starling.juggler.add(hydraTween);
			
		}
		public function thirdSequence():void
		{
			hydratonameTween = new Tween(hydratoname,1.0);
			hydratonameTween.animate("alpha", 1);
			Starling.juggler.add(hydratonameTween);
			
			primalnameTween = new Tween(primalname,1.0);
			primalnameTween.animate("alpha", 1);
			primalnameTween.onComplete = playPrimal;
			Starling.juggler.add(primalnameTween);
			
		}
		public function playPrimal():void
		{
			primalname.play();
			setTimeout(fourthSequence,2000);
		}
		public function fourthSequence():void
		{
			attackline1T = new Tween(attackline1,.65);
			attackline1T.animate("alpha", 1);
			attackline1T.animate("scale", 1.15);
			Starling.juggler.add(attackline1T);
			
			attackline2T = new Tween(attackline2,.65);
			attackline2T.animate("alpha", 1);
			attackline2T.animate("scale", 1.4);
			Starling.juggler.add(attackline2T);
			
			startAttacks();
			
		}
		public function scaleCross():void
		{
			attack1T = new Tween(attack1,1.0);
			attack1T.animate("scale", .7);
			Starling.juggler.add(attack1T);
			
			attack2T = new Tween(attack2,1.0);
			attack2T.animate("scale", .7);
			attack2T.onComplete = scaleCrossDown;
			Starling.juggler.add(attack2T);
			
		}
		public function scaleCrossDown():void
		{
			attack1T = new Tween(attack1,1.0);
			attack1T.animate("scale", .5);
			Starling.juggler.add(attack1T);
			
			attack2T = new Tween(attack2,1.0);
			attack2T.animate("scale", .5);
			attack2T.onComplete = scaleCross;
			Starling.juggler.add(attack2T);
			
		}
		public function playRedSequence1():void
		{
			
			if(attackline1 != null)
			attackline1.alpha = 1;
			
			if(attackline1Red  != null)
			attackline1Red.alpha = 0;
			
			if(attackline2 != null)
			attackline2.alpha = 1;
			
			if(attackline2Red != null)
			attackline2Red.alpha = 0;
			
			locationLineTween = new Tween(locationLine,.75);
			locationLineTween.animate("alpha", 0);
			Starling.juggler.add(locationLineTween);
			
			locationSphereRedTween = new Tween(locationSphereRed,.75);
			locationSphereRedTween.animate("alpha", 1);
			Starling.juggler.add(locationSphereRedTween);
			
			locationLineRedTween = new Tween(locationLineRed,.75);
			locationLineRedTween.animate("alpha", 1);
			locationLineRedTween.onComplete = playRedSequence2;
			Starling.juggler.add(locationLineRedTween);
		}
		public function playRedSequence2():void
		{
			if(locationLine != null)
			locationLine.alpha = 1;
			
			if(locationLineRed != null)
			locationLineRed.alpha = 0;
			
			locationtohydraTween = new Tween(locationtohydra,.75);
			locationtohydraTween.animate("alpha", 0);
			Starling.juggler.add(locationtohydraTween);
			
			locationtohydraRedTween = new Tween(locationtohydraRed,.75);
			locationtohydraRedTween.animate("alpha", 1);
			locationtohydraRedTween.onComplete = playRedSequence3;
			Starling.juggler.add(locationtohydraRedTween);
			
		}
		public function playRedSequence3():void
		{
			if(locationtohydra != null)
			locationtohydra.alpha = 1;
			
			if(locationtohydraRed != null)
			locationtohydraRed.alpha = 0;
			
			hydratonameTween = new Tween(hydratoname,.75);
			hydratonameTween.animate("alpha", 0);
			Starling.juggler.add(hydratonameTween);
			
			hydratonameRedTween = new Tween(hydratonameRed,.75);
			hydratonameRedTween.animate("alpha", 1);
			hydratonameRedTween.onComplete = playRedSequence4;
			Starling.juggler.add(hydratonameRedTween);
			
		}
		public function playRedSequence4():void
		{
			
			if(hydratoname != null)
			hydratoname.alpha = 1;
			
			if(hydratonameRed != null)
			hydratonameRed.alpha = 0;
			
			attackline1T = new Tween(attackline1,.75);
			attackline1T.animate("alpha", 0);
			Starling.juggler.add(attackline1T);
			
			attackline1RedT = new Tween(attackline1Red,.75);
			attackline1RedT.animate("alpha", 1);
			Starling.juggler.add(attackline1RedT);
			
			attackline2T = new Tween(attackline2,.75);
			attackline2T.animate("alpha", 0);
			Starling.juggler.add(attackline2T);
			
			attackline2RedT = new Tween(attackline2Red,.75);
			attackline2RedT.animate("alpha", 1);
			attackline2RedT.onComplete = playRedSequence1;
			Starling.juggler.add(attackline2RedT);
			
		}
		public function update():void
		{
			if(attack1 != null)
				attack1.rotation += .01;
			
			if(attack2 != null)
				attack2.rotation += .01;
		}
		public function removeNodes():void
		{
			startButton.removeEventListeners();
			cancelButton.removeEventListeners();
			
			this.removeChild(startButton);
			startButton = null;
			
			this.removeChild(cancelButton);
			cancelButton = null;
			
			Starling.juggler.remove(hydratonameTween);
			Starling.juggler.remove(hydratonameRedTween);
			Starling.juggler.remove(locationtohydraTween);
			Starling.juggler.remove(locationtohydraRedTween);
			Starling.juggler.remove(locationLineTween);
			Starling.juggler.remove(locationSphereRedTween);
			Starling.juggler.remove(locationLineRedTween);
			Starling.juggler.remove(hydratonameTween);
			Starling.juggler.remove(primalname);
			Starling.juggler.remove(locationLineTween);
			Starling.juggler.remove(locationTextTween);
			Starling.juggler.remove(locationtohydraTween);
			Starling.juggler.remove(hydraTween);
			Starling.juggler.remove(attackDisplayTween);
			Starling.juggler.remove(attackDisplayAlphaTween);
			Starling.juggler.remove(onsiteTween);
			Starling.juggler.remove(onsiteAlphaTween);
			Starling.juggler.remove(bTween);
			Starling.juggler.remove(bAlphaTween);
			
			this.removeChild(biohazard);
			biohazard = null;
			
			this.removeChild(biohazardAlpha);
			biohazardAlpha = null;
	
			this.removeChild(hy);
			hy = null;
			
			this.removeChild(attackDisplay);
			attackDisplay = null;
			
			this.removeChild(attackDisplayAlpha);
			attackDisplayAlpha = null;
			
			this.removeChild(onsite);
			onsite = null;
			
			this.removeChild(onsiteAlpha);
			onsiteAlpha = null;
			
			this.removeChild(attack1);
			attack1 = null;
			
			this.removeChild(attack2);
			attack2 = null;
			
			this.removeChild(locationtohydraRed);
			locationLine = null;
			
			this.removeChild(locationtohydraRed);
			locationLineRed = null;
			
			this.removeChild(locationtohydraRed);
			locationSphereRed = null;
			
			this.removeChild(locationtohydraRed);
			locationText = null;
			
			this.removeChild(locationtohydraRed);
			locationtohydra = null;
			
			this.removeChild(locationtohydraRed);
			locationtohydraRed = null;
			
			this.removeChild(hydratoname);
			hydratoname = null;
			
			this.removeChild(hydratonameRed);
			hydratonameRed = null;
			
			this.removeChild(primalname);
			primalname = null;
			
			this.removeChild(missionPanel);
			missionPanel = null;
			
			this.removeChild(missionTopBracket);
			missionTopBracket = null;
			
			this.removeChild(missionBottomBracket);
			missionBottomBracket = null;
			
			this.removeChild(missionFooter);
			missionFooter = null;
			
			this.removeChild(missionAssign);
			missionAssign = null;
		
			this.removeChild(missionCas);
			missionCas = null;
			
			this.removeChild(missionReport);
			missionReport = null;
			
			this.removeChild(missionSupport);
			missionSupport = null;
			
			this.removeChild(missionWeapons);
			missionWeapons = null;
			
			this.removeChild(missionNotes);
			missionNotes = null;
			
			this.removeChild(bbTop);
			bbTop = null;
			
			this.removeChild(bbBot);
			bbBot = null;
			
			startup.removeMission();
			
			
		}

		
	}
}