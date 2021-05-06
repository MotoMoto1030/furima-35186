const pay = () => {
  Payjp.setPublicKey("pk_test_3614b785c6ca2470d91e1127");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_address[card_number]"),
      cvc: formData.get("order_address[card_cvc]"),
      exp_month: formData.get("order_address[card_exp_month]"),
      exp_year: `20${formData.get("order_address[card_exp_year]")}`,
    };

    Payjp.createToken(card,(status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form")
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("card_number");
      document.getElementById("card-cvc").removeAttribute("card_cvc");
      document.getElementById("card-exp-month").removeAttribute("card_exp_month");
      document.getElementById("card-exp-year").removeAttribute("card_exp_year");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);