package src.db;
 
class Reports {
	
	public static var db:Array<Dynamic>;
	
	private static inline var TABLE_NAME:String = 'reports';
	private static var COLUMN_LIST:Array<String> = ['id','member_id','note','date','updatetime','star_list'];
	
	/* =======================================================================
	Public - Load
	========================================================================== */
	public static function load(where:String = ''):Void {
		
		Database.load(db = [],TABLE_NAME,COLUMN_LIST,where);
		
	}

}