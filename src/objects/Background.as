package objects
{
	
	import corez.Assets;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	
	//SPACE BACKGROUND
	public class Background extends Sprite
	{
		private var background:Image;
		private var planet:MovieClip;
		
		public function Background()
		{
			background = new Image(Assets.backgroundTexture);
			background.pivotX = background.width * 0.5;
			background.pivotY = background.height * 0.5;
			background.x = 600;
			background.y = 400;
			addChild(background);
		}
	
	}
}