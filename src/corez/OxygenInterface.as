package corez
{
	import flash.display.Sprite;
	import starling.core.Starling;
	
	//STARLING RUNS ON THE GPU
	
	
	//SWF METADATA
	[SWF(height = 800,width = 1200, frameRate="60", backgroundColor = "0x000000")]
	
	//STILL USING AS3 and FLASH REGULAR
	//launch our starling instance from regular flash
	//default class that gets launch when running the game
	
	//sprite is a display list
	
	public class OxygenInterface extends Sprite
	{
		
		//NOTES -> starling allows us to enable multitouch is we wanted to allow touch events
		//can stop the instance and begin when neccessary
		
		
		public function OxygenInterface()
		{
			//our game instance(ROOT), and stage(where we are rendering our game))
			var star:Starling = new Starling(Game, stage);
			//star.showStats = true;
			star.start();
			
		}
	}
}