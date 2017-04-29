/**
* ================================================================================
*
* Daily Report Ranking ver 1.00.02
*
* Author : KENTA SAKATA
* Since  : 2015/09/02
* Update : 2016/02/24
*
* Licensed under the MIT License
* Copyright (c) Kenta Sakata
* http://saken.jp/
*
* ================================================================================
*
**/
package src;

import js.JQuery;

class Main {
	
	public static function main():Void {
		
		new JQuery('document').ready(Manager.init);
		
	}

}