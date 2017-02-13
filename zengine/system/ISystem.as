package zengine.system {
	public interface ISystem {
		function register(i:int):void;
		function deregister(i:int):void;
		function update(delta:Number):void;
	}
}