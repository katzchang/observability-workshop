# Multipassを使ったテスト用VMの作成

## 目的

このモジュールでは、Multipass を使ってローカルに VM を作成するプロセスを案内します。

VictorOps の設定が完了したら、この VM を使って SignalFx からのアラートをトリガーし、VictorOps 内でインシデントを発生させ、その結果、あなたに電話がかかってくるようにします。

---

## 1. Multipass のインストール

Multipass をまだインストールしていない場合は、[here](https://multipass.run/){: target=_blank} からインストーラーをダウンロードできます。

macOS をお使いの方は [Homebrew](https://brew.sh/){: target=_blank} を実行してインストールできます。

=== "Shellコマンド"

    ```text
    brew cask install multipass
    ```
---

## 2. Multipass を使って VM を作成する

### 2.1 cloud-init

まず最初に、あらかじめ設定された VM を起動するために、`cloud-init` ファイルをプルダウンします。

=== "Shellコマンド"

    ```text
    WSVERSION=2.32
    curl -s \
    https://raw.githubusercontent.com/signalfx/observability-workshop/v$WSVERSION/cloud-init/victorops.yaml \
    -o victorops.yaml
    ```

### 2.2 VMを起動する

`victorops.yaml` をダウンロードしたディレクトリで、以下のコマンドを実行して VM を作成します。

最初のコマンドでは、ランダムでユニークな4文字の文字列を生成します。これにより、Splunk UI での衝突を防ぐことができます。

=== "Shellコマンド"

    ```text
    export INSTANCE=$(cat /dev/urandom | base64 | tr -dc 'a-z' | head -c4)
    multipass launch \
    --name ${INSTANCE} \
    --cloud-init victorops.yaml
    ```

=== "出力例"

    ```text
    Launched: zevn
    ```

VM のホスト名は後のステップで必要になりますので、メモしておいてください。

### 2.3 VM に接続する

VM が正常にデプロイされたら、**新しく** シェルセッションを起動して、以下のコマンドを使用して VM に接続します。

=== "Shellコマンド"

    ```text
    multipass shell ${INSTANCE}
    ```

=== "入力例"

    ```text
    multipass shell zevn
    ```

=== "出力例"

    ```text
    Last login: Tue Jun  9 15:10:19 2020 from 192.168.64.1
    ubuntu@zevn:~$
    ```

---

## 3. SignalFxエージェントのインストール

SignalFx AgentをVMにインストールします。Splunk UIからインストールコマンドをコピーして、VM内で直接実行するのが最も簡単です。

### 3.1 Splunk UI

Splunk UI の **Integrations** タブを開くと、最上段に SignalFx SmartAgent タイルが表示されます。

SmartAgent タイルをクリックして開きます...

![Integrations](../../images/oncall/integrations-tab.png)

...続いて、**Setup** タブを選択します...

![SmartAgent](../../images/oncall/smartagent-tile.png)

...そして、「Step 1」までスクロールダウンすると、LinuxとWindowsの両方にエージェントをインストールするためのコマンドが表示されます。Linux用のコマンドをコピーする必要があるので、一番上の **copy**{: .label-button .sfx-ui-button-blue} ボタンをクリックして、これらのコマンドをクリップボードに置いて、次のステップに備えます。

![SmartAgent Install](../../images/oncall/smartagent-install.png)

### 3.2 エージェントのインストール

Linux のインストールコマンドを VM シェルに貼り付けると、SignalFx エージェントがインストールされ、約 1 分後に以下のように出力されれば、インストールは完了です。

=== "出力例"

    ```text
    The SignalFx Agent has been successfully installed.

    Make sure that your system's time is relatively accurate or else datapoints may not be accepted.

    The agent's main configuration file is located at /etc/signalfx/agent.yaml.
    ```

---

## 4. SignalFxエージェントの確認

### 4.1 エージェントの状態

エージェントのインストールが完了したら、以下のコマンドを実行してステータスを確認してください。

=== "Shellコマンド"

    ```text
    sudo signalfx-agent status
    ```

=== "出力例"

    ```text
    SignalFx Agent version:           5.3.0
    Agent uptime:                     2m7s
    Observers active:                 host
    Active Monitors:                  9
    Configured Monitors:              9
    Discovered Endpoint Count:        6
    Bad Monitor Config:               None
    Global Dimensions:                {host: zevn}
    GlobalSpanTags:                   map[]
    Datapoints sent (last minute):    237
    Datapoints failed (last minute):  0
    Datapoints overwritten (total):   0
    Events Sent (last minute):        18
    Trace Spans Sent (last minute):   0
    Trace Spans overwritten (total):  0

    Additional status commands:

    signalfx-agent status config - show resolved config in use by agent
    signalfx-agent status endpoints - show discovered endpoints
    signalfx-agent status monitors - show active monitors
    signalfx-agent status all - show everything
    ```

### 4.2 Splunk UI の確認

Splunk の UI にアクセスし、**Infrastructure** タブをクリックします。続いて、**Hosts** セクションの **Hosts (Smart Agent / collectd)** をクリックします。

VM を見つけ、正しくレポートされていることを確認します。

![Infrastructure](../../images/oncall/sfx-infrastructure.png)

3分経っても表示されない場合は、Splunk チームに知らせてください。トラブルシューティングをお手伝いします。

---

Splunk 提供の EC2 インスタンスではなく Multipass VM を使用しているため、オプションモジュールの「ディテクターの作成」も完了する必要があります。 これにより、この VM のインシデント通知を確実に受け取ることができます。
