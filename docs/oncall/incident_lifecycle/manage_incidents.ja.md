# インシデントの管理

## 1. アクノレッジする

携帯電話の Splunk On-Call アプリを使用して、**プッシュ通知** をクリックしてインシデントを確認します。

![Push Notification](../../images/oncall/mobile-notification.png){: .center}

その後、右上の **single tick** または **Acknowledge** リンクをクリックして、インシデントをアクノレッジし、エスカレーションプロセスを停止させます。

すると、 :fontawesome-solid-check: が :fontawesome-solid-check::fontawesome-solid-check: に変わり、ステータスが **TRIGGERED** から **ACKNOWLEDGED** に変わります。

| Triggered Incident  | Acknowledge Incident  |
|---|---|
|![Acknowledge Alert](../../images/oncall/phone-acknowledge-alert.png){: .center}|![Alert Acknowledged](../../images/oncall/phone-alert-acknowledged.png){: .center}|

## 2. 詳細とアノテーション

スマートフォンで、 Alert details タブを選択します。 次にWeb UIで **Timeline** に戻り、右側の **Team Incidents** から **Acknowledged** を選択して、新しい **Incident** をクリックします。

これで、スマートフォンとWeb UIの両方で **Details** タブが開けるようになるはずです。どちらも全く同じ情報が表示されています。

次に、スマートフォンとWeb UIの両方で **Annotations** タブを選択すると、Splunk Infrastructure Monitoringによって生成された **グラフ** がUIに表示されます。

![UI Annotations](../../images/oncall/ui-annotations.png){: .center}

スマートフォンでも同じ画像が表示されるはずです（画像のサイズによっては、リンクの表示のみになることもあります）。

![Phone Link](../../images/oncall/phone-annotations.png){: .center}

Splunk On-Call は「モバイルファースト」のプラットフォームであり、スマートフォンアプリはフル機能を備えており、スマートフォンのみでインシデントを管理することができます。

このモジュールの残りの部分では Web UI に焦点を当てていきます。スマートフォンアプリの機能についても、このワークショップの後で確認してみてください。

## 3. アラートシステムへのリンク

Web UIでは、 **2.Alert Details in SignalFx** リンクをクリックします。

![Alert Details](../../images/oncall/alert-details-in-sfx.png){: .center}

これにより、新しいブラウザタブが開き、Splunk Infrastructure Monitoring 内のアラートに直接移動し、その UI に組み込まれた強力なツールを使用して、トラブルシューティングを進めることができます。

![SFX Alert Details](../../images/oncall/sfx-alert-details.png)

ここでは Splunk On-Call に焦点を当てていますので、このタブを閉じて Splunk On-Call の UI に戻りましょう。

## 4. 類似インシデント

Splunk On-Call は、システム内の過去のインシデントを識別して、このインシデントに取り組むための最良の方法のヒントを与えてくれるかもしれません。

**Similar Insidents** タブがまさにそれを実現するもので、過去のインシデントを表示し、それらを見て、解決するためにどのようなアクションが取られたかを確認することができ、今起こっているインシデントの対応の参考にすることができます。

![Similar Incidents](../../images/oncall/similar-incidents.png)

## 5 タイムライン

右側のタイムラインビューでは、メッセージを追加したり、以前のアラートやインタラクションの履歴を確認することができます。

![Incident View](../../images/oncall/war-room-dashboard.png)

## 6 レスポンダーの追加

左端にある **Add Responders** リンクをクリックすると、このインシデントに追加のリソースを割り当てることができます。

![add-responders](../../images/oncall/add-responders.png){: .center}

これにより、他のチームや個々のユーザーを追加して、このインシデントに特化したその場限りの即席チームを構築することができます。また、全員が集まってコラボレーションできる **Conference Bridge** を共有することもできます。

![Conference Bridge](../../images/oncall/conference-bridge.png){: .center}。

システムにインシデントデータの履歴が蓄積されると、機械学習を利用して、過去に同様のインシデントに取り組んだことのあるチームやユーザーを提案し、このインシデントの迅速な解決を支援するのに最も適した即席チームを作ることもできます。

異なるチームやユーザーを選択してカンファレンスブリッジを事前に設定・選択することもできますし、希望するプロバイダーの新しいブリッジの詳細を入力することもできます。

この演習ではレスポンダーを追加する必要はありませんので、**Cancel** をクリックして **Add Responders** ダイアログを閉じます。

## 7 リルート

インシデントを別のチームで処理した方が良いと判断した場合、左パネルの上部にある **Reroute** ボタンをクリックすることで、コールを **Reroute** することができます。

![Reroute](../../images/oncall/reroute1.png){: .center}.

Add Responders ダイアログと同じように、インシデントをリルートするチームやユーザーを選択することができます。

![Reroute Incident](../../images/oncall/reroute2.png){: .center}

この演習ではリルートを行う必要はありませんので、**Cancel** をクリックして **Reroute** ダイアログを閉じます。

## 8 スヌーズ

左側パネルの上部にある **⏰** ボタンをクリックすると、このインシデントを**スヌーズ**することができます。

![Snnoze](../../images/oncall/snooze1.png){: .center}

インシデントをスヌーズする時間を最大24時間まで入力できます。このアクションはタイムラインで追跡され、時間が経過するとページングが再開されます。

これは優先度の低いインシデントの場合に便利で、数時間後に後回しにすることができますが、ページングプロセスが再び開始されることで忘れ去られることはありません。

![Snooze Incident](../../images/oncall/snooze2.png){: .center}

この演習では実際にスヌーズを行う必要はありませんので、**Cancel** をクリックして **Snooze Incident** ダイアログを閉じます。

## 9 アクショントラッキング

それでは、この問題を修正し、インシデントを更新してみましょう。右側のパネルの上部に、**Discovered rogue process, terminated it** のような新しいメッセージを追加します。

![Add Message](../../images/oncall/time-line-update-message.png){: .center}

インシデントに関連するすべてのアクションはここに記録され、**Reports** タブから利用できる **Post Incident Review Report** にまとめられます。

## 10 解決

VMのシェルセッションに戻り、**ctrl+c** を押して、CPUを最大にするためにVMで開始したプロセスを終了します。

10秒以内に、SignalFxは新しいCPU値を検出し、SignalFxのアラート状態をクリアし、VictorOpsのインシデントを **Resolved** として自動的に更新します。

![Resolved](../../images/oncall/m7-resolved.png){: .center .zoom}

Splunk Infrastructure Monitoring と Splunk On-Call の間で双方向の統合を行っているため、Splunk On-Call でインシデントを解決済みとしてマークすることもでき、その結果、Splunk Infrastructure Monitoring のアラートも解決されることになります。

---

これで Splunk On-Call の紹介は終わりです。さらに気になる方は、より高度なモジュールを **オプションモジュール** セクションでチェックしていきましょう。次のセクションでは、以下のようなトピックを扱っています。

* レポート作成
* API の使用
* Webhooks
* アラートルールエンジン
* メンテナンスモード
