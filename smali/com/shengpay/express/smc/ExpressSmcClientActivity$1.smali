.class Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;
.super Landroid/os/Handler;
.source "ExpressSmcClientActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/shengpay/express/smc/ExpressSmcClientActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;


# direct methods
.method constructor <init>(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    .line 226
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v5, 0x1

    .line 230
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$0(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "msg.what="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, p1, Landroid/os/Message;->what:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$1(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Landroid/os/Message;)V

    .line 232
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 278
    :cond_0
    :goto_0
    return-void

    .line 234
    :pswitch_0
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "handler,receive msg:EXIT_SMC_CLIENT. \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 235
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2, p1}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$1(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Landroid/os/Message;)V

    .line 236
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 237
    .local v1, "msgStr":Ljava/lang/String;
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$0(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "msgStr="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-virtual {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->finish()V

    goto :goto_0

    .line 241
    .end local v1    # "msgStr":Ljava/lang/String;
    :pswitch_1
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "handler,receive msg:LOAD_WEBVIEW_FINISH. \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 242
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$3(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Ljava/lang/Boolean;)V

    .line 243
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$0(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "LOAD_WEBVIEW_FINISH,isLoadWebViewReady="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v4}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$4(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",isReceiptOrderReady="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v4}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$5(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$4(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$5(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 245
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$6(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)V

    goto/16 :goto_0

    .line 249
    :pswitch_2
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "handler,receive msg:RECEIPT_ORDER_FINISH. \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 250
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$7(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Ljava/lang/Boolean;)V

    .line 251
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$0(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "RECEIPT_ORDER_FINISH,isLoadWebViewReady="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v4}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$4(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",isReceiptOrderReady="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v4}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$5(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$4(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$5(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 254
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$6(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)V

    goto/16 :goto_0

    .line 258
    :pswitch_3
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "handler,receive msg:RE_LOAD_WEB_VIEW. \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 259
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$0(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "RE_LOAD_WEB_VIEW"

    invoke-static {v2, v3}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$8(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Ljava/lang/Boolean;)V

    .line 261
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$9(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)V

    goto/16 :goto_0

    .line 264
    :pswitch_4
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "handler,receive msg:GOTO_WALLET_RESULT. \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 265
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$0(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "GOTO_WALLET_RESULT"

    invoke-static {v2, v3}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$10(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Ljava/lang/Boolean;)V

    .line 267
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/Bundle;

    .line 268
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    const-string v3, "errCode"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$11(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Ljava/lang/String;)V

    .line 269
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    const-string v3, "errMessage"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$12(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Ljava/lang/String;)V

    .line 270
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$9(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)V

    goto/16 :goto_0

    .line 273
    .end local v0    # "bundle":Landroid/os/Bundle;
    :pswitch_5
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v2}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_0

    .line 232
    :pswitch_data_0
    .packed-switch 0x3e9
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_5
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
