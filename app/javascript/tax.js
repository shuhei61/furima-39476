const calculation = ()=>{
  const price_locate = document.getElementById("item-price");
  const tax_price_locate = document.getElementById("add-tax-price");
  const profit_locate = document.getElementById("profit");
  price_locate.addEventListener("input",()=>{
    var price = price_locate.value;
    price = Number(price);
    const tax_price = Math.floor(price * 0.1);
    const profit = price - tax_price ;
    tax_price_locate.innerHTML = tax_price;
    profit_locate.innerHTML = profit;
  });

};

window.addEventListener("turbo:load",calculation);