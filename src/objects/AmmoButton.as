package objects
{
	import corez.Assets;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class AmmoButton extends Button
	{
		private var InnerCircleWhite:Image;
		
		public function AmmoButton()
		{
			super(Assets.button1textureAtlas.getTexture("AmmoButtonActive"),
				text, Assets.button1textureAtlas.getTexture("AmmoButtonPressed"),
				overState,
				Assets.button1textureAtlas.getTexture("AmmoButtonDisabled"));
			this.scaleWhenDown = .9;
			
			//Inner Active WHITE
			InnerCircleWhite = new Image(Assets.button1textureAtlas.getTexture("AmmoButtonRotatorWhite"));
			InnerCircleWhite.pivotX = InnerCircleWhite.width * 0.5;
			InnerCircleWhite.pivotY = InnerCircleWhite.height * 0.5;
			InnerCircleWhite.x = (this.width * 0.5);
			InnerCircleWhite.y = (this.height * 0.5);
			InnerCircleWhite.alpha = 1;
			this.addChild(InnerCircleWhite);
			
		}
		public function update():void
		{
			InnerCircleWhite.rotation -= .01;
		}
		
		}
	
}