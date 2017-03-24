package states
{
	import corez.Game;
	
	import interfaces.IControl;
	
	import objects.Background;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import corez.Assets;
	
	public class TouchState extends Sprite implements IControl
	{
		
		private var game:Game;
		private var skull:Image;
		
		//send in reference of our main game class so we can access it
		private var theBackground:Background;
		
		public function TouchState(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init():void
		{
			//space
			theBackground = new Background();
			this.addChild(theBackground);
			
			//skull = new Image(Assets.
		}
		
		public function update():void
		{
			
		}
		
		public function destroy():void
		{
			
		}
	}
}
