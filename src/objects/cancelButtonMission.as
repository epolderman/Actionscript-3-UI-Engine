package objects
{
	import corez.Assets;
	
	import starling.animation.Tween;
	import starling.display.Button;
	import starling.display.Image;
	import starling.core.Starling;
	
	
	public class cancelButtonMission extends Button
	{
		private var text1:Image;
		private var text2:Image;
		private var text1T:Tween;
		
		public function cancelButtonMission()
		{
			super(Assets.button1textureAtlas.getTexture("red"),
				text,
				Assets.button1textureAtlas.getTexture("orange"),
				overState,
				disabledState);
			
				this.scaleWhenDown = .9;
				
				//Inner Active Loop
				text1 = new Image(Assets.button1textureAtlas.getTexture("cancTextWhite"));
				text1.pivotX = text1.width * 0.5;
				text1.pivotY = text1.height * 0.5;
				text1.x = (this.width * 0.5);
				text1.y = (this.height * 0.5);
				this.addChild(text1);
				this.pivotX = this.width * 0.5;
				this.pivotY = this.height * 0.5;
				
				//Inner Active Loop
				text2 = new Image(Assets.button1textureAtlas.getTexture("cancTextRed"));
				text2.pivotX = text2.width * 0.5;
				text2.pivotY = text2.height * 0.5;
				text2.x = (this.width * 0.5);
				text2.y = (this.height * 0.5);
				text2.alpha = 0;
				this.addChild(text2);	
				
				go();
			
		}
		
		public function go():void
		{
			text1T = new Tween(text2,1.0);
			text1T.animate("alpha",1);
			text1T.onComplete = go2;
			Starling.juggler.add(text1T);
		}
		public function go2():void
		{
			text1T = new Tween(text2,1.0);
			text1T.animate("alpha",0);
			text1T.onComplete = go;
			Starling.juggler.add(text1T);
		}
		
		
	}
}