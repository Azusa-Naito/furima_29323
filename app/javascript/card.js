const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); //公開鍵設定
  const form = document.getElementById("charge-form"); //入力画面のform_withのID
  form.addEventListener("submit", (e) => {
    e.preventDefault(); //Railsのフォーム送信処理のキャンセル

    const formResult = document.getElementById("charge-form"); //オブジェクト指向的,おなじIDだったとしても、違う作業の場合は変数を変える、因みにここではHTML要素を取得してるだけ。下の作業で実際に使えるようにする
    const formData = new FormData(formResult); //上で取得したHTML情報から、値を取得できるようにする（フォームオブジェクトの概念）
    const card = { //以下カード情報を変数に代入
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`, //20$ 2020 $は変数
    };
      
    // ↑PAYjpにカード情報を渡すまでの処理
    // ↓PAYjpからかえってきた
    Payjp.createToken(card,(status,response) => { //Payjpにアクセスしてトークンを作成、PAYjpから帰ってきたトークン
      // console.log(status)
      // console.log(response)
      if (status === 200) { //HTTPステータスコードが正常だったときの分岐
        const token = response.id;
        const renderDom = document.getElementById("charge-form") //生成する要素を取得
        const tokenObj = `<input value=${token} type="hidden" name ='token'>`; //生成するHTMLを定義
        renderDom.insertAdjacentHTML("beforeend", tokenObj); //formの最後に生成する処理を行う　ビューファイル
      }
      //↓入力された各カード情報がパラメーターとして送られないように値を削除
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      //フォームに記載されている情報をサーバーサイドへ送信
      document.getElementById("charge-form").submit("");
      // alert("購入しました")
      document.getElementById("charge-form").reset("");
    });
  });
};
window.addEventListener("load", pay)