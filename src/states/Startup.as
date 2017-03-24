package states
{
	import flash.media.SoundMixer;
	import flash.media.SoundTransform;
	import flash.utils.setTimeout;
	
	import corez.Assets;
	import corez.Game;
	
	import interfaces.IControl;
	
	import objects.AmmoButton;
	import objects.AmmunitionNode;
	import objects.ArmorButton;
	import objects.ArmorNode;
	import objects.Background;
	import objects.EyeDiagnostic;
	import objects.EyeModule;
	import objects.GunHud;
	import objects.MissionButton;
	import objects.MissionNode;
	import objects.RestartButton;
	import objects.SkullShellR;
	import objects.SolarButton;
	import objects.SpaceSuit;
	import objects.UVCells;
	import objects.WinterButton;
	import objects.WinterMask;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.extensions.PDParticleSystem;
	import starling.extensions.ParticleSystem;
	
	
	//acts as the startup to the interface/game -> main menu state or display container ->
	public class Startup extends Sprite implements IControl
	{
		//main instance
		private var game:Game;
		//background to UI
		private var theBackground:Background;
		//particle system
		private var spaceDust:PDParticleSystem;
		//mask
		private var winterMask:WinterMask;
		//cells
		private var cells:UVCells;
		
		//space suit
		private var spaceSuit:SpaceSuit;
		
		//solar shield (SolarStatus(true = enabled)(false = disabled)
		private var skullR:SkullShellR;
		private var solarStatus:Boolean;
		private var solarButton:SolarButton;
		private var tweenSOLARBUTTON:Tween;
		
		//eye modules
		private var eyeModuleLEFT:EyeModule;
		private var eyeModuleRIGHT:EyeModule;
		private var tweenEYEL:Tween;
		private var tweenEYER:Tween;
		
		//eye diagnostics
		private var eyeD:EyeDiagnostic;
		private var tweenEYED:Tween;
		private var tweenEYELfadeout:Tween;
		private var tweenEYERfadeout:Tween;
		private var tweenEYEDfadeout:Tween;
		private var eyeSYNCCOMPLETE:Boolean;
		
		//ammunitionSPHERE
		private var aSphere:AmmunitionNode;
		private var ammoButton:AmmoButton;
		private var ammoTween:Tween;
		public var ammoActive:Boolean;
		//which ammo icon is displayed? 9 -> none was set
		public var ammoIcon:int;
		
		//winter button
		private var winterButton:WinterButton;
		private var winterTween:Tween;
		public var winterActive:Boolean;
		
		//gunhud
		private var gunHUD:GunHud;
		private var dashboardTween:Tween;
		
		//mission button
		private var missionButton:MissionButton;
		private var missionButtonTween:Tween;
		private var newMissionText:Image;
		private var missionNode:MissionNode;
		public var missionActive:Boolean;
		private var missionNodeTween:Tween;
		
		//launch replicas
		private var SSTween:Tween;
		private var WMTween:Tween;
		private var replicaPS:ParticleSystem;
		private var GHTween:Tween;
		
		private var replicaSS:SpaceSuit;
		private var replicaSSTween:Tween;
		public var motionActive:Boolean;
		
		private var armorButton:ArmorButton;
		private var armorButtonTween:Tween;
		
		private var startButton:RestartButton;
		private var startButtonTween:Tween;
		
		private var raynorArmor:ArmorNode;
		public var armorActive:Boolean;
		private var armorTween:Tween;
			
		//send in reference of our main game class so we can access it
		public function Startup(game:Game)
		{
				this.armorActive = false;
				this.eyeSYNCCOMPLETE = true;
				this.solarStatus = true;
				this.missionActive = false;
				this.winterActive = false;
				this.game = game;
				this.ammoActive = false;
				this.ammoIcon = 9;
				this.motionActive = false;
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init():void
		{	
			//create and add to display list
			//space
			theBackground = new Background();
			this.addChild(theBackground);
			
			//particle system
			spaceDust = new PDParticleSystem(XML(new Assets.spacedustXML()), 
				Assets.particleTexture);
			Starling.juggler.add(spaceDust);
			spaceDust.x = theBackground.width * 0.5;
			spaceDust.y = theBackground.height * 0.5;
			spaceDust.scale = 2.3;
			this.addChild(spaceDust);
			spaceDust.alpha = 1;
			spaceDust.start();
			
			//UV CELL shield
			cells = new UVCells();
			this.addChild(cells);
			
			//space suit HUD
			spaceSuit = new SpaceSuit(this);
			spaceSuit.alpha = 0;
			this.addChild(spaceSuit);
			
			//gun hud
			gunHUD = new GunHud(this);
			this.addChild(gunHUD);
			
			//winter mask
			winterMask = new WinterMask(this, spaceSuit);
			this.addChild(winterMask);
			
			//SOLAR SHIELD ->
			//shell skull SOLAR SHIELD
			skullR = new SkullShellR();
			this.addChild(skullR);
			
			createStart();
			//END SOLAR SHIELD ->
			
			//main ammunition node
			aSphere = new AmmunitionNode(this);
			this.addChild(aSphere);
			
			
		}
		public function update():void
		{
				winterMask.update();
				skullR.update(solarStatus);
				spaceSuit.update();
				aSphere.update();
				
				if(raynorArmor != null)
					raynorArmor.update();
				
				if(armorButton != null)
					armorButton.update();
				
				if(missionNode != null)
					missionNode.update();
						
				if(missionButton != null)
					missionButton.rotation += .03;
				
				if(winterButton != null)
					winterButton.update();
				
				if(ammoButton != null)
				ammoButton.update();
				
				//eye modules
				if(eyeModuleLEFT != null)
					eyeModuleLEFT.update();
				
				if(eyeModuleRIGHT != null)
					eyeModuleRIGHT.update();
				
				if(eyeD != null)
					eyeD.update();
				
				//ALL BUTTON ACTIVITY
				if(solarButton != null)
				if((solarButton.x == 1100 || solarButton.x == 1150) 
					&& (eyeSYNCCOMPLETE == true && cells.cellActive == false))
				{
					if(solarButton != null)
					solarButton.enabled = true;
					
					if(ammoButton != null)
					ammoButton.enabled = true;
					
					if(winterButton != null)
						winterButton.enabled = true;
					
					if(missionButton != null)
						missionButton.enabled = true;
					
					if(armorButton != null)
						armorButton.enabled = true;
				}
				else
				{
					if(solarButton != null)
					solarButton.enabled = false;
					
					if(ammoButton != null)
					ammoButton.enabled = false;
					
					if(winterButton != null)
						winterButton.enabled = false;
					
					if(missionButton != null)
						missionButton.enabled = false;
					
					if(armorButton != null)
						armorButton.enabled = false;
				}
				//END ALL BUTTON ACTIVITY
				
				//solar shild enabled
				if(!skullR.enabled)
				spaceSuit.alpha = 1;
				else
				spaceSuit.alpha = 0;
				
				
				if(eyeD != null)
					if(eyeD.EYEDIAGNOSTICS != null)
						if(eyeD.EYEDIAGNOSTICS.isPlaying == true)
							eyeSYNCCOMPLETE = false;
				
				
				//mission active running
				if(missionActive)
				{
					solarButton.enabled = false;
					
					if(ammoButton != null)
						ammoButton.enabled = false;
					
					if(winterButton != null)
						winterButton.enabled = false;
					
					if(armorButton != null)
						armorButton.enabled = false;
				}
				
				
				//are we in a motion?
				if(motionActive)
				{
					solarButton.enabled = false;
					
					if(ammoButton != null)
						ammoButton.enabled = false;
					
					if(winterButton != null)
						winterButton.enabled = false;
					
					if(missionButton != null)
						missionButton.enabled = false;
					
					if(armorButton != null)
						armorButton.enabled = false;
				}
				
				if(startButton != null)
					startButton.update();
				
		}
		public function createStart():void
		{
			startButton = new RestartButton();
			startButton.addEventListener(Event.TRIGGERED, onShieldDrop);
			startButton.pivotX = startButton.width * 0.5;
			startButton.pivotY = startButton.height * 0.5;
			startButton.x = 1075;
			startButton.y = 675;
			startButton.scale = .65;
			this.addChild(startButton);
		}
		public function removeStart():void
		{
			this.removeChild(startButton);
			startButton = null;
		}
		private function onShieldDrop():void
		{
			if(startButton != null)
			{
				startButtonTween = new Tween(startButton, 1.0);
				startButtonTween.animate("alpha", 0);
				startButtonTween.animate("scale", .1);
				startButtonTween.onComplete = removeStart;
				Starling.juggler.add(startButtonTween);
			}
			
			Assets.button2.play(0,0,new SoundTransform(1));
			
			if(winterActive)
			{
				winterMask.disableWinter();
				winterActive = false;
				spaceSuit.activateBottom();
			}
					
			if(!solarStatus)
				solarStatus = true;
			else
				solarStatus = false;
			
			//play hud sound if shield is up when pressed the button
			if(skullR.enabled)
			{
				playSolarHelmet();
				setTimeout(playSolarOpen, 350);
				spaceSuit.playHUD();
				solarbuttonSCALEDOWN();
				playEYESYNC();
				setTimeout(loadingModulesSoundTrigger, 2790);
			}
			else
			{	
				setTimeout(playSolarOpen, 350);
				spaceSuit.pauseHUD();
				solarbuttonSCALEUP();
				removeEYESYNC();
				disableDashBoard();
			}	
		}
		//exhaust sound
		private function playSolarHelmet():void
		{
			Assets.solarOpen.play(0,0,new SoundTransform(.5));
		}
		//haunting sound
		private function playSolarOpen():void
		{
			Assets.solar.play(0,0,new SoundTransform(1));
		}
		private function loadingModulesSoundTrigger():void
		{
			Assets.hudStart.play();
		}
		public function fadeMissionNode():void
		{
			missionNodeTween = new Tween(missionNode,1.0);
			missionNodeTween.animate("scale", .1);
			missionNodeTween.animate("alpha", 0);
			missionNodeTween.onComplete = missionNode.removeNodes;
			Starling.juggler.add(missionNodeTween);
		}
		public function solarbuttonSCALEDOWN():void
		{
			cells.play();
			setTimeout(displayDashBoard, 3100);
		}
		public function solarbuttonSCALEUP():void
		{
			cells.reverse();
			setTimeout(playSolarHelmet, 3100);
			setTimeout(createStart, 3100);
		}
		public function displayDashBoard():void
		{
				//solar button
				solarButton = new SolarButton();
				solarButton.addEventListener(Event.TRIGGERED, onShieldDrop);
				solarButton.pivotX = solarButton.width * 0.5;
				solarButton.pivotY = solarButton.height * 0.5;
				solarButton.x = 1150;
				solarButton.y = 697;
				solarButton.alpha = 0;
				solarButton.scale = .8;
				this.addChild(solarButton);
			
				tweenSOLARBUTTON = new Tween(solarButton,1.0);
				tweenSOLARBUTTON.animate("alpha", 1);
				Starling.juggler.add(tweenSOLARBUTTON);
				
				//ammo button
				ammoButton = new AmmoButton();
				ammoButton.addEventListener(Event.TRIGGERED, aSphere.AmmNode);
				ammoButton.pivotX = ammoButton.width * 0.5;
				ammoButton.pivotY = ammoButton.height * 0.5;
				ammoButton.x = 1090;
				ammoButton.y = 693;
				ammoButton.scale = .8;
				ammoButton.alpha = 0;
				this.addChild(ammoButton);
			
				ammoTween = new Tween(ammoButton,1.0);
				ammoTween.animate("alpha",1);
				Starling.juggler.add(ammoTween);
				
				//winter mode button
				winterButton = new WinterButton();
				winterButton.pivotX = winterButton.width * 0.5;
				winterButton.pivotY = winterButton.height * 0.5;
				winterButton.addEventListener(Event.TRIGGERED, winterMask.triggerWinter);
				winterButton.x = 970;
				winterButton.y = 686;
				winterButton.scale = .8;
				winterButton.alpha = 0;
				this.addChild(winterButton);
				
				winterTween = new Tween(winterButton, 1.0);
				winterTween.animate("alpha",1);
				Starling.juggler.add(winterTween);
				
				this.fadeingunHud();

				dashboardTween = new Tween(spaceSuit.dashBoard,1.0);
				dashboardTween.animate("alpha",1);
				Starling.juggler.add(dashboardTween);
				
				//armorBUtton
				armorButton = new ArmorButton();
				armorButton.pivotX = armorButton.width * 0.5;
				armorButton.pivotY = armorButton.height * 0.5;
				armorButton.x = 1030;
				armorButton.y = 689;
				armorButton.scale = .8;
				armorButton.alpha = 0;
				armorButton.addEventListener(Event.TRIGGERED, startArmor);
				this.addChild(armorButton);
				
				armorButtonTween = new Tween(armorButton, 1.0);
				armorButtonTween.animate("alpha", 1.0);
				Starling.juggler.add(armorButtonTween);
					
		}
		public function startArmor():void
		{
			Assets.button2.play(0,0,new SoundTransform(1));
			
			if(!armorActive)
			{
				createArmorObject();
				armorActive = true;
				
				if(ammoActive)
				{
					ammoActive = false;
					aSphere.disableAmmNode();
				}
				
				if(winterActive)
				{
					winterActive = false;
					winterMask.disableWinter();
					spaceSuit.activateBottom();
				}
				
			}
			else
			{
				removeArmorObject();
				armorActive = false;
			}
		}
		public function createArmorObject():void
		{
			raynorArmor = new ArmorNode(this);
			raynorArmor.scale = .35;
			raynorArmor.x = raynorArmor.x + 520;
			raynorArmor.y = raynorArmor.y + 400;
			this.addChild(raynorArmor);
		}
		public function removeArmorObject():void
		{
			if(raynorArmor != null)
				this.removeChild(raynorArmor);
		}
		public function disableDashBoard():void
		{
			tweenSOLARBUTTON = new Tween(solarButton,0.5);
			tweenSOLARBUTTON.animate("alpha", 0);
			Starling.juggler.add(tweenSOLARBUTTON);
			
			missionButtonTween = new Tween(missionButton,0.5);
			missionButtonTween.animate("alpha",0);
			Starling.juggler.add(missionButtonTween);
			
			//ammo button tween
			ammoTween = new Tween(ammoButton,0.5);
			ammoTween.animate("alpha", 0 );
			ammoTween.onComplete = removeDashItems;
			Starling.juggler.add(ammoTween);
			
			//winter button tween
			winterTween = new Tween(winterButton, 0.5);
			winterTween.animate("alpha",0);
			Starling.juggler.add(winterTween);
			
			if(armorActive)
				removeArmorObject();
			
			this.fadeoutgunHud();
			
			dashboardTween = new Tween(spaceSuit.dashBoard,0.5);
			dashboardTween.animate("alpha",0);
			Starling.juggler.add(dashboardTween);
			
			armorButtonTween = new Tween(armorButton, 0.5);
			armorButtonTween.animate("alpha", 0);
			Starling.juggler.add(armorButtonTween);
			
			this.shutDown();
			
			this.winterActive = false;
			this.ammoActive = false;
			this.missionActive = false;
			this.armorActive = false;
		}
		public function playExtraPS():void
		{
			//particle system
			replicaPS = new PDParticleSystem(XML(new Assets.spacedustXML()), 
				Assets.particleTexture);
			Starling.juggler.add(replicaPS);
			replicaPS.x = (theBackground.width * 0.5) + 15;
			replicaPS.y = theBackground.height * 0.5 - 15;
			replicaPS.scale = 1.5;
			this.addChild(replicaPS);
			replicaPS.alpha = 1;
			replicaPS.start();
		}
		public function shakeButtons():void
		{
			//ammo button tween
			ammoTween = new Tween(ammoButton,3);
			ammoTween.animate("scale", .1);
			ammoTween.animate("alpha", 0);
			ammoTween.onComplete = removeDashItems;
			Starling.juggler.add(ammoTween);
			
			//winter button tween
			winterTween = new Tween(winterButton,3);
			winterTween.animate("alpha",0);
			winterTween.animate("scale", .1);
			Starling.juggler.add(winterTween);
			
			//SOLARBUTTON
			tweenSOLARBUTTON = new Tween(solarButton,3);
			tweenSOLARBUTTON.animate("scale", .1);
			tweenSOLARBUTTON.animate("alpha", 0);
			Starling.juggler.add(tweenSOLARBUTTON);	
			
			//armor button
			armorTween = new Tween(armorButton,3);
			armorTween.animate("scale", .1);
			armorTween.animate("alpha", 0);
			Starling.juggler.add(armorTween);	
		}
		public function shakeSuit(i:Number, z:Number):void
		{
			if(i < 15)
			{
				SSTween = new Tween(spaceSuit, z);
				SSTween.animate("x", spaceSuit.x - (i+2));
				SSTween.animate("y", spaceSuit.y - i);
				SSTween.onComplete = shakeOtherSuit;
				SSTween.onCompleteArgs = [i,z];
				Starling.juggler.add(SSTween);
				
				replicaSSTween = new Tween(replicaSS, z);
				replicaSSTween.animate("x", replicaSS.x - i);
				replicaSSTween.animate("y", replicaSS.y + i);
				Starling.juggler.add(replicaSSTween);
					
				WMTween = new Tween(winterMask, z);
				WMTween.animate("x", winterMask.x + (i+10));
				WMTween.animate("y", winterMask.y - (i+5));
				Starling.juggler.add(WMTween);
			
				GHTween = new Tween(gunHUD, z);
				GHTween.animate("x", gunHUD.x - i);
				GHTween.animate("y", gunHUD.y + i);
				Starling.juggler.add(GHTween);
				
				
			}
			else
			{
				SSTween = new Tween(spaceSuit, z);
				SSTween.animate("x", spaceSuit.x + (i+2));
				SSTween.animate("y", spaceSuit.y + i);
				SSTween.onComplete = shakeOtherSuit;
				SSTween.onCompleteArgs = [i,z];
				Starling.juggler.add(SSTween);
				
				replicaSSTween = new Tween(replicaSS, z);
				replicaSSTween.animate("x", replicaSS.x + i);
				replicaSSTween.animate("y", replicaSS.y - i);
				Starling.juggler.add(replicaSSTween);
				
				WMTween = new Tween(winterMask, z);
				WMTween.animate("x", winterMask.x - (i-10));
				WMTween.animate("y", winterMask.y + (i-5));
				Starling.juggler.add(WMTween);
				
				GHTween = new Tween(gunHUD, z);
				GHTween.animate("x", gunHUD.x + i);
				GHTween.animate("y", gunHUD.y - i);
				Starling.juggler.add(GHTween);
				
			}
		}
		public function shakeOtherSuit(i:Number,z:Number):void
		{
			if(z < .4)
			z = .4;
			
			if(i < 15)
			{
				SSTween = new Tween(spaceSuit, z);
				SSTween.animate("x", spaceSuit.x + (i-3));
				SSTween.animate("y", spaceSuit.y + i);
				SSTween.onComplete = shakeSuit;
				SSTween.onCompleteArgs = [i + 5, z - .1];
				Starling.juggler.add(SSTween);
				
				replicaSSTween = new Tween(replicaSS, z);
				replicaSSTween.animate("x", replicaSS.x + i);
				replicaSSTween.animate("y", replicaSS.y - i);
				Starling.juggler.add(replicaSSTween);
			
				WMTween = new Tween(winterMask, z);
				WMTween.animate("x", winterMask.x - (i+10));
				WMTween.animate("y", winterMask.y + (i+5));
				Starling.juggler.add(WMTween);
			
				GHTween = new Tween(gunHUD, z);
				GHTween.animate("x", gunHUD.x + (i+1));
				GHTween.animate("y", gunHUD.y - (i-1));
				Starling.juggler.add(GHTween);
			}
			else
			{
				SSTween = new Tween(spaceSuit, z);
				SSTween.animate("x", spaceSuit.x - (i+3));
				SSTween.animate("y", spaceSuit.y - i);
				SSTween.onComplete = shakeSuit;
				SSTween.onCompleteArgs = [i + 5, z - .1];
				Starling.juggler.add(SSTween);
				
				replicaSSTween = new Tween(replicaSS, z);
				replicaSSTween.animate("x", replicaSS.x - i);
				replicaSSTween.animate("y", replicaSS.y + i);
				Starling.juggler.add(replicaSSTween);
				
				WMTween = new Tween(winterMask, z);
				WMTween.animate("x", winterMask.x + (i-10));
				WMTween.animate("y", winterMask.y - (i-5));
				Starling.juggler.add(WMTween);
				
				GHTween = new Tween(gunHUD, z);
				GHTween.animate("x", gunHUD.x - (i+1));
				GHTween.animate("y", gunHUD.y + (i-1));
				Starling.juggler.add(GHTween);
			
			}
		}
		public function End():void
		{
			//space suit HUD
			replicaSS = new SpaceSuit(this);
			this.replicaSS.alpha = 0;
			this.addChild(replicaSS);
			
			replicaSSTween = new Tween(replicaSS, .1);
			replicaSSTween.animate("alpha", .5);
			replicaSSTween.animate("x", replicaSS.x + 10);
			Starling.juggler.add(replicaSSTween);
			
			setTimeout(fadeALL, 4200);
			setTimeout(cellsReverse,4700);
			setTimeout(startShake, 2950);
			setTimeout(goBlack, 10000);
		}
		public function startShake():void
		{
			shakeSuit(1,.5);
		}
		public function fadeALL():void
		{
			SSTween = new Tween(spaceSuit, 3);
			SSTween.animate("alpha", 0);
			SSTween.onComplete = spaceSuit.deactivateAll;
			Starling.juggler.add(SSTween);
			
			replicaSSTween = new Tween(replicaSS,3);
			replicaSSTween.animate("alpha", 0);
			Starling.juggler.add(replicaSSTween);
			
			WMTween = new Tween(winterMask, 3);
			WMTween.animate("alpha", 0);
			Starling.juggler.add(WMTween);
			
			GHTween = new Tween(gunHUD, 3);
			GHTween.animate("alpha", 0);
			Starling.juggler.add(GHTween);
		}
		public function cellsReverse():void
		{
			cells.end();
		}
		public function goBlack():void
		{
			this.removeEventListeners();
			Starling.juggler.purge();
			game.changeState(Game.END_STATE);
		}
		public function createMission():void
		{
			missionButton = new MissionButton();
			missionButton.x = 1250;
			missionButton.addEventListener(Event.TRIGGERED,startMission);
			missionButton.y = 100;
			missionButton.scale = .1;
			missionButton.enabled = false;
			this.addChild(missionButton);
			
			missionButtonTween = new Tween(missionButton,1.0);
			missionButtonTween.animate("x",1077.5);
			missionButtonTween.animate("scale",.8);
			missionButtonTween.onComplete = displayTextMission;
			Starling.juggler.add(missionButtonTween);
			
		}
		public function displayTextMission():void
		{
			newMissionText = new Image(Assets.button1textureAtlas.getTexture("newmissionText"));
			newMissionText.pivotX = newMissionText.width * 0.5;
			newMissionText.pivotY = newMissionText.height * 0.5;
			newMissionText.x = 1145;
			newMissionText.y = 95;
			newMissionText.rotation = -0.0610865;
			this.addChild(newMissionText);
			
			setTimeout(missionSlideBack, 2000);
		}
		public function missionSlideBack():void
		{
			this.removeChild(newMissionText);
			newMissionText = null;
			
			missionButtonTween = new Tween(missionButton,1.0);
			missionButtonTween.animate("x",1145);
			Starling.juggler.add(missionButtonTween);
			missionButton.enabled = true;
		}
		public function startMission():void
		{
			Assets.button2.play(0,0,new SoundTransform(1));
			
			if(winterActive)
			{
				winterMask.disableWinter();
				winterActive = false;
				activeSpaceBottom();
			}
			
			if(ammoActive)
			{
				aSphere.disableAmmNode();
				ammoActive = false;
			}
			
			if(armorActive)
			{
				armorActive = false;
				removeArmorObject();
			}
			
			//start mission here
			missionButtonTween = new Tween(missionButton,1.0);
			missionButtonTween.animate("x",600);
			missionButtonTween.animate("y",400);
			missionButtonTween.animate("scale",1);
			missionButtonTween.onComplete = playMission;
			Starling.juggler.add(missionButtonTween);		
		}
		public function playMission():void
		{
			missionButtonTween = new Tween(missionButton,1.0);
			missionButtonTween.animate("alpha",0);
			missionButtonTween.animate("scale", 2);
			missionButtonTween.onComplete = removeMissionButton;
			Starling.juggler.add(missionButtonTween);
			
			//mission node
			missionNode = new MissionNode(this, winterMask);
			this.addChild(missionNode);
			
			missionNode.startMissionPanelSequence();
			
			Assets.evilAura.play(0,0,new SoundTransform(.4));
		}
		public function stopEvil():void
		{
			SoundMixer.stopAll();
		}
		public function removeMissionButton():void
		{
			missionButton.removeEventListeners();
			this.removeChild(missionButton);
			missionButton = null;
		}
		public function removeMission():void
		{
			this.removeChild(missionNode);
			missionNode = null;
		}
		public function fadeoutgunHud():void
		{
			gunHUD.retract();
		}
		public function fadeingunHud():void
		{
			gunHUD.decideIcon(this.ammoIcon);
			gunHUD.play();
		}
		public function removeDashItems():void
		{
			if(solarButton != null)
			{
				this.removeChild(solarButton);
				solarButton = null;
			}
			
			//ammo button
			this.removeChild(ammoButton);
			ammoButton = null;
			
			//winter button
			this.removeChild(winterButton);
			winterButton = null;
			
			//mission button
			if(missionButton != null)
			{
				this.removeChild(missionButton);
				missionButton = null;
			}
			
			if(armorButton != null)
			{
				this.removeChild(armorButton);
				armorButton = null;
			}
		}
		public function shutDown():void
		{
			aSphere.shutdownAmmNode();
		}
		public function disableAmmoNode():void
		{
			aSphere.disableAmmNode();
		}
		public function disableWinter():void
		{
			winterMask.disableWinter();
		}
		public function activeSpaceBottom():void
		{
			spaceSuit.activateBottom();
		}
		public function playEYESYNC():void
		{
			//eye diagnostics
			eyeD = new EyeDiagnostic();
			eyeD.alpha = 0;
			this.addChild(eyeD);
			
			//eye modules creation
			eyeModuleLEFT = new EyeModule();
			eyeModuleLEFT.x = eyeModuleLEFT.x - 675;
			eyeModuleLEFT.alpha = 0;
			this.addChild(eyeModuleLEFT);
			
			eyeModuleRIGHT = new EyeModule();
			eyeModuleRIGHT.x = eyeModuleRIGHT.x + 675;
			eyeModuleRIGHT.alpha = 0;
			this.addChild(eyeModuleRIGHT);
			
			//eye module tween
			tweenEYEL = new Tween(eyeModuleLEFT, 1.25);
			tweenEYEL.delay = 3;
			tweenEYEL.animate("alpha", 1);
			tweenEYEL.animate("x", -75);
			Starling.juggler.add(tweenEYEL);
			
			tweenEYER = new Tween(eyeModuleRIGHT, 1.25);
			tweenEYER.delay = 3;
			tweenEYER.animate("alpha", 1);
			tweenEYER.animate("x", 75);
			Starling.juggler.add(tweenEYER);
			
			tweenEYED = new Tween(eyeD, 1.25);
			tweenEYED.delay = 4.1;
			tweenEYED.onComplete = eyeD.playDIAGNOSTIC;
			tweenEYED.animate("alpha", 1);
			Starling.juggler.add(tweenEYED);
			
			setTimeout(createMission,6000);
			setTimeout(HelperHud, 4500);
			
		}
		public function HelperHud():void
		{
			spaceSuit.createHelpers();
			spaceSuit.startHelpers();
		}
		public function disableEYESYNC():void
		{
			if(eyeModuleLEFT != null)
			{
			//eye module tween out
			tweenEYELfadeout = new Tween(eyeModuleLEFT, 2.75);
			tweenEYELfadeout.animate("alpha", 0);
			Starling.juggler.add(tweenEYELfadeout);
			}
			
			if(eyeModuleRIGHT != null)
			{
			tweenEYERfadeout = new Tween(eyeModuleRIGHT, 2.75);
			tweenEYERfadeout.animate("alpha", 0);
			tweenEYERfadeout.onComplete = removeEYESYNC;
			Starling.juggler.add(tweenEYERfadeout);
			}
			
			if(eyeD != null)
			{
				tweenEYEDfadeout = new Tween(eyeD,2.75);
				tweenEYEDfadeout.animate("alpha", 0);
				tweenEYEDfadeout.onComplete = eyeSYNC;
				Starling.juggler.add(tweenEYEDfadeout);
			}
		}
		public function removeEYESYNC():void
		{
			this.removeChild(eyeModuleLEFT);
			eyeModuleLEFT = null;
			this.removeChild(eyeModuleRIGHT);
			eyeModuleRIGHT = null;
			this.removeChild(eyeD);
			eyeD = null;
		}
		public function eyeSYNC():void
		{
				eyeSYNCCOMPLETE = true;
		}
		public function destroy():void
		{
			//remove from the display list of our StartUp State
			theBackground.removeFromParent(true);
			theBackground = null;
			
			if(missionNode != null)
			{
				missionNode.removeFromParent(true);
				missionNode = null;
			}
			
			if(gunHUD != null)
			{
			gunHUD.removeFromParent(true);
			gunHUD = null;
			}
			
			skullR.removeFromParent(true);
			skullR = null;
			
			if(spaceSuit != null)
			{
			spaceSuit.removeFromParent(true);
			spaceSuit = null;
			}
			
			winterMask.removeFromParent(true);
			winterMask = null;
			
			if(solarButton != null)
			{
			solarButton.removeFromParent(true);
			solarButton = null;
			}
			
			spaceDust.removeFromParent(true);
			spaceDust = null;
			
			if(ammoButton != null)
			{
				ammoButton.removeFromParent(true);
				ammoButton = null;
			}
			
			if(eyeModuleLEFT != null)
			{
				eyeModuleLEFT.removeFromParent(true);
				eyeModuleLEFT = null;
			}
			
			if(eyeModuleRIGHT != null)
			{
				eyeModuleRIGHT.removeFromParent(true);
				eyeModuleRIGHT = null;
			}
			
			if(winterButton != null)
			{
				winterButton.removeFromParent(true);
				winterButton = null;
			}
			
			if(eyeD != null)
			{
				eyeD.removeFromParent(true);
				eyeD = null;
			}
			
			if(armorButton != null)
			{
				armorButton.removeFromParent(true);
				armorButton = null;
			}
					
			//removeFromDisplayList of our Game/Interface
			this.removeFromParent(true);
		}
		
	}
}