package src.components;

import js.JQuery;
import src.db.Reports;
import src.db.Members;
 
class View {
	
	private static var _data:Map<String,Array<String>>;
	private static inline var DISPLAY_LENGTH:Int = 7;
	
	/* =======================================================================
	Public - Init
	========================================================================== */
	public static function init():Void {
		
		_data = new Map();
		
		_data.set('individual',['name','star']);
		_data.set('team',['team','star']);
		_data.set('report',['date','name','star','note']);
		_data.set('day',['day','star']);
		_data.set('hour',['hour','star']);
		_data.set('length',['length','star']);
		
	}
	
		/* =======================================================================
		Public - Set HTML
		========================================================================== */
		public static function setHTML(data:Array<Map<String,Dynamic>>,key:String):Void {

			var html  :String = '';
			var length:Int    = DISPLAY_LENGTH;
			
			if (key == 'report') length -= 2;
			
			var columns:Array<String> = _data.get(key);

			for (p in 0...length) {
				html += getHTML(data[p],p + 1,columns);
			}

			new JQuery('#' + key).find('ol').html(html);

		}
		
	/* =======================================================================
	Get HTML
	========================================================================== */
	private static function getHTML(map:Map<String,Dynamic>,num:Int,columns:Array<String>):String {
		
		if (map == null || map.get('star') == 0) return '<li class="blank">-</li>';
		
		var html:String = '<li>';
		
		html += '<span class="num">' + num + '位</span>';
		
		for (p in 0...columns.length) {
			
			var column:String = columns[p];
			html += '<span class="' + column + '">' + map.get(column) + '</span>';
			
		}
		
		return html + '</li>';
		
	}

}