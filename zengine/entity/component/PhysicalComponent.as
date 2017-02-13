//PhysicalComponent.as
package zengine.entity.component {
	import flash.geom.Rectangle;
	import zengine.math.Vector2;
	public class PhysicalComponent {
		private var pos:Vector2 = new Vector2();
		private var vel:Vector2 = new Vector2();
		private var acc:Vector2 = new Vector2();
		public var mass:Number = 0;
		public var representation:Rectangle = new Rectangle();
		public var g_field:Rectangle = new Rectangle();
		public function PhysicalComponent(pos:Vector2,mass:Number,r:Rectangle) {
			this.pos.setX(pos.getX());
			this.pos.setY(pos.getY());
			this.vel.setXmin(-4);
			this.vel.setXmax(4);
			this.vel.setYmin(-4);
			this.vel.setYmax(4);
			this.mass = mass;
			this.representation = r.clone();//image.bitmapData.rect;
			this.representation.x = pos.getX();
			this.representation.y = pos.getY();
			
		}
		
		public function getPos():Vector2 {
			return this.pos;
		}
		public function getVel():Vector2 {
			return this.vel;
		}
		public function getAcc():Vector2 {
			return this.acc;
		}
	}
}