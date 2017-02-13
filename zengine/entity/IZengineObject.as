//IZengineObject.as
package zengine.entity {
	import zengine.entity.component.PhysicalComponent;
	import zengine.entity.component.GraphicComponent;
	import zengine.entity.component.InputComponent;
	public interface IZengineObject { //define basic game object functionality
		function getPhysicalComponent():PhysicalComponent;
		function getGraphicalComponent():GraphicComponent;
		function getInputComponent():InputComponent;
	}
}