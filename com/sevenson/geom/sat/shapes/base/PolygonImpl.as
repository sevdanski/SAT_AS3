/**
 * com.sevenson.geom.sat.shapes.base.PolygonImpl
 * 
 * 
 * @author Andrew Sevenson
 * @version 1.0
*/

package com.sevenson.geom.sat.shapes.base
{
	
	import flash.display.Graphics;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	/**
	 * The PolygonImpl class
	 */
	public class PolygonImpl implements IPolygon
	{
		
		
		private var _x:Number = 0;
		private var _y:Number = 0;
		private var _transform:Matrix = new Matrix();		
		private var _rotation:Number = 0;
		private var _scaleX:Number = 1;
		private var _scaleY:Number = 1;	
		private var _transfromDirty:Boolean = true; // tracks if the current transform is up to date			
		
		private var _rawVertices:Array = [];				// array of all of the vertices
		private var _transformedVertices:Array = [];		// array of transformed vertices
		
		
		
		/**
		 * Creates a new instance of the PolygonImpl class
		 */
		public function PolygonImpl ()
		{
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
			_rawVertices = [];
			_transformedVertices = [];
		}
				
		
		/**
		 * Renders the outline of this object to the given graphics object
		 * @param	g
		 */
		public function render(graphics:Graphics):void {
			// loop through the vertices, drawing from one to another
			var basePt:Point = new Point(_x, _y);
			var len:int = vertices.length
			if (len == 0) return;		// bail if there is only 1 vertex
			var pt:Point = basePt.add(vertices[0]);
			//graphics.drawCircle(pt.x, pt.y, 2);
			var vertex:Point;
			graphics.moveTo(pt.x, pt.y);			
			for (var i:uint = 0; i < len; i++) {
				vertex = (i == len - 1) ? vertices[0] : vertices[i+1];
				pt = basePt.add(vertex);
				graphics.lineTo(pt.x, pt.y);
			}			
		}
		
		
		/**
		 * Adds a vertex/point to this polygon
		 * @param	pt
		 */
		public function addVertex(pt:Point):void {
			addVertexAt(pt, _rawVertices.length);
		}
		
		/**
		 * Adds a vertex/point at the given position
		 * @param	pt
		 * @param	pos
		 */
		public function addVertexAt(pt:Point, pos:uint):void {
			_rawVertices.splice(pos, 0, pt);
			// flag the transform list as dirty
			_transfromDirty = true;
		}
		
		/**
		 * Removes the vertex/point at the given pos
		 * @param	pos
		 * @return
		 */
		public function removeVertexAt(pos:uint):Point {
			// flag the transform list as dirty
			_transfromDirty = true;
			//
			return _rawVertices.splice(pos, 1)[0];
		}
		
		/**
		 * Returns the vertex/point at the given pos
		 * @param	pos
		 */
		public function getVertexAt(pos:uint):Point {
			return _rawVertices[pos];
		}		
		
		
		public function markAsDirty():void {
			_transfromDirty = true;
		}
		
		// PRIVATE FUNCTIONS
		// ------------------------------------------------------------------------------------------
		
		
		/**
		 * Updates the current transformation matrix
		 */
		private function updateTransformation():void {
			_transform.identity();
			_transform.scale(_scaleX, _scaleY);
			_transform.rotate(_rotation * Math.PI / 180);
			// mark the points as dirty
			_transfromDirty = true;
		}	
		
		
		
		// EVENT HANDLERS
		// ------------------------------------------------------------------------------------------
		
		
		// GETTERS & SETTERS
		// ------------------------------------------------------------------------------------------
		
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
		 * Sets/gets the rotation of this polygon
		 */
		public function get rotation():Number { return _rotation; }
		public function set rotation(value:Number):void 
		{
			_rotation = value;
			updateTransformation();
		}
		
		/**
		 * Adjusts the scale in the x dimension
		 */
		public function get scaleX():Number { return _scaleX; }
		public function set scaleX(value:Number):void 
		{
			_scaleX = value;
			updateTransformation();
		}
		
		/**
		 * Adjusts the scale in the Y direction
		 */
		public function get scaleY():Number { return _scaleY; }
		public function set scaleY(value:Number):void 
		{
			_scaleY = value;
			updateTransformation();
		}			
		
		/**
		 * Returns the vertices without any transformations applied
		 * Note that this is the 'actual' array stored, 
		 */
		public function get rawVertices():Array { return _rawVertices; }
		
		
		/**
		 * Returns the vertices with all of the transforms applied (scale, rotaiton, etc)
		 * Note that this is a concated array - in order to protect the current vertices.
		 */
		public function get vertices():Array {
			// see if yo have to rebuild the transformed vertices?
			if (_transfromDirty==true) {
				_transformedVertices = [];
				for each(var pt:Point in _rawVertices) {
					_transformedVertices.push(_transform.transformPoint(pt));
				}
			}
			_transfromDirty = false;
			return _transformedVertices.concat();
		}		
		
	}
}