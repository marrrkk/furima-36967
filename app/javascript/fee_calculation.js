window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
  })
  const addTaxDom = document.getElementById("add-tax-price");
  priceInput.addEventListener("input", () => {
    addTaxDom.innerHTML = Math.round(priceInput.value * 0.1 );
  })
  const addPofitDom = document.getElementById("profit");
  priceInput.addEventListener("input", () => {
    addPofitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))
  })
});