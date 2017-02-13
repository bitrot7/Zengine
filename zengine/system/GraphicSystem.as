//GraphicsSystem.as
package zengine.system {
	import flash.display.Stage;
	import zengine.entity.ZengineObject;
	public class GraphicSystem implements ISystem {
		private var internal:Array = new Array();
		private var _stage:Stage;
		public function GraphicSystem(stage:Stage) {
			_stage = stage;
			_stage.color = 0x000000;
		}
		public function register(i:int):void {
			internal.push(i);
			_stage.addChild(DrifterMain.mamaDukes[i].getGraphicalComponent().getBitmap());
		}
		public function deregister(i:int):void {
		
		}
		public function update(delta:Number):void {
			for(var i:int = 0; i < internal.length; i++) {
				var po:ZengineObject = DrifterMain.mamaDukes[internal[i]];
				po.getGraphicalComponent().getBitmap().x = po.getPhysicalComponent().getPos().getX(); //there is an unavoidable link between physics and graphics.
				po.getGraphicalComponent().getBitmap().y = po.getPhysicalComponent().getPos().getY();
			}
		}
	}
}