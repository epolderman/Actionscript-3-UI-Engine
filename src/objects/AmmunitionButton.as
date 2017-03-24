package objects
{
	import corez.Assets;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.textures.Texture;
	import flash.media.SoundTransform;
	
	public class AmmunitionButton extends Button
	{
		private var innerRotator:Image;
		private var tweenRotator:Tween;
		public var active:Boolean;
		public var rotatorInActive:Boolean;
		private var ammNode:AmmunitionNode;
		private var identity:int;
		
		
		public var type:Image;
		
		public function AmmunitionButton(aNode:AmmunitionNode, ident:int)
		{
			super(Assets.button1textureAtlas.getTexture("SelectedAmmNode"),
				text, 
				downState,
				overState,
				Assets.button1textureAtlas.getTexture("SelectedAmmNode"));
			
				//Inner Active Loop
				innerRotator = new Image(Assets.button1textureAtlas.getTexture("AmmNodeRotator"));
				innerRotator.pivotX = innerRotator.width * 0.5;
				innerRotator.pivotY = innerRotator.height * 0.5;
				innerRotator.x = (this.width * 0.5);
				innerRotator.y = (this.height * 0.5);
				innerRotator.alpha = 0;
				this.addChild(innerRotator);
				
				this.identity = ident;
				this.ammNode = aNode;
				this.pivotX = this.width * 0.5;
				this.pivotY = this.height * 0.5;
				this.active = false;
				this.rotatorInActive = false;
				
		}
		public function addAmmoIcon(texture:Texture):void
		{
			//add image
			type = new Image(texture);
			type.pivotX = type.width * 0.5;
			type.pivotY = type.height * 0.5;
			type.x = (this.width * 0.5);
			type.y = (this.height * 0.5);
			type.rotation = 0.785398;
			type.scale = .9;
			type.alpha = 0;
			this.addChild(type);
		}
		
		public function rotatorIn():void
		{
			Assets.ammoButton.play(0,0,new SoundTransform(0.5));
			
				for(var i:int = 0;i < ammNode.aContainer.length; i++)
				{
					ammNode.aContainer[i].active = false;
				}
				
			this.active = true;
			tweenRotator = new Tween(innerRotator, .5);
			tweenRotator.animate("rotation",1.5708);
			tweenRotator.animate("scale",.8);
			tweenRotator.animate("alpha",1);
			tweenRotator.onComplete = rotatorBack;
			Starling.juggler.add(tweenRotator);
			rotatorInActive = true;
			
		}
		
		public function rotatorBack():void
		{
			for(var i:int = 0;i < ammNode.aContainer.length; i++)
			{
				if(ammNode.aContainer[i].active == false && ammNode.aContainer[i].rotatorInActive == true)
				{	
					ammNode.textureContainer[i].alpha = 0;
					ammNode.aContainer[i].tweenRotator = new Tween(ammNode.aContainer[i].innerRotator, .5);
					ammNode.aContainer[i].tweenRotator.animate("rotation",-1.5708);
					ammNode.aContainer[i].tweenRotator.animate("scale",1);
					ammNode.aContainer[i].tweenRotator.animate("alpha",0);
					Starling.juggler.add(ammNode.aContainer[i].tweenRotator);
					ammNode.aContainer[i].rotatorInActive = false;
					ammNode.imageContainer[i].alpha = 0;
				}
				
				if(ammNode.aContainer[i].active == true && ammNode.aContainer[i].rotatorInActive == true)
				{
					ammNode.textureContainer[i].alpha = 1;
					ammNode.imageContainer[i].alpha = .8;
				}
			}
		
		}
		
		public function setSelection():void
		{
			tweenRotator = new Tween(innerRotator, .5);
			tweenRotator.animate("rotation",1.5708);
			tweenRotator.animate("scale",.8);
			tweenRotator.animate("alpha",1);
			Starling.juggler.add(tweenRotator);
			this.rotatorInActive = true;
			this.active = true;
		}
		
		
	}
}