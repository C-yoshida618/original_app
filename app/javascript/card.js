const pay = () => {
  const publicKey = gon.public_key;
  const payjp = Payjp(publicKey); // PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form');
  form.addEventListener("submit", (e) => {
    e.preventDefault(); // フォームのデフォルト動作を防ぐ

    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        // エラー処理
        console.error(response.error);
      } else {
        const token = response.id;
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        form.insertAdjacentHTML("beforeend", tokenObj);
        form.submit(); // トークンを追加した後にフォームを送信
      }
    });
  });
};

document.addEventListener("DOMContentLoaded", pay);
