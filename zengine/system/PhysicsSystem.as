//PhysicsSystem.as
package zengine.system {
	import zengine.math.Vector2;
	import zengine.entity.ZengineObject;
	import flash.geom.Rectangle;
	public class PhysicsSystem implements ISystem {
		private var internal:Array = new Array();
		public function PhysicsSystem() {
			
		}
		public function register(i:int):void {
			internal.push(i);
		}
		public function deregister(i:int):void {
			
		}
		public function update(delta:Number):void {
			for(var i:int = 0; i < internal.length; i++) {
				var po:ZengineObject = DrifterMain.mamaDukes[internal[i]];
				this.updateGravity(po, i);
				this.updateFriction(po);
				this.checkCollision(po,i);
			}
		}
		private function updateGravity(po:ZengineObject, i:int):void {
			
		}
		private function updateFriction(po:ZengineObject):void {
		
		}
		private function checkCollision(po:ZengineObject, i:int):void {
			for(var j:int = i+1; j < internal.length; j++) {
				var poa:ZengineObject = DrifterMain.mamaDukes[internal[j]];
				var r1:Rectangle = po.getPhysicalComponent().representation;
				var r2:Rectangle = poa.getPhysicalComponent().representation;
				
				if(r1.intersects(r2)) {
					trace("collision detected");
					this.elasticCollisionLogic(po, poa);
				}
				
				
			}
		}
		private function elasticCollisionLogic(po:ZengineObject, poa:ZengineObject):void {
			var r1:Rectangle = po.getPhysicalComponent().representation;
			var r2:Rectangle = poa.getPhysicalComponent().representation;
			po.getPhysicalComponent().getPos().x -= 1.2 * po.getPhysicalComponent().getVel().x; //magic teleport.
			po.getPhysicalComponent().getPos().y -= 1.2 * po.getPhysicalComponent().getVel().y;
			var p1:Vector2 = po.getPhysicalComponent().getPos();
			var p2:Vector2 = poa.getPhysicalComponent().getPos();
			var v1:Vector2 = po.getPhysicalComponent().getVel();
			var v2:Vector2 = poa.getPhysicalComponent().getVel();
			var tmpv1:Vector2 = new Vector2();
			var tmpv2:Vector2 = new Vector2();
			var r3:Rectangle = r1.intersection(r2);
			tmpv1.setFrom(v1);
			tmpv2.setFrom(v2);
			
			var num1:Number = (2*po.getPhysicalComponent().mass)/(poa.getPhysicalComponent().mass + po.getPhysicalComponent().mass);
			var num2:Number = (po.getPhysicalComponent().mass - poa.getPhysicalComponent().mass)/(poa.getPhysicalComponent().mass + po.getPhysicalComponent().mass);
			tmpv1.mul(num2);
			tmpv2.mul(num1);
			var res1:Vector2 = tmpv1.add(tmpv2);
			
			tmpv1.setFrom(v1);
			tmpv2.setFrom(v2);
			
			tmpv1.mul(num1);
			tmpv2.mul(num2);
			
			var res2:Vector2 = tmpv1.sub(tmpv2);	
			v1.setFrom(res1);
			v2.setFrom(res2);
		}
	}
}