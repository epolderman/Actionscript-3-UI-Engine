package objects
{
	import corez.Assets;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class SolarButton extends Button
	{
		public function SolarButton(upState:Texture = null, text:String="", downState:Texture=null, overState:Texture=null, disabledState:Texture=null)
		{
			super(Assets.button1textureAtlas.getTexture("SolarShieldOuterButton"),
			text, Assets.button1textureAtlas.getTexture("SolarShieldOuterButtonPressed"),
			overState,
			Assets.button1textureAtlas.getTexture("SolarShieldOuterButtonDisabled"));
			this.scaleWhenDown = .9;
			
		}
	}
}