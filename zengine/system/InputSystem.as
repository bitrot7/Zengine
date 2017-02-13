//InputSystem.as and MotionSystem.as are closely tied.
package zengine.system {
	[debug=true]
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	import flash.ui.Keyboard;
	import zengine.entity.ZengineObject;
	public class InputSystem implements ISystem {
		private var internal:Array = new Array();
		private var _stage:Stage;
		private var space_pressed:Boolean = false;
		private var up_pressed:Boolean = false;
		private var down_pressed:Boolean = false
		private var left_pressed:Boolean = false;
		private var right_pressed:Boolean = false;
		public function InputSystem(stage:Stage) {
			_stage = stage;
			_stage.addEventListener(KeyboardEvent.KEY_DOWN, key_press);
		}
		public function register(i:int):void {
			internal.push(i);
		}
		public function deregister(i:int):void {
		
		}
		public function update(delta:Number):void {
			for(var i:int; i < internal.length; i++) {	
				var po:ZengineObject = DrifterMain.mamaDukes[internal[i]];
				
					po.getInputComponent().leftBasedForce = left_pressed;
					po.getInputComponent().rightBasedForce = right_pressed;
					po.getInputComponent().downBasedForce = down_pressed;
					po.getInputComponent().upBasedForce = up_pressed;
				
			}
			this.reset();
				
		}
		private function reset():void {
			up_pressed = false;
			down_pressed = false;
			left_pressed = false;
			right_pressed = false;
		}
		private function key_press(e:KeyboardEvent):void {
			if (e.keyCode == Keyboard.UP){
				up_pressed = true;
			}
			else if(e.keyCode == Keyboard.DOWN) {
				down_pressed = true;
			}
			else if(e.keyCode == Keyboard.LEFT) {
				left_pressed = true;
			}
			else if (e.keyCode == Keyboard.RIGHT) {
				right_pressed = true;
			}
		}
	}
}