package math
{
	import flash.geom.Matrix;
	import flash.geom.Vector3D;

	public class Utilities
	{
		public static function matrixMultiply(one:Vector3D, mat:Matrix):Vector3D
		{
			return new Vector3D( (one.x * mat.a) + (one.y * mat.c) ,(one.x * mat.b) + (one.y * mat.d), 0); 
		}
		public static function findNode(one:Vector3D, two:Vector3D):Vector3D
		{
			//find angle between value
			var radianValue:Number = Vector3D.angleBetween(one,two) / 2;
			
			//get the rotation matrix
			var mat:Matrix = new Matrix();
			mat.rotate(radianValue);
			
			//get rotation vector coordinates
			var temp:Vector3D = matrixMultiply(one, mat);
			
			return new Vector3D(temp.x,temp.y,0);
		}
		public static function rotateBy(one:Vector3D, rot:Number):Vector3D
		{
			var mat:Matrix = new Matrix();
			mat.rotate(rot);
			
			var temp:Vector3D = matrixMultiply(one, mat);
			
			return temp;
		}
	}
}