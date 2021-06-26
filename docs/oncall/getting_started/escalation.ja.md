# エスカレーションポリシーの設定

## 目的

エスカレーションポリシーは、チームで誰が実際にオンコール対応するかを定義し、前のモジュールで設定したローテーションと結びつけて使われます。

このモジュールでは、3つの異なるエスカレーションポリシーを作成して、さまざまな機能や操作モデルを体験していきます。

設定を行う前に、まず、講師が概念を説明します。

---

**Team** サブメニューの **Escalation Polices** タブに移動します。既存のポリシーがないので、作成する必要があります。

![No Escalation Policies](../../images/oncall/no-escalation.png){: .center}

ここでは、3つの典型的なユースケースをカバーするために、次のようなポリシーを作成します。

![Escalation Policies](../../images/oncall/escalation-policies.png)

## 1. 24/7 ポリシー

**Add Escalation Policy** をクリックします。

* Policy Name: 24/7
* Step 1
* Immediately（直ちに）
* Notify the on-duty user(s) in rotation（ローテーション担当に通知） → Senior SRE Escalation
* **Save** をクリック

![24/7 Escalation Policy ](../../images/oncall/24-7-escalation-policy.png)

## 2. プライマリーポリシー

**Add Escalation Policy** をクリックします。

* Policy Name: Primary
* Step 1
* Immediately（直ちに）
* Notify the on-duty user(s) in rotation（ローテーション担当に通知） → Follow The Sunサポート - 業務時間帯
* **Add Step** をクリック

![Pri Escalation Policy Step 1](../../images/oncall/pri-escalation-policy-step-1.png)

* Step 2
* If still unacked after 15 minutes（15分経ってもアクノレッジされない場合）
* Notify the next user(s) in the current on-duty shift（ローテーションの次のユーザーに通知） → Follow The Sunサポート - 業務時間帯
* **Add Step** をクリック

![Pri Escalation Policy Step 2](../../images/oncall/pri-escalation-policy-step-2.png)

* Step 3
* If still unacked after 15 more minutes（15分経ってもアクノレッジされない場合）
* Execute Policy → [あなたのチーム名] : 24/7
* **Save** をクリック

![Pri Escalation Policy Step 3](../../images/oncall/pri-escalation-policy-step-3.png)

## 3. ウェイティングルームポリシー

**Add Escalation Policy** をクリックします。

* Policy Name: Primary
* Step 1
* If still unacked after 10 more minutes（10分経ってもアクノレッジされない場合）
* Execute Policy → [あなたのチーム名] : Primary
* **Save** をクリック

![WR Escalation Policy](../../images/oncall/wr-escalation-policy.png)

これで、以下の3つのエスカレーションポリシーができました。

![Escalation Policies](../../images/oncall/escalation-policies.png)

各ポリシーを作成する際に、以下のような警告メッセージが表示されていたことにお気づきでしょうか。

!!! warning
    There are no routing keys for this policy - it will only receive incidents via manual reroute or when on another escalation policy
    （このポリシーにはルーティング・キーがありません。このポリシーは、手動で再ルーティングするか、他のエスカレーション・ポリシーを使用する場合にのみインシデントを受け取ります。)

これは、これらのエスカレーション・ポリシーにリンクされたルーティング・キーがないためです。次のモジュールで、ルーティング・キーを作成して、それをポリシーにリンクしていきます

---
[ルーティングキーを作成](../routing/)モジュールに進みましょう。
