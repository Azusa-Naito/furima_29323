if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
     // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
     // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };
    //item-imageは検証ツールからとってくる
    document.getElementById('item-image').addEventListener('change', function(e){
      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
      //取得できた画像情報をプレビューとして表示させるためにimg要素に付与するsrc属性のURLを生成
      const file = e.target.files[0];
      //取得した画像情報のURLを生成
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}

//if (document.URL.match( /\/items\/\d+\/new/ ) || document.URL.match( /\/items\/\d+\/edit/ )