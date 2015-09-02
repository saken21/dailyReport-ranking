package src;

import js.JQuery;
import jp.saken.utils.Dom;
import src.db.*;
import src.components.*;
 
class Manager {
	
	public static var TEAM_LIST   :Array<String> = ['Edit','Design','DTP','Web'];
	public static var TEAM_LIST_JP:Array<String> = ['編集','デザイン','DTP','Web'];
	
	/* =======================================================================
	Public - Init
	========================================================================== */
	public static function init(event:JqEvent):Void {
		
		View.init();
		loadDB();
		
	}
	
	/* =======================================================================
	Load DB
	========================================================================== */
	private static function loadDB():Void {
		
		Dom.jWindow.on('loadDB',onLoadedDB);
		
		Reports.load();
		Members.load();

	}
	
	/* =======================================================================
	On Loaded DB
	========================================================================== */
	private static function onLoadedDB(event:JqEvent):Void {
		
		Dom.jWindow.unbind('loadDB',onLoadedDB);
		Analyzer.init();
		
	}

}