package src.db;
 
class Members {
	
	public static var db:Array<Dynamic>;
	
	private static inline var TABLE_NAME:String = 'members';
	private static var COLUMN_LIST:Array<String> = ['id','name','team'];
	
	/* =======================================================================
	Public - Load
	========================================================================== */
	public static function load():Void {
		
		Database.load(db = [],TABLE_NAME,COLUMN_LIST);
		
	}

}