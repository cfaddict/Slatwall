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
<cfinclude template="slatwall-inc/slatwall-header.cfm" />
<div class="row">
	<div class="span12">
		<h2>#$.slatwall.productType().getProductTypeName()#</h2>
	</div>
</div>
<div class="row">
	<div class="span3">Test</div>
	<div class="span9">
		<div class="row">
			<div class="12">
				<p>#$.slatwall.productType().getProductTypeDescription()#</p>
			</div>
		</div>
		<ul class="thumbnails">
			<cfloop array="#$.slatwall.productList().getPageRecords()#" index="product">
				<li class="span3">
					<div class="thumbnail">
						<img src="#product.getProductListingURL()#" alt="#product.getCalculatedTitle()#" />
						<h4>#product.getCalculatedTitle()#</h4>
							<p>#product.getDescription()#</p>
						<cfif product.getPrice() gt product.getCalculatedSalePrice()>
							<h5><span style="text-decoration:line-through;">#product.getPrice()#</span> <span class="text-error">#product.getFormattedValue('calculatedSalePrice')#</span></h5>
						<cfelse>
							<h5>#product.getFormattedValue('calculatedSalePrice')#</h5>	
						</cfif>
						<a href="#product.getListingProductURL()#">Details / Buy</a>
					</div>
				</li>
			</cfloop>
		</ul>
	</div>
</div>
<cfinclude template="slatwall-inc/slatwall-footer.cfm" />