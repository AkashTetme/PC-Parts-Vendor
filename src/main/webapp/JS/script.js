function add_to_cart(pid, pname, pprice) {
	
	let cart = localStorage.getItem("cart");
	
	if(cart == null){
		
		let products = [];
		let product = {productId: pid,productName: pname,productQuantity: 1,productPrice: pprice}
		
		products.push(product);
		
		localStorage.setItem("cart", JSON.stringify(products));
		console.log("Product added for fisrt time");
		
	}else{
		
		let pcart = JSON.parse(cart);
		
		let oldProd = pcart.find((item)=> item.productId == pid)
		
		if(oldProd){
			
			oldProd.productQuantity = oldProd.productQuantity+1
			
			pcart.map((item)=>{
				
				if(item.productId == oldProd.productId){
					item.productQuantity = oldProd.productQuantity;
				}
				
			} )
			
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("Product quantity is increased");
			
		}else{
			
			let product = {productId: pid,productName: pname,productQuantity: 1,productPrice: pprice}
			
			pcart.push(product);
			
			
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("Product added");
			
		}
		
	}
	
	updateCart();
	
}

function updateCart() {
	
	let cartString = localStorage.getItem("cart");
	
	let cart = JSON.parse(cartString);
	
	if(cart == null || cart.length == 0){
		console.log("Cart Empty");
		$(".cart-item").html("(0)");
		$(".cart-body").html("<h3> Cart does not have any item </h3>");
		$(".checkout-btn").attr("disabled", true);
		
	}else{
		
		console.log(cart);
		$(".cart-item").html(`(${cart.length})`);
		
		let table = `
		
		<table class = 'table'>
		<thead class = 'thead-light'
		
		<tr>
		
		<th>Name</th>
		<th>Price(1)</th>
		<th>Quantity</th>
		<th>Price(*n)</th>
		<th>Action</th>
		
		</tr>
		
		</thead>
		
		`;
		
		let totalPrice = 0;
		
		cart.map((item)=>{
			
			table +=
				`
				<tr>
					<td> ${item.productName} </td>
					<td> ${item.productPrice} </td>
					<td> ${item.productQuantity} </td>
					<td> ${item.productQuantity*item.productPrice} </td>
					<td> <button onclick = "deleteItem(${item.productId})" class="btn btn-danger btn-sm">Remove </button></td>
				</tr>
				
				`
				totalPrice += item.productQuantity*item.productPrice;
				
		} )
		
		
		
		table = table+`
		
		<td> <button class="btn btn-success btn-sm text-right">Total: ${totalPrice}</button></td>
		
		</table>`
		
		$(".cart-body").html(table);
		
		$(".checkout-btn").attr("disabled", false);
	}
}

function deleteItem(pid) {
	
	let cart = JSON.parse(localStorage.getItem("cart"));
	
	let newcart = cart.filter((item) => item.productId != pid)
	
	localStorage.setItem("cart", JSON.stringify(newcart));
	
	updateCart();
}

$(document) .ready(function () {
	updateCart();
})

function goToCheckout() {
	
	window.location = "checkout.jsp"
}