.class Lcom/heitao/platform/api/HTPlatform$7$1$1;
.super Ljava/lang/Object;
.source "HTPlatform.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/api/HTPlatform$7$1;->onCompleted(Lcom/heitao/platform/model/HTPHttpEntity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/heitao/platform/api/HTPlatform$7$1;

.field private final synthetic val$dailog:Lcom/heitao/platform/activity/view/version/HTAlertDailog;

.field private final synthetic val$mAppUpdateInfo:Lcom/heitao/platform/common/HTAppUpdateInfo;

.field private final synthetic val$update_and_open_way:Ljava/lang/String;

.field private final synthetic val$update_type:Ljava/lang/String;

.field private final synthetic val$update_url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/heitao/platform/api/HTPlatform$7$1;Ljava/lang/String;Lcom/heitao/platform/activity/view/version/HTAlertDailog;Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/common/HTAppUpdateInfo;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/api/HTPlatform$7$1$1;->this$2:Lcom/heitao/platform/api/HTPlatform$7$1;

    iput-object p2, p0, Lcom/heitao/platform/api/HTPlatform$7$1$1;->val$update_type:Ljava/lang/String;

    iput-object p3, p0, Lcom/heitao/platform/api/HTPlatform$7$1$1;->val$dailog:Lcom/heitao/platform/activity/view/version/HTAlertDailog;

    iput-object p4, p0, Lcom/heitao/platform/api/HTPlatform$7$1$1;->val$update_and_open_way:Ljava/lang/String;

    iput-object p5, p0, Lcom/heitao/platform/api/HTPlatform$7$1$1;->val$update_url:Ljava/lang/String;

    iput-object p6, p0, Lcom/heitao/platform/api/HTPlatform$7$1$1;->val$mAppUpdateInfo:Lcom/heitao/platform/common/HTAppUpdateInfo;

    .line 504
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 509
    iget-object v3, p0, Lcom/heitao/platform/api/HTPlatform$7$1$1;->val$update_type:Ljava/lang/String;

    const-string v4, "2"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 510
    iget-object v3, p0, Lcom/heitao/platform/api/HTPlatform$7$1$1;->val$dailog:Lcom/heitao/platform/activity/view/version/HTAlertDailog;

    invoke-virtual {v3}, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->dismiss()V

    .line 513
    :cond_0
    iget-object v3, p0, Lcom/heitao/platform/api/HTPlatform$7$1$1;->val$update_and_open_way:Ljava/lang/String;

    const-string v4, "2"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 515
    iget-object v3, p0, Lcom/heitao/platform/api/HTPlatform$7$1$1;->val$update_url:Ljava/lang/String;

    invoke-static {v3}, Lcom/heitao/platform/common/HTPUtils;->doOpenUrl(Ljava/lang/String;)V

    .line 529
    :cond_1
    :goto_0
    return-void

    .line 517
    :cond_2
    iget-object v3, p0, Lcom/heitao/platform/api/HTPlatform$7$1$1;->val$update_and_open_way:Ljava/lang/String;

    const-string v4, "1"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 519
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

    .line 520
    .local v0, "apkSaveDir":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 521
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_3

    .line 523
    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    .line 526
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v4

    iget-object v4, v4, Lcom/heitao/platform/common/HTPDataCenter;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_update.apk"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 527
    .local v1, "apkSavePath":Ljava/lang/String;
    iget-object v3, p0, Lcom/heitao/platform/api/HTPlatform$7$1$1;->this$2:Lcom/heitao/platform/api/HTPlatform$7$1;

    invoke-static {v3}, Lcom/heitao/platform/api/HTPlatform$7$1;->access$0(Lcom/heitao/platform/api/HTPlatform$7$1;)Lcom/heitao/platform/api/HTPlatform$7;

    move-result-object v3

    invoke-static {v3}, Lcom/heitao/platform/api/HTPlatform$7;->access$0(Lcom/heitao/platform/api/HTPlatform$7;)Lcom/heitao/platform/api/HTPlatform;

    move-result-object v3

    invoke-static {v3}, Lcom/heitao/platform/api/HTPlatform;->access$0(Lcom/heitao/platform/api/HTPlatform;)Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/heitao/platform/api/HTPlatform$7$1$1;->val$mAppUpdateInfo:Lcom/heitao/platform/common/HTAppUpdateInfo;

    invoke-static {v3, v1, v4}, Lcom/heitao/platform/update/HTAPKUpdateHelper;->downloadAPK(Landroid/content/Context;Ljava/lang/String;Lcom/heitao/platform/common/HTAppUpdateInfo;)V

    goto :goto_0
.end method
