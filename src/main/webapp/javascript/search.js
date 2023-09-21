	let allProductsDetails = [];
	async function getAllProducts() {
	    try {
	        const response = await fetch("http://localhost:8080/fertagriboomiweb/Product/all", {
	            method: "GET",
	        });

	        if (!response.ok) {
	            throw new Error("HTTP error! Status: "+ response.status);
	        }

	        const responseData = await response.json();

	        // Access the array of products from the 'data' property
	        allProductsDetails = responseData.data;

	        // Call a function to process or display the data
	        getAllProductsDetails(allProductsDetails);
	    } catch (error) {
	        console.error("Error fetching product data:", error);
	    }
	}

	//Call the function to fetch product data
	getAllProducts();
	const rootPath = window.location.origin;
	// function to process or display the data

	function getAllProductsDetails(allProducts) {
		const suggestions = [];


	// iterate through allProducts and create an <a> tag for each one
	// add each <a> tag to a <li> tag and append to a <div> with class "autocom-box"
	for (let i = 0; i < allProducts.length; i++) {
	  const li_search = document.createElement("li");
	  document.querySelector("div.autocom-box").append(li_search);

	  const product_id = allProducts[i].id;
	  const  product_name  = allProducts[i];
	  const product_url = 'http://localhost:8080/fertagriboomiweb/product/details?product_id='+product_id;

	  suggestions.push(allProducts[i].name);

	  const a_search = document.createElement("a");
	  a_search.setAttribute("href", product_url);
	  a_search.innerText = allProducts[i].name;
	  li_search.append(a_search);
	}
	
	// get input and suggestion box elements
	const searchWrapper = document.querySelector(".search-input");
	const inputBox = searchWrapper.querySelector("input");
	const suggBox = searchWrapper.querySelector(".autocom-box");

	// Add event listener for input changes
	inputBox.addEventListener("input", () => {
	  // Get input value and trim whitespace and convert to lowercase
	  const productData = inputBox.value.trim().toLowerCase();
	  // Initialize empty array to hold suggestions
	  let emptyArray = [];

	  // If there's input data
	  if (productData.length > 0) {
	    // Filter the suggestions array to find matches
	    emptyArray = suggestions.filter((data) =>
	      data.toLowerCase().includes(productData)
	    );

	    // Map the filtered data to HTML list elements
	    emptyArray = emptyArray.map((data) => {
	      // Find the product ID based on the product name
	      const product_id = allProducts.find(
	        (p) => p.name === data
	      ).id;
	      // Generate the URL for the product details page
	      const product_url = 'http://localhost:8080/fertagriboomiweb/product/details?product_id='+ product_id;
	      // Return the HTML link
	      return '<li><a href='+product_url+'>'+data+'</a></li>';
	    });

	    // If there are no results, add a message to the list
	    if (emptyArray.length === 0) {
	      emptyArray.push("<li>No results found for " + productData +"</li>");
	    }

	    // Show the suggestions box and update the HTML
	    searchWrapper.classList.add("actives");
	    showSuggestions(emptyArray);

	    // Add click event listeners to the suggestion links
	    const allList = suggBox.querySelectorAll("li");

	    for (let i = 0; i < allList.length; i++) {
	    	  allList[i].addEventListener("click", function () {
	    	    selectedd(this);
	    	  });
	    	}
	  } else {
	    // Hide the suggestions box if there's no input data
	    searchWrapper.classList.remove("actives");
	  }
	});
	

	// function to handle the click on suggested items
	function selectedd(element) {
	  // get the clicked data
	  const clickedData = element.textContent;

	  // find the product id of the clicked data from allProducts array
	  const product_id = allProducts.find(
	    (p) => p.name === clickedData
	  )?.id;

	  // if the clicked data is in suggestions array
	  if (suggestions.includes(clickedData)) {
	    // set the value of input box to the clicked data
	    inputBox.value = clickedData;

	    // create the product url with the clicked data and product id
	     const product_url = 'http://localhost:8080/fertagriboomiweb/product/details?product_id='+ product_id;
	     
	    // redirect the user to the product url
	    window.location.href = product_url;
	  } else {
	    // if the clicked data is not in suggestions array, clear the input box
	    inputBox.value = "";
	  }

	  // remove the active class from search wrapper
	  searchWrapper.classList.remove("actives");
	}
	// function to show the suggestions
	function showSuggestions(list) {
	  let listData;

	  // if the list is empty, create a new item for user value
	  if (!list.length) {
	    const userValue = inputBox.value;
	   const product_url = 'http://localhost:8080/fertagriboomiweb/product/details?product_id='+ product_id;
	     
	    listData = '<li><a href='+product_url+'>'+userValue+'</a></li>';
	  } else {
	    // join the list items with empty string
	    listData = list.join("");
	  }

	  // set the inner HTML of suggestion box to the list data
	  suggBox.innerHTML = listData;
	}


	// search icon click -------------

	// search function to handle search functionality
	function search() {
	  // get input value and remove leading/trailing whitespace, and convert to lowercase
	  const productData = inputBox.value.trim().toLocaleLowerCase();

	  // check if the input matches any suggestions
	  const selectedProduct = suggestions.find(
	    (data) => data.toLocaleLowerCase() === productData
	  );

	  // if the input matches a suggestion, redirect to the corresponding product page
	  if (selectedProduct) {
	    // get the unique ID of the selected product from the allProducts array
	    const product_id = allProducts.find(
	      (p) => p.name === selectedProduct
	    ).id;

	    // construct the URL of the product page with the selected product name and ID, and redirect to it
	    const product_url = 'http://localhost:8080/fertagriboomiweb/product/details?product_id='+ product_id;
	    window.location.href = product_url;
	  }
	  // if the input does not match any suggestions but is not empty, display filtered suggestions
	  else if (productData) {
	    // filter suggestions that start with the input
	    const filteredProducts = suggestions.filter((data) =>
	      data.toLocaleLowerCase().startsWith(productData)
	    );

	    // create an array of HTML elements containing the filtered suggestions
	    const emptyArray = filteredProducts.map((data) => {
	      // get the unique ID of the corresponding product from the allProducts array
	      const product_id = allProducts.find(
	        (p) => p.name === data
	      ).id;

	      // construct the URL of the product page with the product name and ID, and return it as an HTML element
	    	    const product_url = 'http://localhost:8080/fertagriboomiweb/product/details?product_id='+ product_id;
	      return '<li><a href='+product_url+'>'+data+'</a></li>';
	    });

	    // display the array of HTML elements as suggestions
	    showSuggestions(emptyArray);
	  }
	  // if the input is empty, hide the suggestions
	  else {
	    searchWrapper.classList.remove("actives");
	  }
	}

	// get search button element and add event listener to trigger search function on click
	const searchBtn = document.querySelector(".sear_btn");
	searchBtn.addEventListener("click", search);

}
	 
