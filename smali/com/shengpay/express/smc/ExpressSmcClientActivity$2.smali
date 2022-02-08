.class Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;
.super Ljava/lang/Object;
.source "ExpressSmcClientActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/shengpay/express/smc/ExpressSmcClientActivity;->receiptOrder()V
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
    iput-object p1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    .line 101
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "receiptOrder,start----->>>\n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 102
    new-instance v11, Ljava/lang/StringBuilder;

    iget-object v12, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v12}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$13(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Lcom/shengpay/express/smc/utils/ConfigUtil;

    move-result-object v12

    invoke-virtual {v12}, Lcom/shengpay/express/smc/utils/ConfigUtil;->getSmcServerUrl()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "expressSmc.htm?page=mobile"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 103
    .local v7, "payUrl":Ljava/lang/String;
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "receipt order payUrl="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " \n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 104
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$0(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "payUrl="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-virtual {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->getIntent()Landroid/content/Intent;

    move-result-object v11

    const-string v12, "orderInfo"

    invoke-virtual {v11, v12}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 106
    .local v5, "orderInfo":Ljava/lang/String;
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$0(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "orderInfo="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    const-string v8, ""

    .line 109
    .local v8, "result":Ljava/lang/String;
    :try_start_0
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-virtual {v11, v5}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->getOrderParaList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v6

    .line 110
    .local v6, "orderPara":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/message/BasicNameValuePair;>;"
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "orderPara="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 114
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$14(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Lcom/shengpay/express/smc/http/SimpleHttpClient;

    move-result-object v11

    invoke-virtual {v11, v7, v6}, Lcom/shengpay/express/smc/http/SimpleHttpClient;->sendPostStringForm(Ljava/lang/String;Ljava/util/List;)Ljava/lang/Object;

    move-result-object v8

    .line 115
    .local v8, "result":Ljava/lang/Object;
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "receipt order result. \n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 116
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$0(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "result="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    new-instance v2, Lorg/json/JSONObject;

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v2, v11}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 118
    .local v2, "jo":Lorg/json/JSONObject;
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "receipt order jo. \n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 119
    const-string v11, "transInfo"

    invoke-virtual {v2, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 120
    .local v10, "transInfo":Ljava/lang/String;
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "receipt order transInfo="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " \n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 121
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$0(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "transInfo="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 123
    .local v3, "joTransInfo":Lorg/json/JSONObject;
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "receipt order joTransInfo. \n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 124
    const-string v11, "returnCode"

    invoke-virtual {v3, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 125
    .local v9, "returnCode":Ljava/lang/String;
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "receipt order returnCode="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " \n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 126
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$0(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "returnCode="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    const-string v11, "SUCCESS"

    invoke-virtual {v9, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 128
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$0(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "receipt order SUCCESS,send message."

    invoke-static {v11, v12}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    const-string v12, "sessionToken"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$15(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Ljava/lang/String;)V

    .line 130
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$16(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Landroid/content/SharedPreferences;

    move-result-object v11

    invoke-interface {v11}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 131
    .local v1, "et":Landroid/content/SharedPreferences$Editor;
    const-string v11, "result"

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v1, v11, v12}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 132
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 133
    new-instance v4, Landroid/os/Message;

    invoke-direct {v4}, Landroid/os/Message;-><init>()V

    .line 134
    .local v4, "msg":Landroid/os/Message;
    const/16 v11, 0x3eb

    iput v11, v4, Landroid/os/Message;->what:I

    .line 135
    iput-object v8, v4, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 136
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$17(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Landroid/os/Handler;

    move-result-object v11

    invoke-virtual {v11, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 137
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "receipt order SUCCESS,send message. \n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 146
    .end local v1    # "et":Landroid/content/SharedPreferences$Editor;
    :goto_0
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$0(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "result="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 169
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "<<<----------receiptOrder,end \n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 171
    .end local v2    # "jo":Lorg/json/JSONObject;
    .end local v3    # "joTransInfo":Lorg/json/JSONObject;
    .end local v6    # "orderPara":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v8    # "result":Ljava/lang/Object;
    .end local v9    # "returnCode":Ljava/lang/String;
    .end local v10    # "transInfo":Ljava/lang/String;
    :goto_1
    return-void

    .line 139
    .end local v4    # "msg":Landroid/os/Message;
    .restart local v2    # "jo":Lorg/json/JSONObject;
    .restart local v3    # "joTransInfo":Lorg/json/JSONObject;
    .restart local v6    # "orderPara":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/message/BasicNameValuePair;>;"
    .restart local v8    # "result":Ljava/lang/Object;
    .restart local v9    # "returnCode":Ljava/lang/String;
    .restart local v10    # "transInfo":Ljava/lang/String;
    :cond_0
    :try_start_1
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$0(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "receipt order fail,send message."

    invoke-static {v11, v12}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    new-instance v4, Landroid/os/Message;

    invoke-direct {v4}, Landroid/os/Message;-><init>()V

    .line 141
    .restart local v4    # "msg":Landroid/os/Message;
    const/16 v11, 0x3e9

    iput v11, v4, Landroid/os/Message;->what:I

    .line 142
    iput-object v8, v4, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 143
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$17(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Landroid/os/Handler;

    move-result-object v11

    invoke-virtual {v11, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 144
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "receipt order fail,send message. \n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 147
    .end local v2    # "jo":Lorg/json/JSONObject;
    .end local v3    # "joTransInfo":Lorg/json/JSONObject;
    .end local v4    # "msg":Landroid/os/Message;
    .end local v6    # "orderPara":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v8    # "result":Ljava/lang/Object;
    .end local v9    # "returnCode":Ljava/lang/String;
    .end local v10    # "transInfo":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 148
    .local v0, "e":Lorg/apache/http/client/ClientProtocolException;
    :try_start_2
    invoke-virtual {v0}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    .line 149
    new-instance v4, Landroid/os/Message;

    invoke-direct {v4}, Landroid/os/Message;-><init>()V

    .line 150
    .restart local v4    # "msg":Landroid/os/Message;
    const/16 v11, 0x3e9

    iput v11, v4, Landroid/os/Message;->what:I

    .line 151
    const-string v11, "\u521b\u5efa\u8ba2\u5355\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5\u3002"

    iput-object v11, v4, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 152
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$17(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Landroid/os/Handler;

    move-result-object v11

    invoke-virtual {v11, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 153
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "ClientProtocol Exception. \n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 169
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "<<<----------receiptOrder,end \n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 154
    .end local v0    # "e":Lorg/apache/http/client/ClientProtocolException;
    .end local v4    # "msg":Landroid/os/Message;
    :catch_1
    move-exception v0

    .line 155
    .local v0, "e":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 156
    new-instance v4, Landroid/os/Message;

    invoke-direct {v4}, Landroid/os/Message;-><init>()V

    .line 157
    .restart local v4    # "msg":Landroid/os/Message;
    const/16 v11, 0x3e9

    iput v11, v4, Landroid/os/Message;->what:I

    .line 158
    const-string v11, "\u521b\u5efa\u8ba2\u5355\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5\u3002"

    iput-object v11, v4, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 159
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$17(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Landroid/os/Handler;

    move-result-object v11

    invoke-virtual {v11, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 160
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "IO Exception. \n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 169
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "<<<----------receiptOrder,end \n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_1

    .line 161
    .end local v0    # "e":Ljava/io/IOException;
    .end local v4    # "msg":Landroid/os/Message;
    :catch_2
    move-exception v0

    .line 162
    .local v0, "e":Lorg/json/JSONException;
    :try_start_4
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 163
    new-instance v4, Landroid/os/Message;

    invoke-direct {v4}, Landroid/os/Message;-><init>()V

    .line 164
    .restart local v4    # "msg":Landroid/os/Message;
    const/16 v11, 0x3e9

    iput v11, v4, Landroid/os/Message;->what:I

    .line 165
    iput-object v8, v4, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 166
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$17(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Landroid/os/Handler;

    move-result-object v11

    invoke-virtual {v11, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 167
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "JSON Exception. \n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 169
    iget-object v11, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v11}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "<<<----------receiptOrder,end \n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_1

    .line 168
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v4    # "msg":Landroid/os/Message;
    :catchall_0
    move-exception v11

    .line 169
    iget-object v12, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v12}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string v13, "<<<----------receiptOrder,end \n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 170
    throw v11
.end method
