package states
{
	
	import corez.Assets;
	import corez.Game;
	import flash.utils.setTimeout;
	import interfaces.IControl;
	
	import objects.RestartButton;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.media.SoundTransform;
	
	public class TerminalState extends Sprite implements IControl
	{
		private var game:Game;
		private var skull:Image;
		private var skullNode:Image;
		private var skullTween:Tween;
		private var startButton:RestartButton;
		private var startButtonTween:Tween;
		
		private var terminalPanel:Image;
		private var terminalFooter:Image;
		private var terminalTop:Image;
		private var terminalBottom:Image;
		
		private var panelTween:Tween;
		private var footerTween:Tween;
		private var bottomTween:Tween;
		private var topTween:Tween;
		
		private var one:MovieClip;
		private var two:MovieClip;
		private var three:MovieClip;
		private var four:MovieClip;
		private var five:MovieClip;
		private var six:MovieClip;
		private var seven:MovieClip;
		
		
		public function TerminalState(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init():void
		{
			skull = new Image(Assets.backNodeTexture);
			skull.alpha = 1;
			skull.pivotX = skull.width * 0.5;
			skull.pivotY = skull.height * 0.5;
			skull.x = 600;
			skull.y = 400;
			this.addChild(skull);
			
			skullNode = new Image(Assets.nodeTextureAtlas.getTexture("skullNode"));
			skullNode.alpha = 0;
			skullNode.pivotX = skullNode.width * 0.5;
			skullNode.pivotY = skullNode.height * 0.5;
			skullNode.x = 600;
			skullNode.y = 400;
			this.addChild(skullNode);
			
			skullTween = new Tween(skullNode, 6);
			skullTween.animate("alpha", 1);
			Starling.juggler.add(skullTween);
			
			buildTerminal();
		
		}
		public function buildTerminal():void
		{
			terminalPanel = new Image(Assets.button1textureAtlas.getTexture("panelterminal"));
			terminalPanel.alpha = 0;
			terminalPanel.pivotX = terminalPanel.width * 0.5;
			terminalPanel.pivotY = terminalPanel.height * 0.5;
			terminalPanel.x = 600;
			terminalPanel.y = 400;
			terminalPanel.scale = .1;
			this.addChild(terminalPanel);
			
			terminalFooter = new Image(Assets.button1textureAtlas.getTexture("terminalfooter"));
			terminalFooter.alpha = 0;
			terminalFooter.pivotX = terminalFooter.width * 0.5;
			terminalFooter.pivotY = terminalFooter.height * 0.5;
			terminalFooter.x = 1050;
			terminalFooter.y = 400;
			terminalFooter.scale = .8;
			this.addChild(terminalFooter);
			
			terminalTop = new Image(Assets.button1textureAtlas.getTexture("topBterminal"));
			terminalTop.alpha = 0;
			terminalTop.pivotX = terminalTop.width * 0.5;
			terminalTop.pivotY = terminalTop.height * 0.5;
			terminalTop.x = 1050;
			terminalTop.y = 485;
			terminalTop.scale = .8;
			this.addChild(terminalTop);
			
			terminalBottom = new Image(Assets.button1textureAtlas.getTexture("bottomBterminal"));
			terminalBottom.alpha = 0;
			terminalBottom.pivotX = terminalBottom.width * 0.5;
			terminalBottom.pivotY = terminalBottom.height * 0.5;
			terminalBottom.x = 1050;
			terminalBottom.y = 315;
			terminalBottom.scale = .8;
			this.addChild(terminalBottom);
			
			panelTween = new Tween(terminalPanel,1.0);
			panelTween.animate("alpha", .5);
			panelTween.animate("scale" , .8);
			panelTween.animate("x", 1050);
			panelTween.onComplete = buildBrackets;
			Starling.juggler.add(panelTween);
		}
		public function buildBrackets():void
		{
			Assets.bracket.play(0,0,new SoundTransform(1));
			
			terminalTop.alpha = .5;
			terminalBottom.alpha = .5;
			
			topTween = new Tween(terminalTop,1.0);
			topTween.animate("alpha", .8);
			topTween.animate("y", 400);
			topTween.onComplete = footer;
			Starling.juggler.add(topTween);
			
			bottomTween = new Tween(terminalBottom,1.0);
			bottomTween.animate("alpha", .8);
			bottomTween.animate("y", 400);
			Starling.juggler.add(bottomTween);
		}
		public function footer():void
		{
			footerTween = new Tween(terminalFooter,1.0);
			footerTween.animate("alpha", .8);
			footerTween.onComplete = buildOne;
			Starling.juggler.add(footerTween);
		}
		public function startButtonAction():void
		{
			startButton = new RestartButton();
			startButton.x = 1050;
			startButton.y = 650;
			startButton.addEventListener(Event.TRIGGERED,start);
			startButton.alpha = 0;
			this.addChild(startButton);
			
			startButtonTween = new Tween(startButton, 1);
			startButtonTween.animate("scale", .65);
			startButtonTween.animate("alpha", 1);
			startButtonTween.onComplete = startButton.enable;
			Starling.juggler.add(startButtonTween);
		}
		public function buildOne():void
		{
			one = new MovieClip(Assets.button1textureAtlas.getTextures("start29"));
			one.setFrameDuration(0,.1);
			one.setFrameSound(0,Assets.typingAura);
			for(var i:int = 28; i >= 0; i--)
			{
				if(i == 12)
				trace("12");	
				else if(i > 9)
					one.addFrame(Assets.button1textureAtlas.getTexture("start" + i),Assets.typingAura,.1);
				else
					one.addFrame(Assets.button1textureAtlas.getTexture("start0" + i),Assets.typingAura,.1);
			}
			one.alpha = 1;
			one.scale = .8;
			one.loop = false;
			one.pivotX = one.width * 0.5;
			one.pivotY = (one.height * 0.5);
			one.addEventListener(Event.COMPLETE,buildSecond); 
			one.x = 1028;
			one.y = 380;
			this.addChild(one);
			Starling.juggler.add(one);
			one.play();
		}
		public function buildSecond():void
		{
			two = new MovieClip(Assets.button1textureAtlas.getTextures("i25"));
			two.setFrameDuration(0,.1);
			two.setFrameSound(0,Assets.typingAura);
			for(var i:int = 24; i >= 0; i--)
			{	
				if(i > 9)
					two.addFrame(Assets.button1textureAtlas.getTexture("i" + i),Assets.typingAura,.1);
				else
					two.addFrame(Assets.button1textureAtlas.getTexture("i0" + i),Assets.typingAura,.1);
			}
			two.alpha = 1;
			two.scale = .8;
			two.loop = false;
			two.pivotX = two.width * 0.5;
			two.pivotY = (two.height * 0.5);
			two.addEventListener(Event.COMPLETE,buildThird); 
			two.x = 1028;
			two.y = 380;
			this.addChild(two);
			Starling.juggler.add(two);
			two.pause();
			setTimeout(playSecond, 1000);
		}
		public function playSecond():void
		{
			two.play();
		}
		public function buildThird():void
		{
			three = new MovieClip(Assets.button1textureAtlas.getTextures("e23"));
			three.setFrameDuration(0,.1);
			three.setFrameSound(0,Assets.typingAura);
			for(var i:int = 22; i >= 0; i--)
			{	
				if(i > 9)
					three.addFrame(Assets.button1textureAtlas.getTexture("e" + i),Assets.typingAura,.1);
				else
					three.addFrame(Assets.button1textureAtlas.getTexture("e0" + i),Assets.typingAura,.1);
			}
			three.alpha = 1;
			three.scale = .8;
			three.loop = false;
			three.pivotX = two.width * 0.5;
			three.pivotY = (two.height * 0.5);
			three.addEventListener(Event.COMPLETE,buildFour); 
			three.x = 1028;
			three.y = 380;
			this.addChild(three);
			Starling.juggler.add(three);
			three.play();
		}
		public function buildFour():void
		{
			four = new MovieClip(Assets.button1textureAtlas.getTextures("a23"));
			four.setFrameDuration(0,.1);
			four.setFrameSound(0,Assets.typingAura);
			for(var i:int = 22; i >= 0; i--)
			{	
				if(i > 9)
					four.addFrame(Assets.button1textureAtlas.getTexture("a" + i),Assets.typingAura,.1);
				else
					four.addFrame(Assets.button1textureAtlas.getTexture("a0" + i),Assets.typingAura,.1);
			}
			four.alpha = 1;
			four.scale = .8;
			four.loop = false;
			four.pivotX = two.width * 0.5;
			four.pivotY = (two.height * 0.5);
			four.addEventListener(Event.COMPLETE,buildFive); 
			four.x = 1028;
			four.y = 380;
			this.addChild(four);
			Starling.juggler.add(four);
			four.play();
		}
		public function buildFive():void
		{
			five = new MovieClip(Assets.button1textureAtlas.getTextures("suit21"));
			five.setFrameDuration(0,.1);
			five.setFrameSound(0,Assets.typingAura);
			for(var i:int = 20; i >= 0; i--)
			{	
				if(i == 0)
					five.addFrame(Assets.button1textureAtlas.getTexture("suit0" + i),Assets.typingAura,1);
				else if(i > 9)
					five.addFrame(Assets.button1textureAtlas.getTexture("suit" + i),Assets.typingAura,.1);
				else
					five.addFrame(Assets.button1textureAtlas.getTexture("suit0" + i),Assets.typingAura,.1);
			}
			five.alpha = 1;
			five.scale = .8;
			five.loop = false;
			five.pivotX = two.width * 0.5;
			five.pivotY = (two.height * 0.5);
			five.addEventListener(Event.COMPLETE,buildSix); 
			five.x = 1028;
			five.y = 380;
			this.addChild(five);
			Starling.juggler.add(five);
			five.pause();
			setTimeout(playFive, 1000);
		}
		public function playFive():void
		{
			five.play();
		}
		public function buildSix():void
		{
			six = new MovieClip(Assets.button1textureAtlas.getTextures("v55"));
			six.setFrameDuration(0,.1);
			six.setFrameSound(0,Assets.typingAura);
			for(var i:int = 54; i >= 0; i--)
			{	
				if(i == 7)
					trace("7");
				else if(i > 9)
					six.addFrame(Assets.button1textureAtlas.getTexture("v" + i),Assets.typingAura,.1);
				else
					six.addFrame(Assets.button1textureAtlas.getTexture("v0" + i),Assets.typingAura,.1);
			}
			six.alpha = 1;
			six.scale = .8;
			six.loop = false;
			six.pivotX = two.width * 0.5;
			six.pivotY = (two.height * 0.5);
			six.addEventListener(Event.COMPLETE,buildSeven); 
			six.x = 1028;
			six.y = 380;
			this.addChild(six);
			Starling.juggler.add(six);
			six.pause();
			setTimeout(playSix, 1000);
		}
		public function playSix():void
		{
			six.play();
		}
		public function buildSeven():void
		{
			seven = new MovieClip(Assets.button1textureAtlas.getTextures("r10"));
			seven.setFrameDuration(0,.1);
			seven.setFrameSound(0,Assets.typingAura);
			for(var i:int = 9; i >= 0; i--)
			{	
					seven.addFrame(Assets.button1textureAtlas.getTexture("r0" + i),Assets.typingAura,.1);
			}
			seven.alpha = 1;
			seven.addEventListener(Event.COMPLETE, startButtonAction);
			seven.scale = .8;
			seven.loop = false;
			seven.pivotX = two.width * 0.5;
			seven.pivotY = (two.height * 0.5); 
			seven.x = 1028;
			seven.y = 380;
			this.addChild(seven);
			Starling.juggler.add(seven);
			seven.pause();
			setTimeout(playSeven, 1000);
		}
		public function playSeven():void
		{
			seven.play();
		}
		public function start():void
		{
			skullTween = new Tween(skullNode, 1);
			skullTween.animate("alpha", 0);
			Starling.juggler.add(skullTween);
			
			panelTween = new Tween(terminalPanel,1.0);
			panelTween.animate("alpha", 0);
			panelTween.animate("scale" , .1);
			Starling.juggler.add(panelTween);
			
			topTween = new Tween(terminalTop,1.0);
			topTween.animate("alpha", 0);
			topTween.animate("scale", .1);
			Starling.juggler.add(topTween);
			
			bottomTween = new Tween(terminalBottom,1.0);
			bottomTween.animate("alpha", 0);
			bottomTween.animate("scale", .1);
			Starling.juggler.add(bottomTween);
			
			one.alpha = 0;
			two.alpha = 0;
			three.alpha = 0;
			four.alpha = 0;
			five.alpha = 0;
			six.alpha = 0;
			seven.alpha = 0;
			
			footerTween = new Tween(terminalFooter,1.0);
			footerTween.animate("alpha", 0);
			footerTween.animate("scale", .1);
			Starling.juggler.add(footerTween);
			
			startButtonTween = new Tween(startButton, 1.0);
			startButtonTween.animate("alpha", 0);
			startButtonTween.animate("scale", .1);
			startButtonTween.onComplete = change;
			Starling.juggler.add(startButtonTween);
			
		}
		public function change():void
		{
			game.changeState(Game.STARTUP_STATE);
		}
		
		public function update():void
		{
			if(startButton != null)
				startButton.update();
		}
		
		public function destroy():void
		{
			Starling.juggler.purge();
			
			seven.removeFromParent(true);
			seven = null;
			
			six.removeFromParent(true);
			six = null;
			
			five.removeFromParent(true);
			five = null;
			
			four.removeFromParent(true);
			four = null;
			
			three.removeFromParent(true);
			three = null;
			
			two.removeFromParent(true);
			two = null;
			
			one.removeFromParent(true);
			one = null;
			
			skullNode.removeFromParent(true);
			skullNode = null;
			
			startButton.removeFromParent(true);
			startButton = null;
			
			skull.removeFromParent(true);
			skull = null;
		}
	}
}