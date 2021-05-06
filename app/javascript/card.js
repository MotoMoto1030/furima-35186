const pay = () => {
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      card_number: formData.get("order_address[card_number]"),
      card_cvc: formData.get("order_address[card_cvc]"),
      card_exp_month: formData.get("order_address[card_exp_month]"),
      card_exp_year: `20${formData.get("order_address[card_exp_year]")}`,
    };
  });
};

window.addEventListener("load", pay);