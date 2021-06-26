# チーム

## 目的

このモジュールでは、ユーザーをチームに追加することで、チーム設定の最初のステップを完了させていきます。

---

## ステップ 1. チームを検索する

メインツールバーの **Teams** タブに移動してください。ワークショップの事前設定の一部として、あなたのためにチームが作成され、Eメールでチーム名が通知されているはずです。

事前に設定されたチームが見つかった場合は、次の **ステップ 2** は必要ありません。[**ステップ 3. チームを設定する**](../team/#3)。

割り当てられたチームが見つからない場合は、新しいチームを作成する必要があります。**ステップ 2. チームを作成する** に進みましょう。

## ステップ 2. チームを作成する

ワークショップのEメールに記載されている、事前に割り当てられたチームが **見つからない** 場合のみ、このステップを完了してください。

**Add Team** を選択し、割り当てられたチーム名を入力します。これは通常 "参加者ID Workshop"というフォーマットになります。そして、**Add Team** をクリックすると保存されます。

## 3. チームを設定する

次に、他のユーザーをチームに追加する必要があります。 Splunk が提供する環境を使ってこのワークショップを実施する場合、以下のアカウントがテスト用に利用できます。

自分の環境でこのワークショップを実施する場合は、以下の表の代わりに使用できるユーザー名のリストが提供されています。

これらのユーザーは、通話中に通知を受け取らないダミーのアカウントです。

| Name                 | Username     | Shift      |
| -------------------- | ------------ | ---------- |
| Duane Chow           | duanechow    | Europe     |
| Steven Gomez         | gomez        | Europe     |
| Walter White         | heisenberg   | Europe     |
| Jim Halpert          | jimhalpert   | Asia       |
| Lydia Rodarte-Quayle | lydia        | Asia       |
| Marie Schrader       | marie        | Asia       |
| Maximo Arciniega     | maximo       | West Coast |
| Michael Scott        | michaelscott | West Coast |
| Tuco Salamanca       | tuco         | West Coast |
| Jack Welker          | jackwelker   | 24/7       |
| Hank Schrader        | hank         | 24/7       |
| Pam Beesly           | pambeesly    | 24/7       |

上記のリストまたは提供された代替リストのいずれかを使用して、ユーザーをチームに追加します。**Shift** 列の値は、今のところ無視して構いませんが、この後のステップで必要になります。

右側の　**Invite User**{: .label-button .vo-ui-button}　ボタンをクリックして、ユーザー名を入力するか（これでリストがフィルタリングされます）、ダイアログボックスにコピー＆ペーストします。

すべてのユーザーがリストに追加されたら、**Add User** ボタンをクリックします。

![Add Team Members](../../images/oncall/add-team-members.png)

チームメンバーをチーム管理者にするには、右側の列にある :fontawesome-regular-edit: アイコンをクリックして、任意のユーザーを選び、管理者にします。

![Add Admin](../../images/oncall/team-admin.png)

!!! Tips
    大規模なチーム管理では、APIを使ってこのプロセスを効率化しましょう。

---
次のモジュールは、「[ローテーションを設定する](../rotations/)」です。
