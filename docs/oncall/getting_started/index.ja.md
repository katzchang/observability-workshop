# 初期設定

## 目的

このモジュールでは、Splunk On-Call UI (旧VictorOps)、Splunk Infrastructure Monitoring UI (旧SignalFx)、およびお客様に割り当てられたEC2インスタンスへのアクセスを確認していきます。

各プラットフォームへのアクセス権を取得したら、ワークショップの間、プラットフォームを切り替えて使用するため、ワークショップの指示に合わせて開いておいてください。

## 1. Splunk On-Call ログインの有効化

Splunk On-Call アカウントを有効化するための招待状がEメールで届いているはずです。有効化していない場合は、 _Activate Account_ リンクをクリックして、画面の指示に従って有効化してください。

招待状を受け取っていない場合は、別の組織にリンクされた Splunk On-Call ログインを既にお持ちであることが考えられます。

その場合は、その組織にログインし、左上のユーザー名の横にある組織のドロップダウンを使って、Observability Workshop の組織に切り替えてください。

![Switch Org](../../images/oncall/switch-org.png){: .center}

!!! 注意
    Observability Workshop の名前の横に Organisation のドロップダウンメニュー項目が表示されていなくても問題ありません。

    パスワードを忘れてしまった場合は、[sign-in](https://portal.victorops.com/membership/#/){: target=_blank} ページにアクセスし、パスワード再発行のリンクを使ってパスワードをリセットしてください。

    ![Reset Pwd](../../images/oncall/reset-password.png){: .center}

---

## 2. Splunk Infrastructure Monitoring ログインの有効化

Splunk Infrastructure Monitoring - Observability Workshop への招待状を受け取っているはずです。 まだ参加していない場合は、 **JOIN NOW**{: .label-button .sfx-ui-button-black} ボタンをクリックして、画面の指示に従ってパスワードを設定し、ログインを有効化してください。

## 3. EC2 インスタンスへのアクセス

Splunk は専用の EC2 インスタンスを提供しています。このワークショップでは、入門デモで講師が行ったのと同じ方法で、インシデントをトリガーすることができます。この VM には Splunk Infrastructure Monitoring が導入されており、関連する Detector が設定されています。Detector はアラートを Splunk On-Call に渡し、Splunk On-Call はインシデントを作成し、オンコールユーザーにページを送ります。

今回のワークショップの詳細をお知らせするウェルカムメールには、割り当てられたEC2インスタンスへのアクセス方法が記載されています。

### SSH (Mac OS/Linuxの場合)

通常、Mac や Linux から SSH を使ってワークショップに接続することができます。

SSH を使用するには、ターミナルを開き、`ssh ubuntu@x.x.x.x`（x.x.x.x をウェルカムメールに記載されている IP アドレスに置き換えてください）と入力します。

![ssh login](../../images/intro/ssh-1.png)

**`Are you sure you want to continue connecting (yes/no/[fingerprint])?`**  と画面に表示されますので、そのまま **`yes`** と入力してください。

![ssh password](../../images/intro/ssh-2.png)

続いて、ウェルカムメールに記載されているパスワードを入力してください。

ログインに成功すると、Splunk のロゴと Linux のプロンプトが表示されます。

![ssh connected](../../images/intro/ssh-3.png)

ここまでできると、[次のステップに行く](../../oncall/getting_started/user_profile/)準備ができています。講師からの指示をお待ちください。

---

### Putty (Windows の場合)

ssh がプリインストールされていない場合や、Windows システムをお使いの場合は、putty をインストールするのが最善の方法です。ダウンロードは [こちら](https://www.putty.org/){: target=_blank}.

!!! 重要
    Puttyがインストールできない場合は、[ブラウザを使ってssh接続する](../getting_started/#web-browser-all) をお試しください。

Puttyを開き、**Host Name (or IP address)** の欄に、ウェルカムメールに記載されているIPアドレスを入力してください。

名前を入力して **Save** を押します。このとき、オプションで設定を保存することができます。

![putty-2](../../images/intro/putty-settings.png)

インスタンスにログインするには、上記のように **Open** ボタンをクリックします。

初めてEC2インスタンスに接続する場合は、セキュリティダイアログが表示されますので、**Yes** をクリックしてください。

![putty-3](../../images/intro/putty-security.png)

接続が完了したら、 ユーザー名 **ubuntu** として、ウェルカムメールに記載されているパスワードを使ってログインします。

接続に成功すると、以下のような画面が表示されます。

![putty-4](../../images/intro/putty-loggedin.png)

ここまでできると、[次のステップに行く](../../oncall/getting_started/user_profile/)準備ができています。講師からの指示をお待ちください。

---

### ブラウザを使ってssh接続する

SSH(Port22)が使えない、Puttyがインストールできないという方は、Webブラウザでワークショップのインスタンスに接続することができます。

!!! 注意
    ここでは、6501番ポートへのアクセスが皆様の環境でのファイアウォールで制限されていないことを前提としています。

Webブラウザを開き、**http://X.X.X.X:6501**（X.X.X.Xはウェルカムメールに記載されているIPアドレス）と入力します。

![http-6501](../../images/intro/shellinabox-url.png)

接続が完了したら、 ユーザー名 **ubuntu** として、ウェルカムメールに記載されているパスワードを使ってログインします。

![http-connect](../../images/intro/shellinabox-connect.png)

接続に成功すると、以下のような画面が表示されます:

![web login](../../images/intro/shellinabox-login.png)

---

### ブラウザでコピー＆ペーストをする

通常の SSH を使用する場合とは異なり、ブラウザセッションを使用する場合、*コピー＆ペースト* には追加の手順が必要となります。これは、クロスブラウザの制限によるものです。

ワークショップでターミナルにペーストする必要があるときは、以下のようにしてください。

*コピーしたいものを通常通りをコピーし、ウェブターミナルにペーストする準備をして* 以下のように *ブラウザからのペースト* を使ってください:

![web paste 1](../../images/intro/shellinabox-paste-browser.png)

すると、ウェブターミナルにペーストするテキストを入力するダイアログボックスが表示されます。

![web paste 3](../../images/intro/shellinabox-example-1.png)

表示されているテキストボックスにテキストをペーストし、**OK** を押してコピー＆ペースト処理を完了します。

!!! 注意
    通常のSSH接続とは異なり、Webブラウザには60秒のタイムアウトがあります。接続が解除されると、Webターミナルの中央に **Connect** ボタンが表示されます。

    この **Connect** ボタンをクリックするだけで、再接続され、次の操作が可能になります。

    ![web reconnect](../../images/intro/shellinabox-reconnect.png)

ここまでできると、[次のステップに行く](../../oncall/getting_started/user_profile/)準備ができています。講師からの指示をお待ちください。

[^1]: [Download Putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/){: target=_blank}
