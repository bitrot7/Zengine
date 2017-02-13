//ZengineObject.as
package zengine.entity {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	//my stuff
	//import assets.TwoDAssets
	import zengine.math.Vector2;
	import zengine.entity.component.PhysicalComponent;
	import zengine.entity.component.InputComponent;
	import zengine.entity.component.GraphicComponent;
	
	public class ZengineObject implements IZengineObject {
		/*Generic*/
		public var guid:int;
		
		private var pc:PhysicalComponent;
		private var gc:GraphicComponent;
		private var ic:InputComponent;
		
		public function ZengineObject(t:BitmapData, pos:Vector2,mass:Number,r:Rectangle ,guid:int) {
			this.guid = guid;
			pc = new PhysicalComponent(pos,mass,r);
			gc = new GraphicComponent(t);
			ic = new InputComponent();
		}
		public function getPhysicalComponent():PhysicalComponent {
			return pc;
		}
		public function getGraphicalComponent():GraphicComponent {
			return gc;
		}
		public function getInputComponent():InputComponent {
			return ic;
		}
	}
}