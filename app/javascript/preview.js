if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div')
      imageElement.setAttribute('id', "image-element")
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('#image-element').length

     // 表示する画像を生成
      const blobImage = document.createElement('img')
      blobImage.setAttribute('src', blob)

      // ファイル選択ボタンを生成
      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `item_image_${imageElementNum}`)
      inputHTML.setAttribute('name', 'item[images][]')
      inputHTML.setAttribute('type', 'file')

     // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage)
      imageElement.appendChild(inputHTML)
      ImageList.appendChild(imageElement)

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
      }
    
    //item-imageは検証ツールからとってくる
    document.getElementById('item-image').addEventListener('change', function(e){
      //取得できた画像情報をプレビューとして表示させるためにimg要素に付与するsrc属性のURLを生成
      const file = e.target.files[0];
      //取得した画像情報のURLを生成
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    });
  });
}

//if (document.URL.match( /\/items\/\d+\/new/ ) || document.URL.match( /\/items\/\d+\/edit/ )