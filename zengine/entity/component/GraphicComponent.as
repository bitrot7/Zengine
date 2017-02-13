//GraphicComponent.as
package zengine.entity.component {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	public class GraphicComponent {
		private var bitmap_data:BitmapData = null;
		private var image:Bitmap = null;  //a bitmap can be a jpeg.. here its more of a generic term.
		public function GraphicComponent(t:BitmapData) {
			if(t != null) 
				image = new Bitmap(t.clone());
		}
		public function getBitmap():Bitmap {
			return image;
		}
	}
}