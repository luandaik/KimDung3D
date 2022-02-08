.class Lcom/heitao/request/HTBaseLoginVerify$1;
.super Ljava/lang/Object;
.source "HTBaseLoginVerify.java"

# interfaces
.implements Lcom/heitao/listener/HTRequestListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/request/HTBaseLoginVerify;->doLoginVerify(Ljava/util/Map;Lcom/heitao/listener/HTLoginVerifyListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/request/HTBaseLoginVerify;

.field final synthetic val$finalRequestUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/heitao/request/HTBaseLoginVerify;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 93
    iput-object p1, p0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iput-object p2, p0, Lcom/heitao/request/HTBaseLoginVerify$1;->val$finalRequestUrl:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "error"    # Ljava/lang/Throwable;

    .prologue
    .line 221
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u767b\u5f55\u9a8c\u8bc1\u8bf7\u6c42\u5931\u8d25\uff0cerror="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 222
    iget-object v0, p0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v1, p0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v1}, Lcom/heitao/request/HTBaseLoginVerify;->access$000(Lcom/heitao/request/HTBaseLoginVerify;)I

    move-result v1

    iget-object v2, p0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v2}, Lcom/heitao/request/HTBaseLoginVerify;->access$100(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v3}, Lcom/heitao/request/HTBaseLoginVerify;->access$200(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/heitao/request/HTBaseLoginVerify;->access$900(Lcom/heitao/request/HTBaseLoginVerify;ILjava/lang/String;Ljava/lang/String;)V

    .line 223
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 20
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 98
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "\u767b\u5f55\u9a8c\u8bc1\u8fd4\u56de\u6210\u529f\uff0cresponse="

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 99
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-virtual {v3}, Lcom/heitao/request/HTBaseLoginVerify;->doCancelProgressDialog()V

    .line 102
    :try_start_0
    new-instance v14, Lorg/json/JSONObject;

    move-object/from16 v0, p1

    invoke-direct {v14, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 105
    .local v14, "responseObject":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    const-string v17, "errno"

    move-object/from16 v0, v17

    invoke-static {v14, v0}, Lcom/heitao/common/HTJSONHelper;->getInt(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    invoke-static {v3, v0}, Lcom/heitao/request/HTBaseLoginVerify;->access$002(Lcom/heitao/request/HTBaseLoginVerify;I)I

    .line 106
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    const-string v17, "title"

    move-object/from16 v0, v17

    invoke-static {v14, v0}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v3, v0}, Lcom/heitao/request/HTBaseLoginVerify;->access$102(Lcom/heitao/request/HTBaseLoginVerify;Ljava/lang/String;)Ljava/lang/String;

    .line 107
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    const-string v17, "errmsg"

    move-object/from16 v0, v17

    invoke-static {v14, v0}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v3, v0}, Lcom/heitao/request/HTBaseLoginVerify;->access$202(Lcom/heitao/request/HTBaseLoginVerify;Ljava/lang/String;)Ljava/lang/String;

    .line 108
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v17, v0

    const-string v3, "isforce"

    invoke-static {v14, v3}, Lcom/heitao/common/HTJSONHelper;->getInt(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v3

    const/16 v18, 0x1

    move/from16 v0, v18

    if-ne v3, v0, :cond_1

    const/4 v3, 0x1

    :goto_0
    move-object/from16 v0, v17

    invoke-static {v0, v3}, Lcom/heitao/request/HTBaseLoginVerify;->access$302(Lcom/heitao/request/HTBaseLoginVerify;Z)Z

    .line 109
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    const-string v17, "updateurl"

    move-object/from16 v0, v17

    invoke-static {v14, v0}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v3, v0}, Lcom/heitao/request/HTBaseLoginVerify;->access$402(Lcom/heitao/request/HTBaseLoginVerify;Ljava/lang/String;)Ljava/lang/String;

    .line 110
    const-string v3, "is_update_by_self"

    invoke-static {v14, v3}, Lcom/heitao/common/HTJSONHelper;->getInt(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v3

    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v3, v0, :cond_2

    const/4 v13, 0x1

    .line 111
    .local v13, "isUpdateBySelf":Z
    :goto_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    const-string v17, "open_type"

    move-object/from16 v0, v17

    invoke-static {v14, v0}, Lcom/heitao/common/HTJSONHelper;->getInt(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    invoke-static {v3, v0}, Lcom/heitao/request/HTBaseLoginVerify;->access$502(Lcom/heitao/request/HTBaseLoginVerify;I)I

    .line 112
    const-string v3, "vname"

    invoke-static {v14, v3}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 113
    .local v16, "versionName":Ljava/lang/String;
    const-string v3, "vcode"

    invoke-static {v14, v3}, Lcom/heitao/common/HTJSONHelper;->getInt(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v15

    .line 115
    .local v15, "versionCode":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v3}, Lcom/heitao/request/HTBaseLoginVerify;->access$000(Lcom/heitao/request/HTBaseLoginVerify;)I

    move-result v3

    if-nez v3, :cond_4

    const-string v3, "errno"

    invoke-virtual {v14, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 117
    const-string v3, "data"

    invoke-static {v14, v3}, Lcom/heitao/common/HTJSONHelper;->getJSONObject(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 118
    .local v4, "dataObject":Lorg/json/JSONObject;
    if-eqz v4, :cond_0

    const-string v3, "data"

    invoke-virtual {v14, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 121
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    new-instance v17, Lcom/heitao/model/HTUser;

    invoke-direct/range {v17 .. v17}, Lcom/heitao/model/HTUser;-><init>()V

    move-object/from16 v0, v17

    iput-object v0, v3, Lcom/heitao/request/HTBaseLoginVerify;->mUser:Lcom/heitao/model/HTUser;

    .line 122
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify;->mUser:Lcom/heitao/model/HTUser;

    const-string v17, "uid"

    move-object/from16 v0, v17

    invoke-static {v4, v0}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v3, Lcom/heitao/model/HTUser;->userId:Ljava/lang/String;

    .line 123
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify;->mUser:Lcom/heitao/model/HTUser;

    const-string v17, "puid"

    move-object/from16 v0, v17

    invoke-static {v4, v0}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v3, Lcom/heitao/model/HTUser;->platformUserId:Ljava/lang/String;

    .line 124
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify;->mUser:Lcom/heitao/model/HTUser;

    const-string v17, "pfid"

    move-object/from16 v0, v17

    invoke-static {v4, v0}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v3, Lcom/heitao/model/HTUser;->platformId:Ljava/lang/String;

    .line 125
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify;->mUser:Lcom/heitao/model/HTUser;

    const-string v17, "token"

    move-object/from16 v0, v17

    invoke-static {v4, v0}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v3, Lcom/heitao/model/HTUser;->token:Ljava/lang/String;

    .line 126
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify;->mUser:Lcom/heitao/model/HTUser;

    const-string v17, "custom"

    move-object/from16 v0, v17

    invoke-static {v4, v0}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v3, Lcom/heitao/model/HTUser;->custom:Ljava/lang/String;

    .line 127
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v3

    const-string v17, "anti_addiction"

    move-object/from16 v0, v17

    invoke-static {v4, v0}, Lcom/heitao/common/HTJSONHelper;->getInt(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    iput v0, v3, Lcom/heitao/common/HTDataCenter;->mIsAntiAddiction:I

    .line 130
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    const-string v17, "sdk"

    move-object/from16 v0, v17

    invoke-static {v4, v0}, Lcom/heitao/common/HTJSONHelper;->getJSONObject(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v3, v0}, Lcom/heitao/request/HTBaseLoginVerify;->access$602(Lcom/heitao/request/HTBaseLoginVerify;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 132
    const-string v3, "activate"

    invoke-static {v4, v3}, Lcom/heitao/common/HTJSONHelper;->getJSONObject(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    .line 133
    .local v10, "activateObject":Lorg/json/JSONObject;
    if-eqz v10, :cond_3

    .line 135
    const-string v3, "status"

    invoke-static {v10, v3}, Lcom/heitao/common/HTJSONHelper;->getInt(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v11

    .line 136
    .local v11, "activateStatus":I
    const-string v3, "title"

    invoke-static {v10, v3}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 137
    .local v5, "activateTitle":Ljava/lang/String;
    const-string v3, "ok_btn_text"

    invoke-static {v10, v3}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 138
    .local v7, "activateConfirm":Ljava/lang/String;
    const-string v3, "cancel_btn_text"

    invoke-static {v10, v3}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 139
    .local v8, "activateOtherButton":Ljava/lang/String;
    const-string v3, "message"

    invoke-static {v10, v3}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 140
    .local v6, "activateMessage":Ljava/lang/String;
    const-string v3, "url"

    invoke-static {v10, v3}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 142
    .local v9, "activateURL":Ljava/lang/String;
    const/4 v3, 0x1

    if-ne v3, v11, :cond_3

    .line 145
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static/range {v3 .. v9}, Lcom/heitao/request/HTBaseLoginVerify;->access$700(Lcom/heitao/request/HTBaseLoginVerify;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    .end local v4    # "dataObject":Lorg/json/JSONObject;
    .end local v5    # "activateTitle":Ljava/lang/String;
    .end local v6    # "activateMessage":Ljava/lang/String;
    .end local v7    # "activateConfirm":Ljava/lang/String;
    .end local v8    # "activateOtherButton":Ljava/lang/String;
    .end local v9    # "activateURL":Ljava/lang/String;
    .end local v10    # "activateObject":Lorg/json/JSONObject;
    .end local v11    # "activateStatus":I
    .end local v13    # "isUpdateBySelf":Z
    .end local v14    # "responseObject":Lorg/json/JSONObject;
    .end local v15    # "versionCode":I
    .end local v16    # "versionName":Ljava/lang/String;
    :cond_0
    :goto_2
    return-void

    .line 108
    .restart local v14    # "responseObject":Lorg/json/JSONObject;
    :cond_1
    const/4 v3, 0x0

    goto/16 :goto_0

    .line 110
    :cond_2
    const/4 v13, 0x0

    goto/16 :goto_1

    .line 151
    .restart local v4    # "dataObject":Lorg/json/JSONObject;
    .restart local v10    # "activateObject":Lorg/json/JSONObject;
    .restart local v13    # "isUpdateBySelf":Z
    .restart local v15    # "versionCode":I
    .restart local v16    # "versionName":Ljava/lang/String;
    :cond_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/heitao/request/HTBaseLoginVerify;->access$600(Lcom/heitao/request/HTBaseLoginVerify;)Lorg/json/JSONObject;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Lcom/heitao/request/HTBaseLoginVerify;->parseCompleted(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 207
    .end local v4    # "dataObject":Lorg/json/JSONObject;
    .end local v10    # "activateObject":Lorg/json/JSONObject;
    .end local v13    # "isUpdateBySelf":Z
    .end local v14    # "responseObject":Lorg/json/JSONObject;
    .end local v15    # "versionCode":I
    .end local v16    # "versionName":Ljava/lang/String;
    :catch_0
    move-exception v12

    .line 210
    .local v12, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "\u767b\u5f55\u9a8c\u8bc1\u89e3\u6790\u5931\u8d25\uff0cerror="

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v12}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 211
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/heitao/request/HTBaseLoginVerify;->access$000(Lcom/heitao/request/HTBaseLoginVerify;)I

    move-result v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/heitao/request/HTBaseLoginVerify;->access$100(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/heitao/request/HTBaseLoginVerify;->access$200(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;

    move-result-object v19

    move/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-static {v3, v0, v1, v2}, Lcom/heitao/request/HTBaseLoginVerify;->access$900(Lcom/heitao/request/HTBaseLoginVerify;ILjava/lang/String;Ljava/lang/String;)V

    .line 213
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "requestUrl="

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->val$finalRequestUrl:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 154
    .end local v12    # "e":Ljava/lang/Exception;
    .restart local v13    # "isUpdateBySelf":Z
    .restart local v14    # "responseObject":Lorg/json/JSONObject;
    .restart local v15    # "versionCode":I
    .restart local v16    # "versionName":Ljava/lang/String;
    :cond_4
    :try_start_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v3}, Lcom/heitao/request/HTBaseLoginVerify;->access$000(Lcom/heitao/request/HTBaseLoginVerify;)I

    move-result v3

    const/16 v17, 0x7532

    move/from16 v0, v17

    if-ne v3, v0, :cond_7

    const-string v3, "errno"

    invoke-virtual {v14, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_7

    .line 156
    const-string v3, "data"

    invoke-static {v14, v3}, Lcom/heitao/common/HTJSONHelper;->getJSONObject(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 157
    .restart local v4    # "dataObject":Lorg/json/JSONObject;
    if-eqz v4, :cond_0

    const-string v3, "data"

    invoke-virtual {v14, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 160
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    new-instance v17, Lcom/heitao/model/HTUser;

    invoke-direct/range {v17 .. v17}, Lcom/heitao/model/HTUser;-><init>()V

    move-object/from16 v0, v17

    iput-object v0, v3, Lcom/heitao/request/HTBaseLoginVerify;->mUser:Lcom/heitao/model/HTUser;

    .line 161
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify;->mUser:Lcom/heitao/model/HTUser;

    const-string v17, "uid"

    move-object/from16 v0, v17

    invoke-static {v4, v0}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v3, Lcom/heitao/model/HTUser;->userId:Ljava/lang/String;

    .line 162
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify;->mUser:Lcom/heitao/model/HTUser;

    const-string v17, "puid"

    move-object/from16 v0, v17

    invoke-static {v4, v0}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v3, Lcom/heitao/model/HTUser;->platformUserId:Ljava/lang/String;

    .line 163
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify;->mUser:Lcom/heitao/model/HTUser;

    const-string v17, "pfid"

    move-object/from16 v0, v17

    invoke-static {v4, v0}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v3, Lcom/heitao/model/HTUser;->platformId:Ljava/lang/String;

    .line 164
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify;->mUser:Lcom/heitao/model/HTUser;

    const-string v17, "token"

    move-object/from16 v0, v17

    invoke-static {v4, v0}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v3, Lcom/heitao/model/HTUser;->token:Ljava/lang/String;

    .line 165
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify;->mUser:Lcom/heitao/model/HTUser;

    const-string v17, "custom"

    move-object/from16 v0, v17

    invoke-static {v4, v0}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v3, Lcom/heitao/model/HTUser;->custom:Ljava/lang/String;

    .line 168
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    const-string v17, "sdk"

    move-object/from16 v0, v17

    invoke-static {v4, v0}, Lcom/heitao/common/HTJSONHelper;->getJSONObject(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v3, v0}, Lcom/heitao/request/HTBaseLoginVerify;->access$602(Lcom/heitao/request/HTBaseLoginVerify;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 170
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/heitao/request/HTBaseLoginVerify;->access$200(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;

    move-result-object v17

    const-string v18, "|"

    const-string v19, "\n"

    invoke-virtual/range {v17 .. v19}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v3, v0}, Lcom/heitao/request/HTBaseLoginVerify;->access$202(Lcom/heitao/request/HTBaseLoginVerify;Ljava/lang/String;)Ljava/lang/String;

    .line 172
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    new-instance v17, Lcom/heitao/model/HTAppUpdateInfo;

    invoke-direct/range {v17 .. v17}, Lcom/heitao/model/HTAppUpdateInfo;-><init>()V

    move-object/from16 v0, v17

    invoke-static {v3, v0}, Lcom/heitao/request/HTBaseLoginVerify;->access$802(Lcom/heitao/request/HTBaseLoginVerify;Lcom/heitao/model/HTAppUpdateInfo;)Lcom/heitao/model/HTAppUpdateInfo;

    .line 173
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v3}, Lcom/heitao/request/HTBaseLoginVerify;->access$800(Lcom/heitao/request/HTBaseLoginVerify;)Lcom/heitao/model/HTAppUpdateInfo;

    move-result-object v3

    move-object/from16 v0, v16

    iput-object v0, v3, Lcom/heitao/model/HTAppUpdateInfo;->versionName:Ljava/lang/String;

    .line 174
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v3}, Lcom/heitao/request/HTBaseLoginVerify;->access$800(Lcom/heitao/request/HTBaseLoginVerify;)Lcom/heitao/model/HTAppUpdateInfo;

    move-result-object v3

    iput v15, v3, Lcom/heitao/model/HTAppUpdateInfo;->versionCode:I

    .line 175
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v3}, Lcom/heitao/request/HTBaseLoginVerify;->access$800(Lcom/heitao/request/HTBaseLoginVerify;)Lcom/heitao/model/HTAppUpdateInfo;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/heitao/request/HTBaseLoginVerify;->access$200(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v3, Lcom/heitao/model/HTAppUpdateInfo;->content:Ljava/lang/String;

    .line 176
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v3}, Lcom/heitao/request/HTBaseLoginVerify;->access$800(Lcom/heitao/request/HTBaseLoginVerify;)Lcom/heitao/model/HTAppUpdateInfo;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/heitao/request/HTBaseLoginVerify;->access$400(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v3, Lcom/heitao/model/HTAppUpdateInfo;->apkURL:Ljava/lang/String;

    .line 177
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v3}, Lcom/heitao/request/HTBaseLoginVerify;->access$800(Lcom/heitao/request/HTBaseLoginVerify;)Lcom/heitao/model/HTAppUpdateInfo;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/heitao/request/HTBaseLoginVerify;->access$300(Lcom/heitao/request/HTBaseLoginVerify;)Z

    move-result v17

    move/from16 v0, v17

    iput-boolean v0, v3, Lcom/heitao/model/HTAppUpdateInfo;->isForce:Z

    .line 179
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "mAppUpdateInfo="

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/heitao/request/HTBaseLoginVerify;->access$800(Lcom/heitao/request/HTBaseLoginVerify;)Lcom/heitao/model/HTAppUpdateInfo;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/heitao/model/HTAppUpdateInfo;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 181
    if-eqz v13, :cond_5

    .line 183
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/heitao/request/HTBaseLoginVerify;->access$000(Lcom/heitao/request/HTBaseLoginVerify;)I

    move-result v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/heitao/request/HTBaseLoginVerify;->access$100(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/heitao/request/HTBaseLoginVerify;->access$200(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;

    move-result-object v19

    move/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-static {v3, v0, v1, v2}, Lcom/heitao/request/HTBaseLoginVerify;->access$900(Lcom/heitao/request/HTBaseLoginVerify;ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 187
    :cond_5
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify;->mAppUpdateListener:Lcom/heitao/listener/HTAppUpdateListener;

    if-nez v3, :cond_6

    .line 189
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/heitao/request/HTBaseLoginVerify;->access$000(Lcom/heitao/request/HTBaseLoginVerify;)I

    move-result v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/heitao/request/HTBaseLoginVerify;->access$100(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/heitao/request/HTBaseLoginVerify;->access$200(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;

    move-result-object v19

    move/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-static {v3, v0, v1, v2}, Lcom/heitao/request/HTBaseLoginVerify;->access$900(Lcom/heitao/request/HTBaseLoginVerify;ILjava/lang/String;Ljava/lang/String;)V

    .line 191
    const-string v3, "\u5ba2\u6237\u7aef\u8bf7\u5148\u8bbe\u7f6e\u66f4\u65b0\u76d1\u542c"

    invoke-static {v3}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 195
    :cond_6
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify;->mAppUpdateListener:Lcom/heitao/listener/HTAppUpdateListener;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/heitao/request/HTBaseLoginVerify;->access$800(Lcom/heitao/request/HTBaseLoginVerify;)Lcom/heitao/model/HTAppUpdateInfo;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v3, v0}, Lcom/heitao/listener/HTAppUpdateListener;->onHTAppUpdate(Lcom/heitao/model/HTAppUpdateInfo;)V

    goto/16 :goto_2

    .line 201
    .end local v4    # "dataObject":Lorg/json/JSONObject;
    :cond_7
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/heitao/request/HTBaseLoginVerify;->access$200(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;

    move-result-object v17

    const-string v18, "|"

    const-string v19, "\n"

    invoke-virtual/range {v17 .. v19}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v3, v0}, Lcom/heitao/request/HTBaseLoginVerify;->access$202(Lcom/heitao/request/HTBaseLoginVerify;Ljava/lang/String;)Ljava/lang/String;

    .line 202
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/heitao/request/HTBaseLoginVerify;->access$000(Lcom/heitao/request/HTBaseLoginVerify;)I

    move-result v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/heitao/request/HTBaseLoginVerify;->access$100(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/heitao/request/HTBaseLoginVerify;->access$200(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;

    move-result-object v19

    move/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-static {v3, v0, v1, v2}, Lcom/heitao/request/HTBaseLoginVerify;->access$900(Lcom/heitao/request/HTBaseLoginVerify;ILjava/lang/String;Ljava/lang/String;)V

    .line 204
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "requestUrl="

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$1;->val$finalRequestUrl:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2
.end method
