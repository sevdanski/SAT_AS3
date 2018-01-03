/**
 * com.sevenson.geom.sat.shapes.base.IPolygon
 * 
 * 
 * @author Andrew Sevenson
 * @version 1.0
*/

package com.sevenson.geom.sat.shapes.base
{
	
	/**
	 * The IPolygon class
	 */
	public interface IPolygon extends IShape
	{
		function get rotation():Number;
		function set rotation(value:Number):void;

		function get scaleX():Number;
		function set scaleX(value:Number):void;
		
		function get scaleY():Number;
		function set scaleY(value:Number):void;
		
		function get vertices():Array ;		// returns the vertices with transformations applied
		
		function get rawVertices():Array; 	// vertices with no transformations 

	}
}