/*

    Slatwall - An Open Source eCommerce Platform
    Copyright (C) ten24, LLC
	
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
	
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
	
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    Linking this program statically or dynamically with other modules is
    making a combined work based on this program.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.
	
    As a special exception, the copyright holders of this program give you
    permission to combine this program with independent modules and your 
    custom code, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting program under terms 
    of your choice, provided that you follow these specific guidelines: 

	- You also meet the terms and conditions of the license of each 
	  independent module 
	- You must not alter the default display of the Slatwall name or logo from  
	  any part of the application 
	- Your custom code must not alter or create any files inside Slatwall, 
	  except in the following directories:
		/integrationServices/

	You may copy and distribute the modified version of this program that meets 
	the above guidelines as a combined work under the terms of GPL for this program, 
	provided that you include the source code of that other code when and as the 
	GNU GPL requires distribution of source code.
    
    If you modify this program, you may extend this exception to your version 
    of the program, but you are not obligated to do so.

Notes:

*/
component persistent="false" accessors="true" output="false" extends="Slatwall.org.Hibachi.HibachiController" {

	property name="accountService" type="any";
	property name="brandService" type="any";
	property name="dataService" type="any";
	property name="orderService" type="any";
	property name="productService" type="any";
	property name="promotionService" type="any";
	property name="vendorService" type="any";
	property name="vendorOrderService" type="any";
	property name="hibachiService" type="any";
	property name="hibachiTagService" type="any";
	
	this.publicMethods='update';
	
	this.anyAdminMethods='';
	
	this.secureMethods='';
	
	public void function update(required struct rc) {
		param name="rc.collectionIdentifier" type="string" default="";
		param name="rc.propertyIdentifiers" type="string" default="";
		
		if(len(rc.collection)) {
			
		}
		var collection = rc.$.slatwall.getEntity('Collection', rc.collectionID);
		var smartList = rc.$.slatwall.getSmartList( collection.getCollectionObject(), arguments.rc );
		var piArray = ['skuCode', 'product.productName', 'price'];
		
		rc.ajaxResponse[ "recordsCount" ] = smartList.getRecordsCount();
		rc.ajaxResponse[ "pageRecords" ] = [];
		rc.ajaxResponse[ "pageRecordsCount" ] = arrayLen( smartListPageRecords );
		rc.ajaxResponse[ "pageRecordsShow"] = smartList.getPageRecordsShow();
		rc.ajaxResponse[ "pageRecordsStart" ] = smartList.getPageRecordsStart();
		rc.ajaxResponse[ "pageRecordsEnd" ] = smartList.getPageRecordsEnd();
		rc.ajaxResponse[ "currentPage" ] = smartList.getCurrentPage();
		rc.ajaxResponse[ "totalPages" ] = smartList.getTotalPages();
		rc.ajaxResponse[ "savedStateID" ] = smartList.getSavedStateID();
		rc.ajaxResponse[ "propertyIdentifiers" ] = piArray;
		
		for(var i=1; i<=arrayLen(smartListPageRecords); i++) {
			
			var record = smartListPageRecords[i];
			
			// Create a record JSON container
			var thisRecord = {};
			
			// Add the simple values from property identifiers
			for(var p=1; p<=arrayLen(piArray); p++) {
				var value = record.getValueByPropertyIdentifier( propertyIdentifier=piArray[p] );
				if((len(value) == 3 and value eq "YES") or (len(value) == 2 and value eq "NO")) {
					thisRecord[ piArray[p] ] = value & " ";
				} else {
					thisRecord[ piArray[p] ] = value;
				}
			}
			
			arrayAppend(rc.ajaxResponse[ "pageRecords" ], thisRecord);
		}
		
	}
}