/**
 * com.sevenson.geom.sat.CollisionInfo
 * 
 * 
 * @author Andrew Sevenson
 * @version 1.0
*/

package com.sevenson.geom.sat
{
	import com.sevenson.geom.sat.shapes.base.IShape;
	import flash.geom.Point;
	
	/**
	 * The CollisionInfo class
	 */
	public class CollisionInfo
	{
		
		public var shapeA:IShape						// the first shape
		public var shapeB:IShape						// the second shape
		public var distance:Number = 0;					// how much overlap there is
		public var vector:Point = new Point();			// the direction you need to move - unit vector
		public var shapeAContained:Boolean = false;		// is object A contained in object B
		public var shapeBContained:Boolean = false;		// is object B contained in object A
		public var separation:Point = new Point();		// a vector that when subtracted to shape A will separate it from shape B
		
		
		/**
		 * Creates a new instance of the CollisionInfo class
		 */
		public function CollisionInfo ()
		{
		}
		
	}
}