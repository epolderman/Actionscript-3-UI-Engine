package objects
{
	import corez.Assets;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class UVCells extends Sprite
	{
		
		private var cellClip:Image;
		public var tweenCellIn:Tween;
		public var cellActive:Boolean;
		
		public function UVCells()
		{
			cellClip = new Image(Assets.cell0Texture);
			cellClip.pivotX = cellClip.width * 0.5;
			cellClip.pivotY = (cellClip.height * 0.5);
			cellClip.x = 600;
			cellClip.y = 400;
			
		}
		public function play():void
		{
			cellActive = true;
			cellClip.alpha = 1;
			this.addChild(cellClip);
			
			tweenCellIn = new Tween(cellClip,2.95);
			tweenCellIn.animate("alpha",0);
			tweenCellIn.onComplete = onComplete;
			Starling.juggler.add(tweenCellIn);
		}
		public function onComplete():void
		{
			this.removeChild(cellClip);
			cellActive = false;
		}
		public function reverse():void
		{
			cellActive = true;
			cellClip.alpha = 0;
			this.addChild(cellClip);
			
			tweenCellIn = new Tween(cellClip,5);
			tweenCellIn.animate("alpha",1);
			tweenCellIn.onComplete = onComplete;
			Starling.juggler.add(tweenCellIn);
		}
		public function end():void
		{
			cellActive = true;
			cellClip.alpha = 0;
			cellClip.scale = 1.09;
			this.addChild(cellClip);
			
			tweenCellIn = new Tween(cellClip,8);
			tweenCellIn.animate("alpha",.8);
			Starling.juggler.add(tweenCellIn);
		}
		
		
	}
}