package 
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.setInterval;
	import flash.utils.setTimeout;
	
	/**
	 * ...
	 * @author jaiko
	 */
	public class Main extends Sprite 
	{
		private var r:Number = 360;
		private var cx:Number;
		private var cy:Number;
		private var g:Graphics;
		private var count:Number;
		private var circleCount:Number;
		private var dx:Number;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			g = this.graphics;
			cx = stage.stageWidth * 0.5;
			cy = stage.stageHeight * 0.5;
			count = 2000;
			dx = 0;
			drawLine();
			addEventListener(Event.ENTER_FRAME, enterFrameListener);
			countUpClosure();
			
		}
		
		private function countUpClosure():void 
		{
			dx = 2;
			var time:Number = 1000 + 2000 * Math.random();
			setTimeout(countUpClosure, time);
		}
		
		
		private function enterFrameListener(e:Event):void 
		{
			count += dx;
			dx *= 0.995;
			//circleCount += 0.6;
			/**/
			if (count > 360*2*3)
			{
				count -= 360*2*3;
			}
			
			g.clear()
			drawLine()
		}
		private function drawLine():void
		{
			
			var i:uint;
			var num:Number;
			var n:uint;


			g = this.graphics;
			g.clear()
			g.lineStyle(2, 0, 1);
			
			g.moveTo(cx - r * 0.5, cy);
			g.lineTo(cx + r * 0.5, cy);
			g.endFill();
			g.lineStyle(2, 0xFF0000, 1);
			g.moveTo(cx - r * 0.5, cy);
			for (i = 1; i < r; i++)
			{
				g.lineTo(i + cx - r * 0.5 ,cy +  - 10 * Math.sin(2 * Math.PI * (30*(i+ count) / r)) );
			}
			g.endFill();
			//
			i = 0;

			g.lineStyle(2, 0xFF0000);
			g.moveTo(cx + radius(i) * Math.cos(i), cy + radius(i) * Math.sin(i));
			n = 2 * Math.PI*360;
			for (i = 0; i < n; i++)
			{
				num =2*Math.PI * i / 360;
				
				g.lineTo(cx + radius(i) * Math.cos(num), cy + radius(i) * Math.sin(num));
			}
			
		}
		private function radius(num:Number):Number
		{
			var ans:Number = 180 + (10 * Math.sin( 2 * Math.PI * 35 * ( num + count ) / 360)) + (5 * Math.sin( 2 * Math.PI * 30 * ( num + count ) / 360)) + (15 * Math.sin( 2 * Math.PI *25*  ( num + count/2 ) / 360)) + (30 * Math.sin( 2 * Math.PI *28* ( num + count/3 ) / 360));
			return ans;
		}
		
	}
	
}