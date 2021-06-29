# インシデントを起こす

## 目的

このモジュールでは、自分自身を「オンコール」にして、付属のEC2インスタンスを使ってインシデントを発生させ、インシデントのライフサイクルに沿った作業を確認していきます。

---

## 1. オンコール

インシデントを発生させる前に、自分自身を **Follow the Sun Support - Business Hours** ローテーションの中の現在のシフトに割り当て、さらに自分自身を **On-Call** に配置する必要があります。

* 左側の **People** セクションにある **Team** 内の **Schedule** リンクをクリックするか、**Teams → [あなたのチーム] → Rotations** に移動します。
* **Follow the Sun Support - Business Hours** ローテーションを開きます。
* あなたのタイムゾーンに応じた現在のアクティブなシフトの **Manage members** アイコンをクリックします。
![Manage Members](../../images/oncall/manage-members.png)
* **Select a user to add...** のドロップダウンを使って、自分をシフトに追加します。
* 次に、自分の名前の横にある　**Set Current**　をクリックして、自分をシフト内の現在の　**on-call**　ユーザーにします。
* これで、あなたの携帯電話には、オンコールになった旨を知らせる **You Are Now On-Call** という **プッシュ通知** が届くはずです。
![On Duty](../../images/oncall/on-duty.png){: .center}

## 2. アラートを発生させる

EC2インスタンスに接続されたシェルに戻って、以下のコマンドがすべてインスタンスから実行できます。

以下のコマンドを実行して、CPUを強制的に100%にスパイクさせます。

=== "Shellコマンド"

    ```
    openssl speed -multi $(grep -ci processor /proc/cpuinfo)
    ```

=== "Output"

    ```
    Forked child 0
    +DT:md4:3:16
    +R:19357020:md4:3.000000
    +DT:md4:3:64
    +R:14706608:md4:3.010000
    +DT:md4:3:256
    +R:8262960:md4:3.000000
    +DT:md4:3:1024
    ```

この結果、Splunk Infrastructure Monitoring によってアラートが生成され、さらに 10 秒以内に Splunk On-Call でインシデントが生成されます。これは、お使いのインスタンスにインストールされている SignalFx エージェントのデフォルトのポーリング時間です (1秒に短縮することもできます)。

---
[インシデントの管理](../manage_incidents/) モジュールに続きます。
