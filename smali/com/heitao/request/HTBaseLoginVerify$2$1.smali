.class Lcom/heitao/request/HTBaseLoginVerify$2$1;
.super Ljava/lang/Object;
.source "HTBaseLoginVerify.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/request/HTBaseLoginVerify$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/heitao/request/HTBaseLoginVerify$2;


# direct methods
.method constructor <init>(Lcom/heitao/request/HTBaseLoginVerify$2;)V
    .locals 0

    .prologue
    .line 265
    iput-object p1, p0, Lcom/heitao/request/HTBaseLoginVerify$2$1;->this$1:Lcom/heitao/request/HTBaseLoginVerify$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 270
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 272
    iget-object v3, p0, Lcom/heitao/request/HTBaseLoginVerify$2$1;->this$1:Lcom/heitao/request/HTBaseLoginVerify$2;

    iget v3, v3, Lcom/heitao/request/HTBaseLoginVerify$2;->val$code:I

    const/16 v4, 0x7532

    if-ne v3, v4, :cond_3

    iget-object v3, p0, Lcom/heitao/request/HTBaseLoginVerify$2$1;->this$1:Lcom/heitao/request/HTBaseLoginVerify$2;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify$2;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v3}, Lcom/heitao/request/HTBaseLoginVerify;->access$400(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 274
    iget-object v3, p0, Lcom/heitao/request/HTBaseLoginVerify$2$1;->this$1:Lcom/heitao/request/HTBaseLoginVerify$2;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify$2;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v3}, Lcom/heitao/request/HTBaseLoginVerify;->access$500(Lcom/heitao/request/HTBaseLoginVerify;)I

    move-result v3

    if-nez v3, :cond_1

    .line 276
    iget-object v3, p0, Lcom/heitao/request/HTBaseLoginVerify$2$1;->this$1:Lcom/heitao/request/HTBaseLoginVerify$2;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify$2;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v3}, Lcom/heitao/request/HTBaseLoginVerify;->access$400(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/heitao/common/HTUtils;->doOpenUrl(Ljava/lang/String;)V

    .line 295
    :cond_0
    :goto_0
    return-void

    .line 278
    :cond_1
    const/4 v3, 0x1

    iget-object v4, p0, Lcom/heitao/request/HTBaseLoginVerify$2$1;->this$1:Lcom/heitao/request/HTBaseLoginVerify$2;

    iget-object v4, v4, Lcom/heitao/request/HTBaseLoginVerify$2;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v4}, Lcom/heitao/request/HTBaseLoginVerify;->access$500(Lcom/heitao/request/HTBaseLoginVerify;)I

    move-result v4

    if-ne v3, v4, :cond_0

    .line 280
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/HTDownload/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 281
    .local v0, "apkSaveDir":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 282
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_2

    .line 284
    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    .line 287
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v4

    iget-object v4, v4, Lcom/heitao/common/HTDataCenter;->mGameInfo:Lcom/heitao/model/HTGameInfo;

    iget-object v4, v4, Lcom/heitao/model/HTGameInfo;->shortName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_update.apk"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 288
    .local v1, "apkSavePath":Ljava/lang/String;
    iget-object v3, p0, Lcom/heitao/request/HTBaseLoginVerify$2$1;->this$1:Lcom/heitao/request/HTBaseLoginVerify$2;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify$2;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/heitao/request/HTBaseLoginVerify$2$1;->this$1:Lcom/heitao/request/HTBaseLoginVerify$2;

    iget-object v4, v4, Lcom/heitao/request/HTBaseLoginVerify$2;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v4}, Lcom/heitao/request/HTBaseLoginVerify;->access$800(Lcom/heitao/request/HTBaseLoginVerify;)Lcom/heitao/model/HTAppUpdateInfo;

    move-result-object v4

    invoke-static {v3, v1, v4}, Lcom/heitao/update/HTAPKUpdateHelper;->downloadAPK(Landroid/content/Context;Ljava/lang/String;Lcom/heitao/model/HTAppUpdateInfo;)V

    goto :goto_0

    .line 293
    .end local v0    # "apkSaveDir":Ljava/lang/String;
    .end local v1    # "apkSavePath":Ljava/lang/String;
    .end local v2    # "file":Ljava/io/File;
    :cond_3
    iget-object v3, p0, Lcom/heitao/request/HTBaseLoginVerify$2$1;->this$1:Lcom/heitao/request/HTBaseLoginVerify$2;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify$2;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v4, p0, Lcom/heitao/request/HTBaseLoginVerify$2$1;->this$1:Lcom/heitao/request/HTBaseLoginVerify$2;

    iget-object v4, v4, Lcom/heitao/request/HTBaseLoginVerify$2;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v4}, Lcom/heitao/request/HTBaseLoginVerify;->access$1000(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/util/Map;

    move-result-object v4

    iget-object v5, p0, Lcom/heitao/request/HTBaseLoginVerify$2$1;->this$1:Lcom/heitao/request/HTBaseLoginVerify$2;

    iget-object v5, v5, Lcom/heitao/request/HTBaseLoginVerify$2;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v5, v5, Lcom/heitao/request/HTBaseLoginVerify;->mLoginVerifyListener:Lcom/heitao/listener/HTLoginVerifyListener;

    invoke-virtual {v3, v4, v5}, Lcom/heitao/request/HTBaseLoginVerify;->doLoginVerify(Ljava/util/Map;Lcom/heitao/listener/HTLoginVerifyListener;)V

    goto :goto_0
.end method
