package src.components;

import js.JQuery;
import src.db.Reports;
import src.db.Members;
 
class View {
	
	private static var _jIndividual:JQuery;
	private static var _jTeam      :JQuery;
	private static var _jReport    :JQuery;
	private static var _jDay       :JQuery;
	private static var _jTime      :JQuery;
	private static var _jLength    :JQuery;
	
	private static inline var DISPLAY_LENGTH:Int = 5;
	
	/* =======================================================================
	Public - Init
	========================================================================== */
	public static function init():Void {
		
		_jIndividual = new JQuery('#individual').find('ol');
		_jTeam       = new JQuery('#team').find('ol');
		_jReport     = new JQuery('#report').find('ol');
		_jDay        = new JQuery('#day').find('ol');
		_jTime       = new JQuery('#time').find('ol');
		_jLength     = new JQuery('#length').find('ol');
		
	}
	
	/* =======================================================================
	Set Individual
	========================================================================== */
	public static function setIndividual(data:Array<Dynamic>):Void {
		
		var html:String = '';
		
		for (p in 0...DISPLAY_LENGTH) {
			
			var info:Dynamic = data[p];
			
			if (info == null) {
				
				html += '<li class="blank">-</li>';
				continue;
				
			}
			
			html += '
			<li>
				<span class="num">' + (p + 1) + '位</span>
				<span class="name">' + info.name + '</span>
				<span class="star">' + info.star + '☆</span>
			</li>';
			
		}
		
		_jIndividual.html(html);
		
	}
	
	/* =======================================================================
	Set Team
	========================================================================== */
	public static function setTeam(data:Map<String,Int>):Void {
		
		var html :String = '';
		var array:Array<Dynamic> = [];
		
		for (p in 0...Manager.TEAM_LIST.length) {
			
			var team:String = Manager.TEAM_LIST[p];
			array.push({ team:Manager.TEAM_LIST_JP[p], star:data.get(team) });
		
		}
		
		array.sort(function(a:Dynamic,b:Dynamic):Int { return Math.floor(b.star - a.star); });
		
		for (p in 0...DISPLAY_LENGTH) {
			
			var info:Dynamic = array[p];
			
			if (info == null) {
				
				html += '<li class="blank">-</li>';
				continue;
				
			}
			
			html += '
			<li>
				<span class="num">' + (p + 1) + '位</span>
				<span class="team">' + info.team + 'チーム</span>
				<span class="star">' + info.star + '☆</span>
			</li>';
			
		}
		
		_jTeam.html(html);
		
	}
	
	/* =======================================================================
	Set Report
	========================================================================== */
	public static function setReport(data:Array<Dynamic>):Void {
		
		var html:String = '';
		
		for (p in 0...DISPLAY_LENGTH) {
			
			var info:Dynamic = data[p];
			
			if (info == null) {
				
				html += '<li class="blank">-</li>';
				continue;
				
			}
			
		}
		
		_jReport.html(html);
		
	}
	
	/* =======================================================================
	Set Day
	========================================================================== */
	public static function setDay(data:Array<Dynamic>):Void {
		
		var html:String = '';
		
		for (p in 0...DISPLAY_LENGTH) {
			
			var info:Dynamic = data[p];
			
			if (info == null) {
				
				html += '<li class="blank">-</li>';
				continue;
				
			}
			
		}
		
		_jDay.html(html);
		
	}
	
	/* =======================================================================
	Set Time
	========================================================================== */
	public static function setTime(data:Array<Dynamic>):Void {
		
		var html:String = '';
		
		for (p in 0...DISPLAY_LENGTH) {
			
			var info:Dynamic = data[p];
			
			if (info == null) {
				
				html += '<li class="blank">-</li>';
				continue;
				
			}
			
		}
		
		_jTime.html(html);
		
	}
	
	/* =======================================================================
	Set Lenth
	========================================================================== */
	public static function setLength(data:Array<Dynamic>):Void {
		
		var html:String = '';
		
		for (p in 0...DISPLAY_LENGTH) {
			
			var info:Dynamic = data[p];
			
			if (info == null) {
				
				html += '<li class="blank">-</li>';
				continue;
				
			}
			
		}
		
		_jLength.html(html);
		
	}

}