//Vector2D
package zengine.math {
	public class Vector2 {
		public var x:Number = 0;
		public var y:Number = 0;
		private var xmin:Number = -Number.MAX_VALUE;
		private var xmax:Number = Number.MAX_VALUE;
		private var ymin:Number = -Number.MAX_VALUE;
		private var ymax:Number = Number.MAX_VALUE;
		
		public function Vector2() {
		
		}
		public function getX():Number {
			return this.x;
		}
		public function getY():Number {
			return this.y;
		}
		public function setX(x:Number):void {
			this.x = x;
			checkX();
		}
		public function setY(y:Number):void {
			this.y = y;
			checkY();
		}
		public function incX(dx:Number):void {
			x += dx
			checkX();
		}
		public function incY(dy:Number):void {
			y += dy;
			checkY();
		}
		public function setXmin(xmin:Number):void {
			this.xmin = xmin;
		}
		public function setXmax(xmax:Number):void {
			this.xmax = xmax;
		}
		public function setYmin(ymin:Number):void {
			this.ymin = ymin;
		}
		public function setYmax(ymax:Number):void {
			this.ymax = ymax;
		}
		
		private function checkX():void {
			if(this.x >= xmax)
				x = xmax;
				
			if(this.x <= xmin)
				x = xmin;
		}
		private function checkY():void {
			if(this.y >= ymax)
				y = ymax;
				
			if(this.y <= ymin)
				y = ymin;
		}
		public function add(other:Vector2):Vector2 {
			var res:Vector2 = new Vector2();
			res.x = this.x + other.x;
			res.y = this.y + other.y;
			checkX();
			checkY();
			return res;
		}
		public function sub(other:Vector2):Vector2 {
			var res:Vector2 = new Vector2();
			res.x = this.x - other.x;
			res.y = this.y - other.y;
			checkX();
			checkY();
			return res;
		}
		public function mul(cons:Number):void {
			this.x *= cons;
			this.y *= cons;
			checkX();
			checkY();
		}
		public function setFrom(vec:Vector2):void {
			this.x = vec.x;
			this.y = vec.y;
			checkX();
			checkY();
		}
		public function mag2():Number {
			return Math.pow(this.x, 2) + Math.pow(this.y, 2);
		}
		public function nor():Vector2 {
			var otw:Vector2 = new Vector2();
			otw.setFrom(this);
			var norm:Number =  Math.sqrt(Math.pow(this.x, 2) + Math.pow(this.y, 2));
			otw.x = this.x / norm;
			otw.y = this.y / norm;
			return otw;
		}
	}
}