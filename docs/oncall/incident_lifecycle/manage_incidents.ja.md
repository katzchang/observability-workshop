# インシデントの管理

## 1. 承認する

携帯電話の Splunk On-Call アプリを使用して、**プッシュ通知** をクリックしてインシデントを確認します ...

![プッシュ通知](../../images/oncall/mobile-notification.png){: .center}をクリックします。

その後、右上の **単一のチェック** または **確認** リンクをクリックしてインシデントを確認し、エスカレーションプロセスを停止します。

すると、 :fontawesome-solid-check::fontawesome-solid-check::fontawesome-solid-check: に変わり、ステータスが **TRIGGERED** から **ACKNOWLEDGED** に変わります。

| Triggered Incident | Acknowledge Incident |.
|---|---|
|![Acknowledge Alert](../../images/oncall/phone-acknowledge-alert.png){: .center}|![Alert Acknowledged](../../images/oncall/phone-alert-acknowledged.png){: .center}|。

## 2. 詳細とアノテーション

携帯電話で、[アラートの詳細]タブを選択します。 次にWeb UIで、**Timeline**に戻り、右側の**Team Incidents**を選択し、**Acknowledged**を選択して、新しい**Incident**をクリックします。

これで、PhoneとWeb UIの両方に**Details**タブが表示されるはずです。どちらも全く同じ情報が表示されていることに注目してください。

次に、電話とWeb UIの両方で**注釈**タブを選択すると、Splunk Infrastructure Monitoringによって生成された**グラフ**がUIに表示されます。

![UI Annotations](../../images/oncall/ui-annotations.png){: .center}をクリックします。

携帯電話では、同じ画像が表示されるはずです (画像のサイズによっては、単純なハイパーリンクになることもあります)

![電話リンク](../../images/oncall/phone-annotations.png){: .center}。

Splunk On-Call は「モバイルファースト」のプラットフォームであり、電話アプリはフル機能を備えており、電話から直接インシデントを管理することができます。

このモジュールの残りの部分では、ウェブ UI に焦点を当てますが、電話アプリの機能については後で時間をかけて調べてください。

## 3. アラートシステムへのリンク

Web UIでは、**2.Alert Details in SignalFx**リンクをクリックします。Alert Details in SignalFx**のリンクをクリックします。

![アラートの詳細](../../images/oncall/alert-details-in-sfx.png){: .center}をクリックします。

これにより、新しいブラウザタブが開き、Splunk Infrastructure Monitoring 内のアラートに直接移動し、その UI に組み込まれた強力なツールを使用してトラブルシューティングを進めることができます。

![SFX アラート詳細](../../images/oncall/sfx-alert-details.png)

しかし、ここでは Splunk On-Call に焦点を当てていますので、このタブを閉じて Splunk On-Call の UI に戻ります。

## 4. 類似インシデント

Splunk On-Call は、システム内の過去のインシデントを識別して、このインシデントに取り組むための最良の方法のヒントを与えてくれるかもしれません。

類似インシデント**タブはまさにそれを実現するもので、過去のインシデントを表示し、それらを見て、解決するためにどのようなアクションが取られたかを確認することができ、今回のインシデントにも簡単に繰り返すことができます。

![類似インシデント](../../images/oncall/similar-incidents.png)

## 5 タイムライン

右側のタイムラインビューでは、メッセージを追加したり、以前のアラートやインタラクションの履歴を確認することができます。

![インシデントビュー](../../images/oncall/war-room-dashboard.png)

## 6 レスポンダーの追加

左端にある**Add Responders**リンクをクリックすると、このインシデントに追加のリソースを割り当てることができます。

![add-responders](../../images/oncall/add-responders.png){: .center}をクリックします。

これにより、他のチームや個々のユーザーを追加して、このインシデントに特化した仮想チームを構築することができます。また、全員が集まってコラボレーションできる**Conference Bridge**の詳細を共有することもできます。

![Conference Bridge](../../images/oncall/conference-bridge.png){: .center}。

システムがインシデントデータの履歴を蓄積すると、機械学習を利用して、過去に同様のインシデントに取り組んだことのあるチームやユーザーを提案し、彼らがこのインシデントの迅速な解決を支援するのに最も適しているかもしれません。

異なるチームやユーザーを選択し、事前に設定された会議ブリッジを選択することも、希望するプロバイダーの新しいブリッジの詳細を入力することもできます。

この演習ではレスポンダーを追加する必要はありませんので、**キャンセル**をクリックして**レスポンダーの追加**ダイアログを閉じます。

## 7 Reroute

インシデントを別のチームで処理した方が良いと判断した場合、左パネルの上部にある**Reroute**ボタンをクリックすることで、コールを**Reroute**することができます。

![Reroute](../../images/oncall/reroute1.png){: .center}.

レスポンダーの追加] ダイアログと同様の方法で、インシデントを再ルーティングするチームやユーザーを選択することができます。

![Reroute Incident](../../images/oncall/reroute2.png){: .center}をクリックします。

この演習では実際にRerouteする必要はありませんので、**Cancel**をクリックして**Reroute Incident**ダイアログを閉じます。

## 8 スヌーズ

左側パネルの上部にある**目覚まし時計**ボタンをクリックすると、このインシデントを**スヌーズ**することができます。

![スヌーズ](../../images/oncall/snooze1.png){: .center}。

インシデントをスヌーズする時間を最大24時間まで入力できます。 このアクションはタイムラインで追跡され、時間が経過するとページングが再開されます。

これは優先度の低いインシデントの場合に便利で、数時間後に後回しにすることができますが、ページングプロセスが再び開始されることで忘れ去られることはありません。

![スヌーズインシデント](../../images/oncall/snooze2.png){: .center}を使用します。

この演習では実際にスヌーズを行う必要はありませんので、**Cancel**をクリックして**Snooze Incident**ダイアログを閉じます。

## 9 アクショントラッキング

それでは、この問題を修正し、インシデントを更新してみましょう。 右側のパネルの上部に、**Discovered rogue process, terminated it**のような新しいメッセージを追加します。

![メッセージの追加](../../images/oncall/time-line-update-message.png){: .center}。

インシデントに関連するすべてのアクションはここに記録され、**Reports**タブから利用できる**Post Incident Review Report**にまとめられます。

## 10 解決

VMのシェルセッションに戻り、**ctrl+c**を押して、CPUを最大にするためにVMで開始したプロセスを終了します。

10秒以内に、SignalFxは新しいCPU値を検出し、SignalFxのアラート状態をクリアし、VictorOpsのインシデントを **解決** として自動的に更新します。

![Resolved](../../images/oncall/m7-resolved.png){: .center .zoom}。

Splunk Infrastructure Monitoring と Splunk On-Call の間で双方向の統合を行っているため、Splunk On-Call でインシデントを解決済みとしてマークすることもでき、その結果、Splunk Infrastructure Monitoring のアラートも解決されることになります。

---

これで Splunk On-Call の紹介は終わりですが、今後数週間で公開される、より高度なモジュールを **オプションモジュール** セクションでチェックしてみてください。 これらのモジュールでは、以下のようなトピックを扱う予定です。

* レポート作成
* API の使用
* Webhooks
* アラートルールエンジン
* メンテナンスモード
