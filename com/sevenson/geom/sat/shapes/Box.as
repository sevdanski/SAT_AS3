/**
 * com.sevenson.geom.sat.shapes.Box
 * 
 * 
 * @author Andrew Sevenson
 * @version 1.0
*/

package com.sevenson.geom.sat.shapes
{
	import com.sevenson.geom.sat.shapes.base.IPolygon;
	import com.sevenson.geom.sat.shapes.base.PolygonImpl;
	import flash.display.Graphics;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * The Box class
	 */
	public class Box implements IPolygon
	{
		
		private var _width:Number = 10;
		private var _height:Number = 10;
		
		private var impl:PolygonImpl;
		private var _centreReg:Boolean = true;
		
		
		/**
		 * Creates a new instance of the Box class
		 */
		public function Box ($width:Number = 10, $height:Number = 10, $centreReg:Boolean = true )
		{
			// set up the implementation
			impl = new PolygonImpl();
			// insert each of the positions
			for (var i:int = 0; i < 4; i++) {
				impl.addVertex(new Point());
			}
			

			_width = $width;
			_height = $height
			_centreReg = $centreReg;
			updateShape();
			
		}
		
		
		// STATIC PUBLIC FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		/**
		 * Creates a box from the rectangle supplied
		 * @param	$rect
		 * @param	$centreReg
		 * @return
		 */
		public function fromRect($rect:Rectangle, $centreReg:Boolean = true ):Box {
			var b:Box = new Box($rect.width, $rect.height, $centreReg);
			b.x = ($centreReg) ? $rect.x + ($rect.width * 0.5) : $rect.x;
			b.y = ($centreReg) ? $rect.y + ($rect.height * 0.5) : $rect.y;
			return b;
		}
		
		
		/**
		 * Creates a box from the two points given
		 * @param	$topLeft
		 * @param	$bottomRight
		 * @param	$centreReg
		 * @return
		 */
		public function fromPoints($topLeft:Point, $bottomRight:Point, $centreReg:Boolean = true):Box {
			var b:Box = new Box($bottomRight.x - $topLeft.x, $bottomRight.y - $topLeft.y, $centreReg);
			b.x = ($centreReg) ? $topLeft.x + (($bottomRight.x-$topLeft.x) * 0.5) : $topLeft.x;
			b.y = ($centreReg) ? $topLeft.y + (($bottomRight.y-$topLeft.y) * 0.5) : $topLeft.y;
			return b;
		}
		
		
		
		// STATIC PRIVATE FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		
		// PUBLIC FUNCTIONS
		// ------------------------------------------------------------------------------------------
		/**
		 * A clean up routine that destroys all external references to prepare the class for garbage collection
		 */
		public function destroy () : void
		{
			impl.destroy();
			impl = null;
			
		}
		
		/**
		 * Creates a duplicate box with the same settings
		 * @return
		 */
		public function clone():Box {
			var b:Box = new Box(_width, _height, _centreReg);
			b.x = x;
			b.y = y;
			b.rotation = rotation;
			b.scaleX = scaleX;
			b.scaleY = scaleY;
			return b;
		}
		
		
		/**
		 * Draws this shape into the given graphics object
		 * @param	graphics
		 */
		public function render(graphics:Graphics):void {
			impl.render(graphics);
		}
		
		
		// PRIVATE FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		/**
		 * Recalcs the position of each of the objects
		 */
		private function updateShape():void {
			if (_centreReg) {
				impl.getVertexAt(0).x = -_width * 0.5;
				impl.getVertexAt(0).y = -_height * 0.5;
				impl.getVertexAt(1).x = _width * 0.5;
				impl.getVertexAt(1).y = -_height * 0.5;
				impl.getVertexAt(2).x = _width * 0.5;
				impl.getVertexAt(2).y = _height * 0.5;
				impl.getVertexAt(3).x = -_width * 0.5;
				impl.getVertexAt(3).y = _height * 0.5;
			} else {
				impl.getVertexAt(0).x = 0;
				impl.getVertexAt(0).y = 0;
				impl.getVertexAt(1).x = _width;
				impl.getVertexAt(1).y = 0;
				impl.getVertexAt(2).x = _width;
				impl.getVertexAt(2).y = _height;
				impl.getVertexAt(3).x = 0;
				impl.getVertexAt(3).y = _height;

			}
			impl.markAsDirty();

		}
		
		
		// EVENT HANDLERS
		// ------------------------------------------------------------------------------------------
		
		
		// GETTERS & SETTERS
		// ------------------------------------------------------------------------------------------
		
		
		
		public function get width():Number { return _width; }
		public function set width(value:Number):void 
		{
			_width = value;
			updateShape();
		}
		
		public function get height():Number { return _height; }
		public function set height(value:Number):void 
		{
			_height = value;
			updateShape();
		}
		
		public function get centreReg():Boolean { return _centreReg; }
		public function set centreReg(value:Boolean):void 
		{
			_centreReg = value;
			updateShape();
		}
		
		
		/**
		 * Returns the x position
		 */
		public function get x():Number { return impl.x; }
		public function set x(value:Number):void 
		{
			impl.x = value;
		}
		
		/**
		 * Returns the y position
		 */
		public function get y():Number { return impl.y; }
		public function set y(value:Number):void 
		{
			impl.y = value;
		}
		
		/**
		 * Sets/gets the rotation of this polygon
		 */
		public function get rotation():Number { return impl.rotation; }
		public function set rotation(value:Number):void 
		{
			impl.rotation = value;
		}
		
		/**
		 * Adjusts the scale in the x dimension
		 */
		public function get scaleX():Number { return impl.scaleX; }
		public function set scaleX(value:Number):void 
		{
			impl.scaleX = value;
		}
		
		/**
		 * Adjusts the scale in the Y direction
		 */
		public function get scaleY():Number { return impl.scaleY; }
		public function set scaleY(value:Number):void 
		{
			impl.scaleY = value;
		}			
		
		/**
		 * Returns the vertices without any transformations applied
		 * Note that this is the 'actual' array stored, 
		 */
		public function get rawVertices():Array { return impl.rawVertices; }
		
		
		/**
		 * Returns the vertices with all of the transforms applied (scale, rotaiton, etc)
		 * Note that this is a concated array - in order to protect the current vertices.
		 */
		public function get vertices():Array {
			return impl.vertices;
		}	
		
	}
}