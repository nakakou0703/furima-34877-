window.addEventListener('load', function(){
  
  const price = document.getElementById("item-price")
  price.addEventListener("input", () => {
    const inputValue = price.value;
      console.log(inputValue);
    const tax = document.getElementById("add-tax-price")
    tax.innerHTML = (Math.floor(inputValue * 0.1));
      console.log(tax);
    const profit = document.getElementById("profit")
      const value_result = inputValue * 0.1
      console.log(value_result);
      profit.innerHTML = (Math.floor(inputValue - value_result));
        console.log(profit);
  })
})