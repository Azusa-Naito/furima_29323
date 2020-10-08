if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  function price() {
    const inputPrice = document.getElementById("item-price");
    const displayedFee = document.getElementById("add-tax-price");
    const displayedProfit = document.getElementById("profit");
    

    inputPrice.addEventListener( 'input', () => {
      const inputValue = inputPrice.value;
      if ( inputValue >=300 && inputValue <= 9999999 ) {
      displayedFee.textContent = Math.floor(inputValue * 0.1);
      displayedProfit.textContent = inputValue - Math.floor(inputValue * 0.1);
      } else {
        displayedFee.textContent = " -- ";
        displayedProfit.textContent = " -- ";
      }
    });
  }
  window.addEventListener('load', price)
}