/**
 * com.sevenson.geom.sat.shapes.Circle
 * 
 * 
 * @author Andrew Sevenson
 * @version 1.0
*/

package com.sevenson.geom.sat.shapes
{
	import flash.display.Graphics;
	import com.sevenson.geom.sat.shapes.base.IShape;
	
	/**
	 * The Circle class
	 */
	public class Circle implements IShape
	{
		
		private var _x:Number = 0;
		private var _y:Number = 0;		
		private var _scale:Number = 1;		
		private var _radius:Number = 0;
		private var _rotation:Number = 0;
				
		/**
		 * Creates a new instance of the Circle class
		 */
		public function Circle ($radius:Number = 0)
		{
			setRadius($radius);
		}
		
		
		// STATIC PUBLIC FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		
		// STATIC PRIVATE FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		
		// PUBLIC FUNCTIONS
		// ------------------------------------------------------------------------------------------
		/**
		 * A clean up routine that destroys all external references to prepare the class for garbage collection
		 */
		public function destroy () : void
		{
			
		}
		
		/**
		 * Creates a duplicate of this circle
		 * @return
		 */
		public function clone():IShape {
			var c:Circle = new Circle(_radius);
			c.x = _x;
			c.y = _y;
			c.scale = _scale;
			return c;
			
		}
		
		
		/**
		 * Renders this circle into the given graphics object
		 * @param	g
		 */
		public function render(g:Graphics):void {
			g.drawCircle(_x, _y, transformedRadius);
		}
		
		
		// PRIVATE FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		
		/**
		 * Sets the radius of this circle (if the shape was a polygon then it will now be a circle);
		 * @param	value
		 */
		private function setRadius(value:Number):void
		{
			if (value < 0) value *= -1;
			_radius = value;
		}		
		
		
		// EVENT HANDLERS
		// ------------------------------------------------------------------------------------------
		
		
		// GETTERS & SETTERS
		// ------------------------------------------------------------------------------------------
		
		/**
		 * Gets the radius of this shape (if it is a circle)
		 * If set, converts this shape into a circle
		 */
		public function get radius():Number { return _radius; }
		public function set radius(value:Number):void { setRadius(value); }
		
		/**
		 * Returns the radius with the the scale applied
		 */
		public function get transformedRadius():Number {
			return _radius * _scale
		}
		
		/**
		 * Returns the x position
		 */
		public function get x():Number { return _x; }
		public function set x(value:Number):void 
		{
			_x = value;
		}
		
		/**
		 * Returns the y position
		 */
		public function get y():Number { return _y; }
		public function set y(value:Number):void 
		{
			_y = value;
		}
		
		
		/**
		 * Returns the scale
		 */
		public function get scale():Number { return _scale; }
		public function set scale(value:Number):void 
		{
			_scale = value;
		}
		
		/**
		 * Returns the current rotation of this circle
		 * (not really valid - applied as part of the IShape interface)
		 */
		public function get rotation():Number { return _rotation; }
		public function set rotation(value:Number):void 
		{
			_rotation = value;
		}
		
		
		/**
		 * Returns the scale
		 */
		public function get scaleX():Number { return _scale; }
		public function set scaleX(value:Number):void 
		{
			_scale = value;
		}		
		public function get scaleY():Number { return _scale; }
		public function set scaleY(value:Number):void 
		{
			_scale = value;
		}	
	}
}