package objects
{
	import corez.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Sprite3D;
	
	public class SkullShellR extends Sprite
	{
		private var shellContainer:Sprite3D;
		public var skullTop:Image;
		private var skullBottom:Image;
		private var shellContainerB:Sprite3D;
		public var enabled:Boolean;
		
		public function SkullShellR()
		{
			//set suit shield 
			enabled = true;
			
			//enable images
			shellContainer = new Sprite3D();
			shellContainer.pivotX = shellContainer.width * 0.5;
			shellContainer.pivotY = shellContainer.height * 0.5;
			shellContainer.x = 600;
			shellContainer.y = 400;
			//shellContainer.z = 50;
			//shellContainer.rotationY = 3.15;
			//trace("Container is:" + shellContainer.x + " " + shellContainer.y);
			
			//skull top
			skullTop = new Image(Assets.shellTopTexture);
			skullTop.pivotX = skullTop.width * 0.5;
			skullTop.pivotY = skullTop.height * 0.5;
			skullTop.x = (shellContainer.width * 0.5);
			skullTop.y = (shellContainer.height * 0.5);
			skullTop.scale = .95;
			
			
			//bottom
			shellContainerB = new Sprite3D();
			shellContainerB.pivotX = shellContainerB.width * 0.5;
			shellContainerB.pivotY = shellContainerB.height * 0.5;
			shellContainerB.x = 600;
			shellContainerB.y = 400;
			
			//skull bottom
			skullBottom = new Image(Assets.shellBottomTexture);
			skullBottom.pivotX = skullBottom.width * 0.5;
			skullBottom.pivotY = skullBottom.height * 0.5;
			skullBottom.x = (shellContainerB.width * 0.5);
			skullBottom.y = (shellContainerB.height * 0.5);
			skullBottom.scale = .95;
		
			
			shellContainer.addChild(skullTop);
			shellContainerB.addChild(skullBottom);
			this.addChild(shellContainer);
			this.addChild(shellContainerB);
		}
		
		public function update(on:Boolean):void
		{
			if(skullTop.y >= -380 && on == false)
			disable();
			
			if(skullTop.y <= 0 && on == true)
			enable();
			
			checkSolarStatus();
		}
		
		///(SLIDES CLOSED ANIMATION)
		public function enable():void
		{
			shellContainerB.z += 0.001;
			shellContainer.z += 0.001;
			shellContainerB.rotationX += .001;
			shellContainer.rotationX -= .001;
			skullTop.y += 2;
			skullBottom.y += -2;
			skullTop.alpha += .003;
			skullBottom.alpha += .003;
		}
		
		///SLIDES OPEN ANIMATION)
		public function disable():void
		{	
			shellContainerB.z += -0.001;
			shellContainer.z += -0.001;
			shellContainerB.rotationX -= .001;
			shellContainer.rotationX += .001;
			skullTop.y += -2;
			skullBottom.y += 2;
			skullTop.alpha -= .003;
			skullBottom.alpha -= .003;
		}
		
		//check status of solar shield
		public function checkSolarStatus():void
		{
			//opening animation finish
			if(skullTop.y == -382)
			enabled = false;
			
			//slides to center closed animation
			if(skullTop.y == 0)
			enabled = true;
			
			//if(enabled)
			//trace("Solar Status: ENABLED");
			//else
			//trace("Solar Status: DISABLED");
		}
	}
}