//MotionSystem.as
package zengine.system {
	import zengine.entity.ZengineObject;
	import zengine.math.Vector2;
	public class MotionSystem implements ISystem {
		private var internal:Array = new Array();
		public static var wa:Number = .2;
		public function MotionSystem() {
			
		}
		public function register(i:int):void {
			internal.push(i);
		}
		public function deregister(i:int):void {
		
		}
		public function update(delta:Number):void {
			for(var i:int; i < internal.length; i++) {
				var po:ZengineObject = DrifterMain.mamaDukes[internal[i]];
				if(po.getInputComponent().leftBasedForce) {
					po.getPhysicalComponent().getVel().incX(-wa);
				}
				if(po.getInputComponent().rightBasedForce) {
					po.getPhysicalComponent().getVel().incX(wa);
				}
				if(po.getInputComponent().upBasedForce) {
					po.getPhysicalComponent().getVel().incY(-wa);
				}
				
				if(po.getInputComponent().downBasedForce) {
					po.getPhysicalComponent().getVel().incY(wa);
				}
				this.updateEuler(po);
			}
		}
		private function updateEuler(po:ZengineObject):void {
			var vx:Number = po.getPhysicalComponent().getVel().getX();
			var vy:Number = po.getPhysicalComponent().getVel().getY();
			po.getPhysicalComponent().getPos().incX(vx);
			po.getPhysicalComponent().getPos().incY(vy);
			po.getPhysicalComponent().representation.x = po.getPhysicalComponent().getPos().x; //link physical representation to abstruse position
			po.getPhysicalComponent().representation.y = po.getPhysicalComponent().getPos().y;
		}
	}
}