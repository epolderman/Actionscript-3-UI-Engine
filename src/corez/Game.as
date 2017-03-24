package corez
{
	import interfaces.IControl;
	import starling.display.Sprite;
	import starling.events.Event;
	import states.Startup;
	import states.EndState;
	import states.TerminalState;
	
		
	//STARLING VERSION INSTANCE
	//were in starling world(uses sprite, movieclips, etc)
	
	public class Game extends Sprite
	{
		//our states
		public static const TERMINAL_STATE:int = 0;
		public static const STARTUP_STATE:int = 1;
		public static const END_STATE:int = 2;
		
		
		//a variable to hold our current state we are in
		//all states implements IControl so we can just control one variable with our current state
		private var current_state:IControl;
		
		//this is our starling instance being added to our swf
		public function Game()
		{	
			Assets.init();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		//main game loop (as the instance starling enters, run update)(called on every frame)
		private function init(event:Event):void
		{
			this.changeState(STARTUP_STATE);
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		//change the state of the interface
		public function changeState(state:int):void
		{
			if(current_state != null)
			{
				current_state.destroy();
				current_state = null;
			}
			
			switch(state)
			{
				case STARTUP_STATE:
					current_state = new Startup(this);
					break;
				
				case END_STATE:
					current_state = new EndState(this);
					break;
				
				case TERMINAL_STATE:
					current_state = new TerminalState(this);
					break;	
			}
			
			//add to display list and cast as sprite
			this.addChild(Sprite(current_state));
		}
		
		//being called on every frame
		private function update():void
		{
			current_state.update();
		}
	}
}