/**
 * com.sevenson.geom.sat.shapes.base.IShape
 * 
 * 
 * @author Andrew Sevenson
 * @version 1.0
*/

package com.sevenson.geom.sat.shapes.base
{
	import flash.display.Graphics;
	
	/**
	 * The IShape class
	 */
	public interface IShape
	{
		
		function destroy():void;
		
		function get x():Number;
		function set x(value:Number):void;
		
		function get y():Number;
		function set y(value:Number):void;
		
		function render(graphics:Graphics):void;
		

	}
}