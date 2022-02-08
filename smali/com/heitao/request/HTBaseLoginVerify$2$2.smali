.class Lcom/heitao/request/HTBaseLoginVerify$2$2;
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
    .line 300
    iput-object p1, p0, Lcom/heitao/request/HTBaseLoginVerify$2$2;->this$1:Lcom/heitao/request/HTBaseLoginVerify$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 306
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 307
    const-string v0, "\u53d6\u6d88\u66f4\u65b0"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->i(Ljava/lang/String;)V

    .line 310
    iget-object v0, p0, Lcom/heitao/request/HTBaseLoginVerify$2$2;->this$1:Lcom/heitao/request/HTBaseLoginVerify$2;

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$2;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v1, p0, Lcom/heitao/request/HTBaseLoginVerify$2$2;->this$1:Lcom/heitao/request/HTBaseLoginVerify$2;

    iget-object v1, v1, Lcom/heitao/request/HTBaseLoginVerify$2;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v1}, Lcom/heitao/request/HTBaseLoginVerify;->access$600(Lcom/heitao/request/HTBaseLoginVerify;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/heitao/request/HTBaseLoginVerify;->parseCompleted(Lorg/json/JSONObject;)V

    .line 311
    return-void
.end method
