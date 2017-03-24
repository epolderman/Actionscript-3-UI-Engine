package objects
{
	import corez.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Sprite3D;
	
	public class EyeModule extends Sprite
	{
		
		//left module
		public var spriteLeft:Sprite3D;
		private var leftEYE1:Image;
		private var leftEYE2:Image;
		private var leftEYE3:Image;
		private var leftEYE4:Image;
		private var leftEYE5:Image;
		private var leftEYE6:Image;
		private var glowMAX:Boolean;
		
		//right module
		
		
		
		public function EyeModule()
		{
			glowMAX = false;
			
			//left module
			spriteLeft = new Sprite3D();
			spriteLeft.pivotX = spriteLeft.width * 0.5;
			spriteLeft.pivotY = spriteLeft.height * 0.5;
			spriteLeft.x = 600;
			spriteLeft.y = 300;
			spriteLeft.scale = .55;
			this.addChild(spriteLeft);
			
			leftEYE1 = new Image(Assets.button1textureAtlas.getTexture("EyeScanLayer1"));
			leftEYE1.pivotX = leftEYE1.width * 0.5;
			leftEYE1.pivotY = leftEYE1.height * 0.5;
			spriteLeft.addChild(leftEYE1);
			
			leftEYE2 = new Image(Assets.button1textureAtlas.getTexture("EyeScanLayer2"));
			leftEYE2.pivotX = leftEYE2.width * 0.5;
			leftEYE2.pivotY = leftEYE2.height * 0.5;
			leftEYE2.alpha = .9;
			spriteLeft.addChild(leftEYE2);

			leftEYE3 = new Image(Assets.button1textureAtlas.getTexture("EyeScanLayer3"));
			leftEYE3.pivotX = leftEYE3.width * 0.5;
			leftEYE3.pivotY = leftEYE3.height * 0.5;
			spriteLeft.addChild(leftEYE3);
			
			leftEYE4 = new Image(Assets.button1textureAtlas.getTexture("EyeScanLayer4"));
			leftEYE4.pivotX = leftEYE4.width * 0.5;
			leftEYE4.pivotY = leftEYE4.height * 0.5;
			leftEYE4.alpha = .5;
			spriteLeft.addChild(leftEYE4);
			
			leftEYE5 = new Image(Assets.button1textureAtlas.getTexture("EyeScanLayer5"));
			leftEYE5.pivotX = leftEYE5.width * 0.5;
			leftEYE5.pivotY = leftEYE5.height * 0.5;
			spriteLeft.addChild(leftEYE5);
			
			leftEYE6 = new Image(Assets.button1textureAtlas.getTexture("EyeScanLayer6"));
			leftEYE6.pivotX = leftEYE6.width * 0.5;
			leftEYE6.pivotY = leftEYE6.height * 0.5;
			spriteLeft.addChild(leftEYE6);
			
		}
		public function update():void
		{
			if(leftEYE4.alpha == 1)
				glowMAX = true;
			
			if(leftEYE4.alpha == 0)
				glowMAX = false;
			
			leftEYE1.rotation += .01;
			leftEYE2.rotation -= .03;
			leftEYE3.rotation += .02;
			leftEYE5.rotation -= .04;
			leftEYE6.rotation += .05;
			
			if(glowMAX == false)
				upGLOW();
			
			if(glowMAX == true)
				downGLOW();
			
		}
		public function upGLOW():void
		{
			leftEYE4.alpha += .01;
		}
		public function downGLOW():void
		{
			leftEYE4.alpha -= .01;
		}
	}
}