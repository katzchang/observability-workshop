# ローテーションの設定

## 目的

ローテーションとは、1つまたは複数のシフトで構成される反復的なスケジュールのことで、メンバーはそれぞれのシフトを交代で担当します。

このモジュールでは、2つのローテーションの例を設定して、そのローテーションにチームメンバーを割り当てていきます。

---

**Teams** サブメニューの **Rotation** タブを開いてください。

1つ目のローテーションは、各シフトのメンバーがタイムゾーン内で通常の勤務時間中にカバーする「Follow The Sun」サポートパターン用に作成します。

2つ目のローテーションは、経験豊富なシニアメンバーによるエスカレーションサポートを提供するためのもので、24時間365日、1週間のシフトパターンに基づいています。

## 1. Follow The Sunサポート - 業務時間帯

**Add Rotation** をクリックしてください。

![Add Rotation](../../images/oncall/add-rotation.png){: .center}

名前に「*Follow The Sunサポート - 業務時間帯*」と入力し、利用可能な3つのシフトテンプレートから **Partial day** を選択します。

![Follow the Sun](../../images/oncall/follow-the-sun.png)

* Shift nameは「*Asia*」と入力
* Timezoneは「*Asia/Tokyo*」を選択
* 各ユーザーの勤務時間は「*月曜から金曜の9.00amから5.00pm*」
* Handoffは「*5 days*」ごと
* Next Handoffは、カレンダーで次の月曜日を選択
* **Save Rotation** をクリック

![Asia Shift](../../images/oncall/asia-shift.png)

このシフトにメンバーを追加するプロンプトが表示されます。このワークショップにSplunkが提供する環境を使用している場合は、アジアのメンバーである **jimhalpert, lydia, marie** を追加してください。

独自の組織を使用している場合は、お手持ちのリストから適切なメンバーを追加してください。

![Asia Members](../../images/oncall/asia-members.png)

次に、2番目のシフトであるヨーロッパを追加します。**+Add a shift → Partial Day** をクリックし、

* Shift nameは「*Europe*」と入力
* Timezoneは「*Eulope/London*」を選択
* 各ユーザーの勤務時間は「*月曜から金曜の9.00amから5.00pm*」
* Handoffは「*5 days*」ごと
* Next Handoffは、カレンダーで次の月曜日を選択
* **Save Rotation** をクリック

![Europe Shift](../../images/oncall/europe-shift.png)

このシフトにメンバーを追加するプロンプトが表示されます。このワークショップにSplunkが提供する環境を使用している場合は、ヨーロッパのメンバーである **duanechow, gomez, heisenberg** を追加してください。

独自の組織を使用している場合は、お手持ちのリストから適切なメンバーを追加してください。

![Europe Members](../../images/oncall/europe-members.png)

次に、2番目のシフトであるアメリカ西海岸を追加します。**+Add a shift → Partial Day** をクリックし、


* Shift nameは「*West Coast*」と入力
* Timezoneは「*US/Pacific*」を選択
* 各ユーザーの勤務時間は「*月曜から金曜の9.00amから5.00pm*」
* Handoffは「*5 days*」ごと
* 次のHandOffは、カレンダーで次の月曜日を選択
* **Save Rotation** をクリック

![West Coast Shift](../../images/oncall/west-coast-shift.png)

このシフトにメンバーを追加するプロンプトが表示されます。このワークショップにSplunkが提供する環境を使用している場合は、ヨーロッパのメンバーである **maximo, michaelscott, tuco** を追加してください。

独自の組織を使用している場合は、お手持ちのリストから適切なメンバーを追加してください。

![West Coast Members](../../images/oncall/west-coast-members.png)

最初に追加されたユーザーが、そのシフトの「現在の」ユーザーになります。

ユーザーを上下にドラッグするだけで、シフトの順番を変えることができます。また、別のユーザーの「現在の設定」をクリックすると、現在のユーザーを変更することができます。

これで、月〜金の24時間をカバーし、週末はカバーしないという3種類のシフトパターンができました。

次に、シニアSREのエスカレーションカバーのために、別のローテーションを追加していきましょう。

---

## 2. シニアSREエスカレーション

* **Add Rotation** をクリック
* Nameは「*Senior SRE Escalation*」と入力
* Shift Templateは、3つの中から `24/7` を選択
* Shift Nameは「*Senior SRE Escalation*」と入力
* Timezoneは「*Asia/Tokyo*」を選択
* Handoffは「*7 days at 9.00am*」ごと
* 次のHandOffは、カレンダーで次の月曜日を選択
* **Save Rotation** をクリック

![24/7 Shift](../../images/oncall/24-7-shift.png)

このシフトにメンバーを追加するプロンプトが再び表示されます。
このワークショップにSplunkが提供する環境を使用している場合は、ヨーロッパのメンバーである **jackwelker、hank、pambeesly** を追加してください。

独自の組織を使用している場合は、お手持ちのリストから適切なメンバーを追加してください。

![24/7 Members](../../images/oncall/24-7-members.png)

---

講師の指示を待って、次のモジュール「エスカレーションポリシーを設定する」に進みましょう。
