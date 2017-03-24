package objects
{
	import corez.Assets;
	
	import starling.display.Button;
	import starling.display.Image;
	
	public class ArmorButton extends Button
	{
		private var InnerCircleWhite:Image;
		
		public function ArmorButton()
		{
			super(Assets.button1textureAtlas.getTexture("armorButtonActive"),
				text, 
				Assets.button1textureAtlas.getTexture("armorButtonDeActive"),
				overState,
				Assets.button1textureAtlas.getTexture("armorButtonDeActive"));
			this.scaleWhenDown = .9;
			
			//Inner Active WHITE
			InnerCircleWhite = new Image(Assets.button1textureAtlas.getTexture("armorButtonInner"));
			InnerCircleWhite.pivotX = InnerCircleWhite.width * 0.5;
			InnerCircleWhite.pivotY = InnerCircleWhite.height * 0.5;
			InnerCircleWhite.x = (this.width * 0.5);
			InnerCircleWhite.y = (this.height * 0.5);
			InnerCircleWhite.alpha = 1;
			this.addChild(InnerCircleWhite);
		}
		
		public function update():void
		{
			InnerCircleWhite.rotation += .003;
		}
	}
}