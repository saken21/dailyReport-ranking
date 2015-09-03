/**
* ================================================================================
*
* Daily Report Ranking ver 1.00.01
*
* Author : KENTA SAKATA
* Since  : 2015/09/02
* Update : 2015/09/03
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