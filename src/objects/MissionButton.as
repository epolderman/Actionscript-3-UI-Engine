package objects
{
	import corez.Assets;
	
	import starling.display.Button;
	import starling.textures.Texture;
	
	public class MissionButton extends Button
	{
		
		public function MissionButton(upState:Texture = null, text:String="", downState:Texture=null, overState:Texture=null, disabledState:Texture=null)
		{
			super(Assets.button1textureAtlas.getTexture("missionOuter"),
				text, Assets.button1textureAtlas.getTexture("missionOuterTeal"),
				overState,
				Assets.button1textureAtlas.getTexture("missionOuterTeal"));
			
			this.pivotX = this.width * 0.5;
			this.pivotY = (this.height * 0.5) + 6;
				
		}
		
	}
}