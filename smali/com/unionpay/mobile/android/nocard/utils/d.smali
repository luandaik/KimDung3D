.class public final Lcom/unionpay/mobile/android/nocard/utils/d;
.super Ljava/lang/Object;


# static fields
.field private static a:Lcom/unionpay/mobile/android/callback/UPAndroidCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/unionpay/mobile/android/nocard/utils/d;->a:Lcom/unionpay/mobile/android/callback/UPAndroidCallback;

    return-void
.end method

.method public static a(Landroid/content/Context;Lcom/unionpay/mobile/android/model/b;)V
    .locals 8

    const/4 v7, -0x1

    const-string v0, "uppay"

    const-string v1, "exit() +++"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->b(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "uppay"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "reqId="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget v2, v2, Lcom/unionpay/mobile/android/plugin/c;->a:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, p0

    check-cast v0, Lcom/unionpay/mobile/android/plugin/BaseActivity;

    iget-object v1, p1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/plugin/c;->f:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    const-string v1, "uppay"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "result="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/plugin/c;->f:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget v1, v1, Lcom/unionpay/mobile/android/plugin/c;->a:I

    sparse-switch v1, :sswitch_data_0

    :cond_0
    :goto_0
    iget-object v1, p1, Lcom/unionpay/mobile/android/model/b;->V:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p1, Lcom/unionpay/mobile/android/model/b;->V:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    iget-object v1, p1, Lcom/unionpay/mobile/android/model/b;->W:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p1, Lcom/unionpay/mobile/android/model/b;->W:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    iget-boolean v1, p1, Lcom/unionpay/mobile/android/model/b;->U:Z

    iget-object v2, p1, Lcom/unionpay/mobile/android/model/b;->V:Ljava/lang/String;

    iget-object v3, p1, Lcom/unionpay/mobile/android/model/b;->W:Ljava/lang/String;

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/Thread;

    new-instance v4, Lcom/unionpay/mobile/android/nocard/utils/e;

    invoke-direct {v4, v2, v3, p0}, Lcom/unionpay/mobile/android/nocard/utils/e;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    invoke-direct {v1, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    :cond_1
    invoke-virtual {v0}, Lcom/unionpay/mobile/android/plugin/BaseActivity;->c()V

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/plugin/BaseActivity;->finish()V

    const-string v0, "uppay"

    const-string v1, "exit() +++"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->b(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :sswitch_0
    const-string v1, "uppay"

    const-string v2, " notifyBrowserResult() +++ "

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->b(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    iget-object v1, p1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/plugin/c;->f:Ljava/lang/String;

    const-string v3, "fail"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v1, "1"

    :goto_1
    iget-object v3, p1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget v3, v3, Lcom/unionpay/mobile/android/plugin/c;->a:I

    packed-switch v3, :pswitch_data_0

    :goto_2
    :pswitch_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p1, Lcom/unionpay/mobile/android/model/b;->r:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "uppay"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "result URL= "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v3, 0x3e8

    iget-object v4, p1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget v4, v4, Lcom/unionpay/mobile/android/plugin/c;->a:I

    if-ne v3, v4, :cond_4

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v2, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v1, "android.intent.category.BROWSABLE"

    invoke-virtual {v2, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v0, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :goto_3
    const-string v1, "uppay"

    const-string v2, " notifyBrowserResult() --- "

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->b(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_2
    const-string v3, "cancel"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "-1"

    goto :goto_1

    :cond_3
    const-string v1, "0"

    goto :goto_1

    :pswitch_1
    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.UCMobile.PluginApp.ActivityState"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v3, "ActivityState"

    const-string v4, "inactive"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v3, "android.intent.category.DEFAULT"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v0, v2}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.unionpay.uppay.resultURL"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v3, "uppay"

    const-string v4, " uc browser "

    invoke-static {v3, v4}, Lcom/unionpay/mobile/android/utils/j;->b(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :pswitch_2
    new-instance v2, Landroid/content/Intent;

    iget-object v3, p1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/plugin/c;->b:Ljava/lang/String;

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v3, "uppay"

    const-string v4, " other browser "

    invoke-static {v3, v4}, Lcom/unionpay/mobile/android/utils/j;->b(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "uppay"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, " result Action="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget-object v5, v5, Lcom/unionpay/mobile/android/plugin/c;->b:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    :cond_4
    const-string v3, "ResultURL"

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "browser"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Landroid/content/Intent;->toURI()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0, v2}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_3

    :sswitch_1
    const-string v1, "uppay"

    const-string v2, "notifyAppResult() +++"

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->b(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const-string v1, "pay_result"

    iget-object v3, p1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/plugin/c;->f:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "result_data"

    iget-object v3, p1, Lcom/unionpay/mobile/android/model/b;->bi:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p1, Lcom/unionpay/mobile/android/model/b;->V:Ljava/lang/String;

    if-eqz v1, :cond_5

    iget-object v1, p1, Lcom/unionpay/mobile/android/model/b;->V:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_5

    iget-object v1, p1, Lcom/unionpay/mobile/android/model/b;->W:Ljava/lang/String;

    if-eqz v1, :cond_5

    iget-object v1, p1, Lcom/unionpay/mobile/android/model/b;->W:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_5

    iget-boolean v1, p1, Lcom/unionpay/mobile/android/model/b;->U:Z

    if-nez v1, :cond_5

    const-string v1, "notify_url"

    iget-object v3, p1, Lcom/unionpay/mobile/android/model/b;->V:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "notify_msg"

    iget-object v3, p1, Lcom/unionpay/mobile/android/model/b;->W:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_5
    iget-object v1, p1, Lcom/unionpay/mobile/android/model/b;->n:Ljava/lang/String;

    if-eqz v1, :cond_6

    const-string v1, "qn"

    iget-object v3, p1, Lcom/unionpay/mobile/android/model/b;->n:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "sid"

    iget-object v3, p1, Lcom/unionpay/mobile/android/model/b;->k:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "secret"

    iget-object v3, p1, Lcom/unionpay/mobile/android/model/b;->l:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_6
    sget-object v1, Lcom/unionpay/mobile/android/nocard/utils/d;->a:Lcom/unionpay/mobile/android/callback/UPAndroidCallback;

    if-eqz v1, :cond_7

    sget-object v1, Lcom/unionpay/mobile/android/nocard/utils/d;->a:Lcom/unionpay/mobile/android/callback/UPAndroidCallback;

    iget-object v3, p1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/plugin/c;->f:Ljava/lang/String;

    iget-object v4, p1, Lcom/unionpay/mobile/android/model/b;->n:Ljava/lang/String;

    iget-object v5, p1, Lcom/unionpay/mobile/android/model/b;->k:Ljava/lang/String;

    iget-object v6, p1, Lcom/unionpay/mobile/android/model/b;->l:Ljava/lang/String;

    invoke-interface {v1, v3, v4, v5, v6}, Lcom/unionpay/mobile/android/callback/UPAndroidCallback;->UPAndroidOK(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    move-object v1, v0

    check-cast v1, Lcom/unionpay/mobile/android/plugin/BaseActivity;

    invoke-virtual {v1, v7, v2}, Lcom/unionpay/mobile/android/plugin/BaseActivity;->setResult(ILandroid/content/Intent;)V

    const-string v1, "uppay"

    const-string v2, "notifyAppResult() ---"

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->b(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :sswitch_2
    const-string v1, "uppay"

    const-string v2, "notifyTencentJarResult() +++"

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->b(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string v2, "pay_result"

    iget-object v3, p1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/plugin/c;->f:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "tencentWID"

    iget-object v3, p1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/plugin/c;->h:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "tencentUID"

    iget-object v3, p1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/plugin/c;->g:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "bankInfo"

    iget-object v3, p1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/plugin/c;->j:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "cardType"

    iget-object v3, p1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/plugin/c;->k:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "cardNo"

    iget-object v3, p1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/plugin/c;->i:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v0, v7, v1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    const-string v1, "uppay"

    const-string v2, "notifyTencentJarResult() ---"

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->b(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0x3 -> :sswitch_2
        0x4 -> :sswitch_0
        0x5 -> :sswitch_1
        0x3e8 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static a(Lcom/unionpay/mobile/android/callback/UPAndroidCallback;)V
    .locals 0

    sput-object p0, Lcom/unionpay/mobile/android/nocard/utils/d;->a:Lcom/unionpay/mobile/android/callback/UPAndroidCallback;

    return-void
.end method
