window.addEventListener('load', function(){
  
  const price = document.getElementById("item-price")
  price.addEventListener("input", () => {
    const inputValue = price.value;
    const tax = document.getElementById("add-tax-price")
    tax.innerHTML = (Math.floor(inputValue * 0.1));
    const profit = document.getElementById("profit")
    const value_result = inputValue * 0.1
    profit.innerHTML = (Math.floor(inputValue - value_result));
  })
})