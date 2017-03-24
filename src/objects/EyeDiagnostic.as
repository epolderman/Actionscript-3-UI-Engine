package objects
{
	import corez.Assets;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	
	public class EyeDiagnostic extends Sprite
	{
		//modules
		private var leftLoading:Image;
		private var rightLoading:Image;
		private var diagContainer:Image;
		private var textContainer:Image;
		//text
		public var EYEDIAGNOSTICS:MovieClip;
		
		
		public function EyeDiagnostic()
		{
			
			//diagnostic container
			diagContainer = new Image(Assets.suittextureplusAtlas.getTexture("eyeSyncContainer"));
			diagContainer.pivotX = diagContainer.width * 0.5;
			diagContainer.pivotY = diagContainer.height * 0.5;
			diagContainer.x = 600;
			diagContainer.y = 400;
			diagContainer.scale = .95;
			this.addChild(diagContainer);	
			
			//text container
			textContainer = new Image(Assets.suittextureplusAtlas.getTexture("textSyncContainer"));
			textContainer.pivotX = textContainer.width * 0.5;
			textContainer.pivotY = textContainer.height * 0.5;
			textContainer.x = 600;
			textContainer.y = 400;
			textContainer.scale = .95;
			this.addChild(textContainer);
			
			//left loading module
			leftLoading = new Image(Assets.button1textureAtlas.getTexture("eyeLoading"));
			leftLoading.pivotX = leftLoading.width * 0.5;
			leftLoading.pivotY = leftLoading.height * 0.5;
			leftLoading.x = 600-110;
			leftLoading.y = 400+15;
			leftLoading.scale = .95;
			this.addChild(leftLoading);
			
			//right loading
			rightLoading = new Image(Assets.button1textureAtlas.getTexture("eyeLoading"));
			rightLoading.pivotX = rightLoading.width * 0.5;
			rightLoading.pivotY = rightLoading.height * 0.5;
			rightLoading.x = 600+112;
			rightLoading.y = 400+15;
			rightLoading.scale = .95;
			this.addChild(rightLoading);
			
			//eye diagnostic movie clip
			//liquid diagnostics
			EYEDIAGNOSTICS = new MovieClip(Assets.suittextureplusAtlas.getTextures("SYNC_01"));
			EYEDIAGNOSTICS.setFrameDuration(0,5);
			EYEDIAGNOSTICS.addFrame(Assets.suittextureplusAtlas.getTexture("SYNC_00"),null,0.5);
			EYEDIAGNOSTICS.addFrame(Assets.suittextureplusAtlas.getTexture("SYNC_02"),null,1);
			EYEDIAGNOSTICS.loop = false;
			EYEDIAGNOSTICS.pivotX = EYEDIAGNOSTICS.width * 0.5;
			EYEDIAGNOSTICS.pivotY = EYEDIAGNOSTICS.height * 0.5;
			EYEDIAGNOSTICS.x = 600;
			EYEDIAGNOSTICS.y = 400;
			EYEDIAGNOSTICS.scale = .95;
			this.addChild(EYEDIAGNOSTICS);
			Starling.juggler.add(EYEDIAGNOSTICS);
			
		}
		
		public function update():void
		{
			leftLoading.rotation += .03;
			rightLoading.rotation -= .03;
		}
		public function playDIAGNOSTIC():void
		{
			EYEDIAGNOSTICS.play();
		}
		
		
	}
}