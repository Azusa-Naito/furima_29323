import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },
  // ↓データを受け取ったら実行してね
  received(data) {
    //現在開いているページのURLを取得
    let url = window.location.href
    let param = url.split('/');
    let paramItem = param[param.length-1]
    // パラメータidがdata.idかどうかを判断する
    if (paramItem == data.id) {
      // ↓item/showのdiv
      const comments = document.getElementById('comments');
      const comment = document.getElementsByClassName('comment-display');
      //使用する要素の作成
      const textElement = document.createElement('div');
      textElement.setAttribute('class', "comment-display");
      const topElement = document.createElement('div');
      topElement.setAttribute('class', "comment-top");
      const nameElement = document.createElement('div');
      const timeElement = document.createElement('div');
      const bottomElement = document.createElement('div');
      bottomElement.setAttribute('class', "comment-bottom");
      // 生成したHTMLの要素をブラウザに表示させる
      comments.insertBefore(textElement, comments.firstElementChild);
      textElement.appendChild(topElement);
      textElement.appendChild(bottomElement);
      topElement.appendChild(nameElement);
      topElement.appendChild(timeElement);
      // 表示するテキストを生成
      const name = `${data.nickname}`;
      nameElement.innerHTML = name;
      const time = `${data.time}`;
      timeElement.innerHTML = time;
      const text = `<p>${data.content.text}</p>`;
      bottomElement.innerHTML = text;

      const newComment = document.getElementById('comment_text');
      newComment.value='';
      
      const inputElement = document.querySelector('input[name="commit"]');
      inputElement.disabled = false;
    }
  }
});
