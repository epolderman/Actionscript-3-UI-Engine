package objects
{
	import corez.Assets;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class WinterButton extends Button
	{
		private var innerCellsActive:Image;
		private var innerCellsNotActive:Image;
		
		public function WinterButton()
		{
			super(Assets.button1textureAtlas.getTexture("WinterModeButtonOuter"),
				text, 
				downState,
				overState,
				Assets.button1textureAtlas.getTexture("WinterModeButtonOuter"));
			
			//Inner Active Loop (blue)
			innerCellsActive = new Image(Assets.button1textureAtlas.getTexture("WinterModeButtonInner"));
			innerCellsActive.pivotX = innerCellsActive.width * 0.5;
			innerCellsActive.pivotY = innerCellsActive.height * 0.5;
			innerCellsActive.x = (this.width * 0.5);
			innerCellsActive.y = (this.height * 0.5);
			this.addChild(innerCellsActive);
			
			//Inner NOT Active Loop (red)
			innerCellsNotActive = new Image(Assets.button1textureAtlas.getTexture("WinterModeButtonInnerNotActive"));
			innerCellsNotActive.pivotX = innerCellsNotActive.width * 0.5;
			innerCellsNotActive.pivotY = innerCellsNotActive.height * 0.5;
			innerCellsNotActive.x = (this.width * 0.5);
			innerCellsNotActive.y = (this.height * 0.5);
			innerCellsNotActive.alpha = 0;
			this.addChild(innerCellsNotActive);
			
			
		}
		
		public function update():void
		{
			
			innerCellsActive.rotation -= .01;
			innerCellsNotActive.rotation -= .01;
			
			if(this.enabled == true)
			{
				innerCellsActive.alpha = 1;
				innerCellsNotActive.alpha = 0;
			}
			else
			{
				innerCellsNotActive.alpha = 1;
				innerCellsActive.alpha = 0;
			}
			
		}
	}
}