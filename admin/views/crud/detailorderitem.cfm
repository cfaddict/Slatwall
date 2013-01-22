<!---

    Slatwall - An Open Source eCommerce Platform
    Copyright (C) 2011 ten24, LLC

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
    
    Linking this library statically or dynamically with other modules is
    making a combined work based on this library.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.
 
    As a special exception, the copyright holders of this library give you
    permission to link this library with independent modules to produce an
    executable, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting executable under
    terms of your choice, provided that you also meet, for each linked
    independent module, the terms and conditions of the license of that
    module.  An independent module is a module which is not derived from
    or based on this library.  If you modify this library, you may extend
    this exception to your version of the library, but you are not
    obligated to do so.  If you do not wish to do so, delete this
    exception statement from your version.

Notes:

--->
<cfparam name="rc.orderItem" type="any" />
<cfparam name="rc.order" type="any" default="#rc.orderItem.getOrder()#" />
<cfparam name="rc.edit" default="false" />

<cfoutput>
	<cf_HibachiCrudDetailForm object="#rc.orderItem#" saveAction="admin:crud.saveOrderItem" edit="#rc.edit#" >
		<cf_HibachiCrudActionBar type="detail" object="#rc.orderItem#" edit="#rc.edit#" showdelete="false" backaction="admin:crud.detailOrder" backquerystring="orderID=#rc.order.getOrderID()#" />
		
		<input type="hidden" name="orderItemID" value="#rc.orderItem.getOrderItemID()#" />
		
		<cf_SlatwallDetailHeader>
			<cf_SlatwallPropertyList divclass="span4">
				<cf_SlatwallPropertyDisplay object="#rc.orderItem#" property="orderItemStatusType" edit="false" />
				<cf_SlatwallPropertyDisplay object="#rc.orderItem#" property="sku" edit="#rc.orderItem.isNew()#">
				<cf_SlatwallPropertyDisplay object="#rc.orderItem#" property="skuPrice" edit="false" />
			</cf_SlatwallPropertyList>
			<cf_SlatwallPropertyList divclass="span4">
				<cf_SlatwallPropertyDisplay object="#rc.orderItem#" property="quantity" edit="#rc.edit#" />
				<cfif rc.orderItem.getOrderItemType().getSystemCode() eq "oitSale">
					<cf_SlatwallPropertyDisplay object="#rc.orderItem#" property="quantityDelivered" edit="false" />
					<hr />
					<cf_SlatwallPropertyDisplay object="#rc.orderItem#" property="quantityUndelivered" edit="false" />
				<cfelse>
					<cf_SlatwallPropertyDisplay object="#rc.orderItem#" property="quantityReceived" edit="false" />
					<hr />
					<cf_SlatwallPropertyDisplay object="#rc.orderItem#" property="quantityUnreceived" edit="false" />
				</cfif>
			</cf_SlatwallPropertyList>	
			<cf_SlatwallPropertyList divclass="span4">
				<cf_SlatwallPropertyDisplay object="#rc.orderItem#" property="price" edit="false" />
				<cf_SlatwallPropertyDisplay object="#rc.orderItem#" property="extendedPrice" edit="#rc.edit#" />
				<cf_SlatwallPropertyDisplay object="#rc.orderItem#" property="discountAmount" edit="false" />
				<hr />
				<cf_SlatwallPropertyDisplay object="#rc.orderItem#" property="extendedPriceAfterDiscount" edit="false" />
			</cf_SlatwallPropertyList>
		</cf_SlatwallDetailHeader>
		
		<cf_SlatwallTabGroup object="#rc.orderItem#" allowComments="true" allowCustomAttributes="true">
			<cf_SlatwallTab view="admin:crud/orderitemtabs/taxes" />
			<cf_SlatwallTab view="admin:crud/orderitemtabs/promotions" />
			<cfif rc.orderItem.getOrderItemType().getSystemCode() eq "oitSale">
				<cf_SlatwallTab view="admin:crud/orderitemtabs/deliveryitems" />
			<cfelse>
				<cf_SlatwallTab view="admin:crud/orderitemtabs/stockReceiverItems" />
			</cfif>
		</cf_SlatwallTabGroup>
		
	</cf_HibachiCrudDetailForm>
</cfoutput>