const calculation = ()=>{
  const price_locate = document.getElementById("item-price");
  const tax_price_locate = document.getElementById("add-tax-price");
  const profit_locate = document.getElementById("profit");
  price_locate.addEventListener("input",()=>{
    var price = document.getElementById("item-price").value;
    price = Number(price);
    const tax_price = price * 0.1 ;
    const profit = price - tax_price ;
    tax_price_locate.innerHTML = tax_price;
    profit_locate.innerHTML = profit;
  });

};

window.addEventListener("load",calculation);