window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
  })
  const addTaxDom = document.getElementById("add-tax-price");
  priceInput.addEventListener("input", () => {
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
  })
  const addPofitDom = document.getElementById("profit");
  priceInput.addEventListener("input", () => {
    addPofitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ))
  })
});