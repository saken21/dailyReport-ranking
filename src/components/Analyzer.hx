package src.components;

import js.JQuery;
import src.db.Reports;
import src.db.Members;
 
class Analyzer {
	
	private static var _data:Map<String,Array<Map<String,Dynamic>>>;
	private static var _keys:Array<String> = ['individual','team','report','contribution','hour','length'];
	
	/* =======================================================================
	Public - Init
	========================================================================== */
	public static function init():Void {
		
		_data = new Map();
		
		for (p in 0..._keys.length) {
			_data.set(_keys[p],[]);
		}
		
		for (p in 0...Reports.db.length) {
			analyzeReport(Reports.db[p]);
		}
		
		for (p in 0..._keys.length) {
			
			var key:String = _keys[p];
			var array:Array<Map<String,Dynamic>> = _data.get(key);
			
			sortData(array);
			View.setHTML(array,key);
		
		}
		
	}
	
	/* =======================================================================
	Analyze Report
	========================================================================== */
	private static function analyzeReport(info:Dynamic):Void {
		
		if (info == null) return;
		
		var reportID  :Int     = info.id;
		var memberID  :Int     = info.member_id;
		var memberInfo:Dynamic = Members.db[memberID];
		var memberName:String  = memberInfo.name;
		var teamID    :Int     = Manager.TEAM_LIST.indexOf(memberInfo.team);
		var note      :String  = info.note;
		var date      :String  = info.date;
		var updatetime:String  = info.updatetime;
		var starList  :String  = info.star_list;
		var starLength:Int     = starList.split(',').length;
		var day       :Int     = Date.fromString(date).getDay();
		var hour      :Int     = Date.fromString(updatetime).getHours();
		var length    :Int     = Math.floor(note.length / 10);
		
		if (starList.length == 0) starLength = 0;
		
		addData(_data.get('individual'),memberID,starLength,['name'],[memberName]);
		addData(_data.get('team'),teamID,starLength,['team'],[Manager.TEAM_LIST_JP[teamID]]);
		addData(_data.get('report'),reportID,starLength,['name','note','date'],[memberName,note,date]);
		//addData(_data.get('day'),day,starLength,['day'],[Manager.WEEK_LIST[day]]);
		addData(_data.get('hour'),hour,starLength,['hour'],[hour]);
		addData(_data.get('length'),length,starLength,['length'],[length * 10]);
		
		if (starLength > 0) {
			addContribution(starList.split(','));
		}
		
	}
	
	/* =======================================================================
	Add Contribution
	========================================================================== */
	private static function addContribution(starList:Array<String>):Void {
		
		for (i in 0...starList.length) {
			
			var memberID  :Int     = Std.parseInt(starList[i]);
			var memberInfo:Dynamic = Members.db[memberID];
			var memberName:String  = memberInfo.name;
			
			addData(_data.get('contribution'),memberID,1,['name'],[memberName]);
			
		}
		
	}
	
	/* =======================================================================
	Add Data
	========================================================================== */
	private static function addData(array:Array<Map<String,Dynamic>>,key:Int,starLength:Int,columns:Array<String>,values:Array<Dynamic>):Void {
		
		var result:Int = (array[key] == null) ? 0 : array[key].get('star');
		result += starLength;
		
		var map:Map<String,Dynamic> = new Map();
		
		for (p in 0...columns.length) {
			map.set(columns[p],values[p]);
		}
		
		map.set('star',result);
		array[key] = map;
		
	}
	
	/* =======================================================================
	Sort Data
	========================================================================== */
	private static function sortData(array:Array<Map<String,Dynamic>>):Void {
		
		array.sort(function(a:Dynamic,b:Dynamic):Int {
			return Math.floor(b.get('star') - a.get('star'));
		});
		
	}

}