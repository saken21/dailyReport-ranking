package src.components;

import js.JQuery;
import src.db.Reports;
import src.db.Members;
 
class Analyzer {
	
	private static var _individual:Array<Dynamic>;
	private static var _team      :Map<String,Int>;
	
	/* =======================================================================
	Public - Init
	========================================================================== */
	public static function init():Void {
		
		var reports:Array<Dynamic> = Reports.db;
		var members:Array<Dynamic> = Members.db;
		
		_individual = [];
		_team = new Map();
		
		for (p in 0...Manager.TEAM_LIST.length) _team.set(Manager.TEAM_LIST[p],0);
		
		for (p in 0...reports.length) {
			
			var info:Dynamic = reports[p];
			if (info == null) continue;
			
			var memberID  :Int     = info.member_id;
			var memberInfo:Dynamic = members[memberID];
			var memberName:String  = memberInfo.name;
			var team      :String  = memberInfo.team;
			var starList  :String  = info.star_list;
			var starLength:Int     = starList.split(',').length;
			
			if (starList.length == 0) starLength = 0;
			
			addIndividual(memberID,memberName,starLength);
			addTeam(team,starLength);
			
		}
		
		_individual.sort(function(a:Dynamic,b:Dynamic):Int { return Math.floor(b.star - a.star); });
		
		View.setIndividual(_individual);
		View.setTeam(_team);
		View.setReport([]);
		View.setDay([]);
		View.setTime([]);
		View.setLength([]);
		
	}
	
	/* =======================================================================
	Add Individual
	========================================================================== */
	private static function addIndividual(id:Int,memberName:String,starLength:Int):Void {
		
		var result:Int = (_individual[id] == null) ? 0 : _individual[id].star;
		result += starLength;
		
		_individual[id] = { name:memberName, star:result };
		
	}
	
	/* =======================================================================
	Add Team
	========================================================================== */
	private static function addTeam(team:String,starLength:Int):Void {
		
		if (!_team.exists(team)) return;
		
		var result:Int = _team.get(team);
		result += starLength;
		
		_team.set(team,result);
		
	}

}