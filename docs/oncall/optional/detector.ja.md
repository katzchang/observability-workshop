# SignalFx ディテクターの作成

## 目的

SignalFx 内に新しいディテクターを作成し、VictorOps をアラートの送信先として設定していきます。

VM にインストールされている Terraform を使ってディテクターを作成します。その準備として、Terraform の実行に必要な値を取得する必要があります。

---

## 1. 準備

これらの値は、時間短縮のためにモジュールの最初に講師から案内されるかもしれません。以下の説明では、自分で取得する方法を説明します。

### 1.1 変数ドキュメントを作成する

このモジュールの最後のステップで使用する3つの異なる値を、これからのいくつかのステップで収集しますので、お好みのテキストエディタで変数ドキュメントを作成することをお勧めします。

変数ドキュメントに以下の行を追加し、値を収集しながら適切な行に追加していきます。

=== "variables.txt"

    ``` text
    export ACCESS_TOKEN=
    export REALM=
    export SFXVOPSID=
    ```

### 1.2 SignalFx の Access Token を取得する

Splunk UIの右上にある **Settings** アイコンをクリックし、**Organization Settings → Access Tokens** を選択し、**Default** トークンを開き、**Show Token** をクリックすると、**Access Token** が表示されます。

![Access Token](../../images/oncall/m7-access-token.png)

**Copy**{: .label-button .sfx-ui-button-blue} ボタンをクリックしてクリップボードにコピーし、変数ドキュメントの `ACCESS_TOKEN` 行にペーストします。

=== "variables.txt"

    ``テキスト
    export ACCESS_TOKEN={==xxxx==}.
    エクスポート REALM=
    エクスポート SFXVOPSID=
    ```

### 1.3 SignalFx Realm を取得する

SplunkのUIで**設定**アイコンを再度クリックし、今度は**My Profile**を選択します。

Realm はページの中央にある Organizations セクションにあります。この例では**us1**ですが、あなたのRealmは**eu0**または他の多くのSignalFx Realmの1つかもしれません。

![Realm](../../images/oncall/m7-realm.png)

これを、変数ドキュメントの `REALM` 行にコピーします。

=== "variables.txt"

    ```text
    export ACCESS_TOKEN={==xxxx==}
    export REALM={==xxxx==}
    export SFXVOPSID=
    ```

### 1.4. VictorOps インテグレーション ID を取得する

Splunk UI で **Integrations** に移動し、検索機能を使って VictorOps Integration を探します。

**VictorOps-xxxx** の設定を開きます。複数の設定がある場合にどの設定をコピーすればいいか、講師から指示があります。

![VictorOps Integration](../../images/oncall/m7-sfx-vo-integration-id.png)

これを、変数ドキュメントの `SFXVOPSID` 行にコピーします。

=== "variables.txt"

    ```text
    export ACCESS_TOKEN={==xxxx==}
    export REALM={==xxxx==}
    export SFXVOPSID={==xxxx==}
    ```

---

## 2. 環境変数の作成

### 2.1 変数を VM にコピーする

さて、変数ドキュメントに必要な値が揃いました。次のステップで、 VM で実行するコマンドをコンパイルしていきます。

=== "例"

    ```text
    export ACCESS_TOKEN=by78voyt7b.....
    export REALM=us1
    export SFXVOPSID=EYierbGA4AA
    ```

**Getting Started/テスト環境の作成** モジュールで作成した VM のシェルセッションに戻り、以下のコマンドはそのインスタンス内で実行していきましょう。

変数のドキュメントにある3つのコマンドを、VM のシェルセッションに貼り付けてください。

## 3. Terraformの初期化と適用

VM 内で、Terraform の設定ファイルがある victorops フォルダに移ります（Ubuntuでログインしたままで、rootに昇格していないはずです）。

=== "ディレクトリの移動"

    ```text
    cd ~/workshop/victorops
    ```

これでTerraformの初期化ができます。

=== "Shellコマンド"

    ```text
    terraform init -upgrade
    ```

=== "出力例"

    ```text
    Initializing the backend...

    Initializing provider plugins...
    - Checking for available provider plugins...
    - Downloading plugin for provider "signalfx" (terraform-providers/signalfx) 4.21.0...

    The following providers do not have any version constraints in configuration,
    so the latest version was installed.

    To prevent automatic upgrades to new major versions that may contain breaking
    changes, it is recommended to add version = "..." constraints to the
    corresponding provider blocks in configuration, with the constraint strings
    suggested below.

    * provider.signalfx: version = "~> 4.21"

    Terraform has been successfully initialized!

    You may now begin working with Terraform. Try running "terraform plan" to see
    any changes that are required for your infrastructure. All Terraform commands
    should now work.

    If you ever set or change modules or backend configuration for Terraform,
    rerun this command to reinitialize your working directory. If you forget, other
    commands will detect it and remind you to do so if necessary.
    ```

以下のコードブロックをコピー＆ペーストして、VM で作成した変数を使って Terraform を実行することができます。プランの出力に問題がなければ、 _**yes**_ を入力して適用をコミットしてください。

=== "Shell Command"

    ```text
    terraform apply \
    -var="access_token=$ACCESS_TOKEN" \
    -var="realm=$REALM" \
    -var="sfx_prefix=${HOSTNAME}" \
    -var="sfx_vo_id=$SFXVOPSID" \
    -var="routing_key=${HOSTNAME}_PRI"
    ```

=== "Example Output"

    ```
    An execution plan has been generated and is shown below.
    Resource actions are indicated with the following symbols:
      + create

    Terraform will perform the following actions:

      # signalfx_detector.cpu_greater_90 will be created
      + resource "signalfx_detector" "cpu_greater_90" {
          + description       = "Alerts when CPU usage is greater than 90%"
          + id                = (known after apply)
          + max_delay         = 0
          + name              = "vmpe CPU greater than 90%"
          + program_text      = <<~EOT
                from signalfx.detectors.against_recent import against_recent
                A = data('cpu.utilization', filter=filter('host', 'vmpe*')).publish(label='A')
                detect(when(A > threshold(90))).publish('CPU utilization is greater than 90%')
            EOT
          + show_data_markers = true
          + time_range        = 3600
          + url               = (known after apply)

          + rule {
              + detect_label          = "CPU utilization is greater than 90%"
              + disabled              = false
              + notifications         = [
                  + "VictorOps,xxx,vmpe_pri",
                ]
              + parameterized_body    = <<~EOT
                    {{#if anomalous}}
                        Rule "{{{ruleName}}}" in detector "{{{detectorName}}}" triggered at {{timestamp}}.
                    {{else}}
                        Rule "{{{ruleName}}}" in detector "{{{detectorName}}}" cleared at {{timestamp}}.
                    {{/if}}

                    {{#if anomalous}}
                      Triggering condition: {{{readableRule}}}
                    {{/if}}

                    {{#if anomalous}}
                      Signal value: {{inputs.A.value}}
                    {{else}}
                      Current signal value: {{inputs.A.value}}
                    {{/if}}

                    {{#notEmpty dimensions}}
                      Signal details: {{{dimensions}}}
                    {{/notEmpty}}

                    {{#if anomalous}}
                      {{#if runbookUrl}}
                        Runbook: {{{runbookUrl}}}
                      {{/if}}
                      {{#if tip}}
                        Tip: {{{tip}}}
                      {{/if}}
                    {{/if}}
                EOT
              + parameterized_subject = "{{ruleSeverity}} Alert: {{{ruleName}}} ({{{detectorName}}})"
              + severity              = "Critical"
            }
        }

    Plan: 1 to add, 0 to change, 0 to destroy.

    Do you want to perform these actions in workspace "Workshop"?
      Terraform will perform the actions described above.
      Only 'yes' will be accepted to approve.

      Enter a value: yes

    signalfx_detector.cpu_greater_90: Creating...
    signalfx_detector.cpu_greater_90: Creation complete after 2s [id=EWHU-YAAAAA]

    Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
    ```

---

## 4. まとめ

VM 内で Terraform を実行することで、SignalFx 内に新しい Detector が作成され、特定の VM のCPU使用率が90%を超えた場合に VictorOps にアラートが送信されます。

Splunk UI で **Alerts → Detectors** を開いて全ての Detector を表示し、`INSTANCE` の値(VM の名前の最初の4文字)にマッチするものを探します。

**CPU Utilization is greater than 90%** をクリックして Alert Rule Editor を開くと、設定の詳細が表示されますので、あわせてご覧ください。

![Detector](../../images/oncall/detector.png)

VM を作成したときにランダムに割り当てられた名前の最初の4文字を使用して、VM を特別に監視するフィルタが使用されています。

![Detector Filter](../../images/oncall/detector-filter.png)

さらに、VictorOps インテグレーションを通じて **Recipient** が設定され、**Routing Key** が指定されています。 これにより、SignalFx のような監視システムは、VictorOps へのアラートのルーティングを知ることができ、正しいチームにルーティングされることが保証されます。

![Detector Recipients](../../images/oncall/detector-recipients.png)

---

これで、VictorOps と SignalFx の統合の設定が完了しました。

このモジュールの最後の部分では、SignalFx から VictorOps へのアラートの流れをテストし、VictorOps UI とモバイルアプリの両方でインシデントを管理する方法を確認します。
