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
	
}