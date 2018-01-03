/**
 * com.sevenson.geom.sat.shapes.Polygon
 * 
 * 
 * @author Andrew Sevenson
 * @version 1.0
*/

package com.sevenson.geom.sat.shapes
{
	
	import com.sevenson.geom.sat.shapes.base.PolygonImpl;
	import flash.display.Graphics;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import com.sevenson.geom.sat.shapes.base.IPolygon;
	
	/**
	 * The Polygon class
	 */
	public class Polygon implements IPolygon
	{
		
		private var impl:PolygonImpl;
		
		
		/**
		 * Creates a new instance of the Polygon class
		 */
		public function Polygon ()
		{
			impl = new PolygonImpl();
		}
		
		
		
		
		// STATIC PUBLIC FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		
		/**
		 * Generates a polygon with the given number of sides at the given radius
		 * Note that the radius param is not related to the radius used to define a circle shape
		 * @param	sides
		 * @param	radius
		 * @return
		 */
		static public function basicPolygon(sides:int = 3, radius:Number = 100):Polygon {
			if (sides < 3) throw new Error('Polygon - Needs at least 3 sides');
			// create a return polygon 
			var poly:Polygon = new Polygon();
			// figure out the angles required
			var rotangle:Number = (Math.PI * 2) / sides;
			var angle:Number;
			var pt:Point;
			// loop through and generate each point
			for (var i:int = 0; i < sides; i++) {
				angle = (i * rotangle) + ((Math.PI-rotangle)*0.5);
				pt = new Point();
				pt.x = Math.cos(angle) * radius;
				pt.y = Math.sin(angle) * radius;
				poly.addVertex(pt);
			}
			// return the point
			return poly;
		}		
		
		
		/**
		 * Generates a polygon based on the points passed in
		 * @param	points...
		 * @return
		 */
		static public function customPolygon(...points):Polygon {
			//
			var poly:Polygon = new Polygon();
			// loop through the arguments
			for each (var pt:Point in points) {
				poly.addVertex(pt);
			}
			// return the polygon
			return poly;
		}		
		
		
		/**
		 * Generates a polygon based on the points passed in
		 * @param	points...
		 * @return
		 */
		static public function fromArray(points:Array):Polygon {
			//
			var poly:Polygon = new Polygon();
			// loop through the arguments
			for each (var pt:Point in points) {
				poly.addVertex(pt);
			}
			// return the polygon
			return poly;
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
			impl = null
		}
		
		/**
		 * Duplicates the current polygon
		 * @return
		 */
		public function clone():Polygon {
			var p:Polygon = new Polygon();
			// loop through all of the vertices, 
			for each(var pt:Point in rawVertices) {
				p.addVertex(pt.clone());
			}			
			// apply all of the transformations
			p.x = x;
			p.y = y;
			p.scaleX = scaleX;
			p.scaleY = scaleY;
			p.rotation = rotation;
			return p;
		}		
		
		/**
		 * Renders the outline of this object to the given graphics object
		 * @param	g
		 */
		public function render(graphics:Graphics):void {
			impl.render(graphics);
		}
		
		
		/**
		 * Adds a vertex/point to this polygon
		 * @param	pt
		 */
		public function addVertex(pt:Point):void {
			impl.addVertex(pt);
		}
		
		/**
		 * Adds a vertex/point at the given position
		 * @param	pt
		 * @param	pos
		 */
		public function addVertexAt(pt:Point, pos:uint):void {
			impl.addVertexAt(pt, pos);
		}
		
		/**
		 * Removes the vertex/point at the given pos
		 * @param	pos
		 * @return
		 */
		public function removeVertexAt(pos:uint):Point {
			return impl.removeVertexAt(pos);
		}
		
		/**
		 * Returns the vertex/point at the given pos
		 * @param	pos
		 */
		public function getVertexAt(pos:uint):Point {
			return impl.getVertexAt(pos);
		}		
		
		
		// PRIVATE FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		
		
		
		// EVENT HANDLERS
		// ------------------------------------------------------------------------------------------
		
		
		// GETTERS & SETTERS
		// ------------------------------------------------------------------------------------------
		
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