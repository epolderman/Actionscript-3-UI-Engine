package objects
{
	import corez.Assets;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	
	public class RestartButton extends Button
	{
		private var glow:Image;
		private var outer1:Image;
		private var outer2:Image;
		private var emblem:Image;
		private var glowTween:Tween;
		public var start:Boolean;
		
		public function RestartButton()
		{
			super(Assets.nodeTextureAtlas.getTexture("outer11"),
				text,
				Assets.nodeTextureAtlas.getTexture("outer1"),
				overState,
				disabledState);
			
			this.start = false;
			this.pivotX = this.width * 0.5;
			this.pivotY = this.height * 0.5;
				
			//outer2
			outer2 = new Image(Assets.nodeTextureAtlas.getTexture("outer22"));
			outer2.pivotX = outer2.width * 0.5;
			outer2.pivotY = outer2.height * 0.5;
			outer2.x = (this.width * 0.5);
			outer2.y = (this.height * 0.5);
			this.addChild(outer2);
			
			//glow
			glow = new Image(Assets.nodeTextureAtlas.getTexture("glow2"));
			glow.pivotX = glow.width * 0.5;
			glow.pivotY = glow.height * 0.5;
			glow.x = (this.width * 0.5);
			glow.y = (this.height * 0.5);
			this.addChild(glow);
			
			//outer1
			outer1 = new Image(Assets.nodeTextureAtlas.getTexture("cells2"));
			outer1.pivotX = outer1.width * 0.5;
			outer1.pivotY = outer1.height * 0.5;
			outer1.x = (this.width * 0.5);
			outer1.y = (this.height * 0.5);
			this.addChild(outer1);
			
			//glow
			emblem = new Image(Assets.nodeTextureAtlas.getTexture("emblem2"));
			emblem.pivotX = emblem.width * 0.5;
			emblem.pivotY = emblem.height * 0.5;
			emblem.x = (this.width * 0.5);
			emblem.y = (this.height * 0.5);
			this.addChild(emblem);
			
			go();
		}
		public function enable():void
		{
			start = true;
		}
		public function go():void
		{
			glowTween = new Tween(glow, 2.5);
			glowTween.animate("alpha", 0);
			glowTween.onComplete = go2;
			Starling.juggler.add(glowTween);
		}
		public function go2():void
		{
			glowTween = new Tween(glow, 2.5);
			glowTween.animate("alpha", 1);
			glowTween.onComplete = go;
			Starling.juggler.add(glowTween);
		}
		public function update():void
		{
			if(start)
			outer1.rotation += .009;
			
			outer1.rotation += .003;
			outer2.rotation -= .003;
		}
	}
}