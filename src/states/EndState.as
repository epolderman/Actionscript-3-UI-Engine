package states
{
	import flash.media.SoundMixer;
	
	import corez.Assets;
	import corez.Game;
	
	import interfaces.IControl;
	
	import objects.RestartButton;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class EndState extends Sprite implements IControl
	{
		private var game:Game;
		private var skull:Image;
		private var skullTween:Tween;
		private var skullNode:Image;
		private var restartButton:RestartButton;
		private var restartButtonTween:Tween;
		
		private var credit1:Image;
		private var credit1Tween:Tween;
		
		private var credit2:Image;
		private var credit2Tween:Tween;
		
		private var credit3:Image;
		private var credit3Tween:Tween;
		
		public function EndState(game:Game)
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
			skullTween.onComplete = restartButtonAction;
			Starling.juggler.add(skullTween);
			
			createCredits();
			
		}
		public function restartButtonAction():void
		{
			startCredits();
			
			restartButton = new RestartButton();
			restartButton.x = 1050;
			restartButton.y = 650;
			restartButton.addEventListener(Event.TRIGGERED,fade);
			restartButton.alpha = 0;
			this.addChild(restartButton);
			
			restartButtonTween = new Tween(restartButton, 1);
			restartButtonTween.animate("scale", .65);
			restartButtonTween.animate("alpha", 1);
			restartButtonTween.onComplete = restartButton.enable;
			Starling.juggler.add(restartButtonTween);
		}
		public function fade():void
		{
			credit1Tween = new Tween(credit1, 1);
			credit1Tween.animate("alpha", 0);
			Starling.juggler.add(credit1Tween);
			
			credit2Tween = new Tween(credit2, 1);
			credit2Tween.animate("alpha", 0);
			Starling.juggler.add(credit2Tween);
			
			credit3Tween = new Tween(credit3, 1);
			credit3Tween.animate("alpha", 0);
			Starling.juggler.add(credit3Tween);
			
			restartButtonTween = new Tween(restartButton, 1);
			restartButtonTween.animate("alpha", 0);
			Starling.juggler.add(restartButtonTween);
			
			skullTween = new Tween(skullNode, 1);
			skullTween.animate("alpha", 0);
			skullTween.onComplete = restart;
			Starling.juggler.add(skullTween);
			
		}
		public function restart():void
		{
			Starling.juggler.purge();
			this.removeEventListeners();
			this.stopAudio();
			game.changeState(Game.STARTUP_STATE);
		}
		public function createCredits():void
		{
			credit1 = new Image(Assets.nodeTextureAtlas.getTexture("music"));
			credit1.alpha = 0;
			credit1.scale = .7;
			credit1.pivotX = credit1.width * 0.5;
			credit1.pivotY = credit1.height * 0.5;
			credit1.x = 200;
			credit1.y = 150;
			this.addChild(credit1);
			
			credit2 = new Image(Assets.nodeTextureAtlas.getTexture("soundeffects"));
			credit2.alpha = 0;
			credit2.scale = .7;
			credit2.pivotX = credit2.width * 0.5;
			credit2.pivotY = credit2.height * 0.5;
			credit2.x = 200;
			credit2.y = 350;
			this.addChild(credit2);
			
			credit3 = new Image(Assets.nodeTextureAtlas.getTexture("art"));
			credit3.alpha = 0;
			credit3.scale = .7;
			credit3.pivotX = credit3.width * 0.5;
			credit3.pivotY = credit3.height * 0.5;
			credit3.x = 200;
			credit3.y = 550;
			this.addChild(credit3);
		}
		public function startCredits():void
		{
			credit1Tween = new Tween(credit1, 1);
			credit1Tween.animate("alpha", 1);
			credit1Tween.onComplete = startCredits2;
			Starling.juggler.add(credit1Tween);
		}
		public function startCredits2():void
		{
			credit2Tween = new Tween(credit2, 1);
			credit2Tween.animate("alpha", 1);
			credit2Tween.onComplete = startCredits3;
			Starling.juggler.add(credit2Tween);
		}
		public function startCredits3():void
		{
			credit3Tween = new Tween(credit3, 1);
			credit3Tween.animate("alpha", 1);
			Starling.juggler.add(credit3Tween);
		}
		public function stopAudio():void
		{
			SoundMixer.stopAll();
		}
		public function update():void
		{
			if(restartButton != null)
				restartButton.update();
		}
		
		public function destroy():void
		{
			this.removeFromParent(credit1);
			credit1 = null;
			
			this.removeFromParent(credit2);
			credit2 = null;
			
			this.removeFromParent(credit3);
			credit3 = null;
			
			this.removeFromParent(restartButton);
			restartButton = null;
			
			this.removeFromParent(skull);
			skull = null;
			
			this.removeFromParent(skullNode);
			skullNode = null;
		}
	}
}