// 生年月日から年齢と月齢を計算する関数
function calculateAgeAndMonths(birthDate) {
  const today = new Date();
  const birth = new Date(birthDate);

  let age = today.getFullYear() - birth.getFullYear();
  const monthDiff = today.getMonth() - birth.getMonth();
  let months = monthDiff;

  // 今年の誕生日がまだ来ていない場合は、年齢を1つ減らし、月齢を補正する
  if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birth.getDate())) {
    age--;
    months = 12 + monthDiff; // 補正された月齢
  }

  return { age: age, months: months };
}

// DOMContentLoaded イベントが発生した際に実行される処理
window.addEventListener('click', function() {
  // 生年月日のテキストを取得
  const birthDateElement = document.getElementById('birth-date');

  // 要素が存在しなければ処理を終了
  if (!birthDateElement) return;

  // 生年月日のテキストを取得
  let birthDateText = birthDateElement.textContent.trim();
  // Replaceで形式を変換
  birthDateText = birthDateText.replace("年 ", "-");
  birthDateText = birthDateText.replace("月 ", "-");
  birthDateText = birthDateText.replace("日", "");

  // calculateAgeAndMonths 関数を使用して年齢と月齢を計算
  const ageAndMonths = calculateAgeAndMonths(birthDateText);
  const age = ageAndMonths.age;
  const months = ageAndMonths.months;

  // 年齢と月齢を表示する要素を取得
  const ageAndMonthsElement = document.getElementById('age-and-months');

  // 要素が存在しなければ処理を終了
  if (!ageAndMonthsElement) return;
  
  
  // 年齢と月齢を表示する要素に計算結果を設定
  ageAndMonthsElement.textContent = '( ' + age + '歳 ' + months + 'ヶ月 )';
});
