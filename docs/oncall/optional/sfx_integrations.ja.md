# VictorOps インテグレーション - ラボ概要

このモジュールでは、SignalFx と VictorOps 間のインテグレーションの設定について説明します。以下の詳細なステップでプロセスを説明しますが、このワークショップで使用するSplunkシステム内ではインテグレーションがすでに有効になっているため、ステップ1と2は情報としてのみ使用します。 **「3 IDをコピーする」は実施する必要があります**。

## 1. VictorOps サービス API エンドポイント

!!! 警告
    SignalFxインテグレーションはVictorOpsインスタンスごとに一度だけ有効にする必要があるため、おそらくすでに有効になっていると思います。このラボを完了する際には、すでに有効になっているインテグレーションを**無効にしないで**ください。

**このラボを実施する際には、すでに有効なインテグレーションを無効にしないでください。ワークショップ環境ではインテグレーションがすでに有効になっているため、情報のご紹介のみです。**

SignalFxとVictorOpsをインテグレーションを設定するためには、まずVictorOpsのサービスAPIエンドポイントを取得する必要があります。VictorOpsのUIで **Integrations** メインタブに移動し、検索機能を使ってSignalFx Integrationを見つけます。

まだ有効になっていない場合は、[Enable Integration]ボタンをクリックして有効にします。

![Endpoint](../../images/oncall/endpoint.png)

これにより、VictorOps インテグレーションがまだ有効になっていない場合に、Splunk UI 内で VictorOps インテグレーションを構成する際に使用されます。

## 2. SignalFx での VictorOps インテグレーションの有効化

SplunkのUIで **Integrations** に移動し、検索機能を使ってVictorOpsのインテグレーションを見つけます。

!!! 危険 新しいインテグレーションを作成しないでください！
    既にVictorOpsインテグレーションが存在する場合、追加でVictorOpsインテグレーションを作成しないでください。何かが壊れるわけではありませんが、ワークショップ終了後に余計な清掃作業が発生するだけです。このラボの目的は、インテグレーションがまだ有効になっていない場合に、どのようにインテグレーションを設定するかを示すことです。

VictorOpsのAppDev EMEAインスタンスを使用している場合、VictorOpsインテグレーションはすでに設定されているので、**新しいものを作成する必要はありません**。

新しいインテグレーションを作成するには、以下の画像のように **Create New Integration** をクリックします。もしくは、既存のインテグレーションがあって別のインテグレーションを追加する場合は **New Integration** をクリックします。

![VictorOps Integration](../../images/oncall/m7-sfx-new-vo-integration.png)

説明的な **名前** を入力し、前のステップでコピーした **Service_API_Endpoint** の値を **Post URL** フィールドに貼り付けて、保存します。

![VictorOps Integration](../../images/oncall/m7-sfx-vo-integration-url.png)

!!! 重要: 複数のVictorOpsインテグレーションの取り扱い"
    SignalFxは複数のVictorOpsアカウントとインテグレーションすることができるため、アカウントを作成する際の名前は、単にVictorOpsではなく、説明的な名前を使用することが重要です。この名前はSplunk UIでこのインテグレーションを選択する際に使用されますので、わかりやすい名前にしてください。

## 3. IDをコピーする

Splunk UI で **Integrations** に移動し、検索機能を使用して VictorOps Integration を見つけます。

IDフィールドをコピーして、次のステップで使用するために保存します。 次のステップでいくつかの追加値を収集するため、メモ帳ドキュメントなどを作成することをお勧めします。

![VictorOps Integration](../../images/oncall/m7-sfx-vo-integration-id.png)
