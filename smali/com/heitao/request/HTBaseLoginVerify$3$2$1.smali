.class Lcom/heitao/request/HTBaseLoginVerify$3$2$1;
.super Ljava/lang/Object;
.source "HTBaseLoginVerify.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/request/HTBaseLoginVerify$3$2;->onSuccess(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/heitao/request/HTBaseLoginVerify$3$2;


# direct methods
.method constructor <init>(Lcom/heitao/request/HTBaseLoginVerify$3$2;)V
    .locals 0

    .prologue
    .line 409
    iput-object p1, p0, Lcom/heitao/request/HTBaseLoginVerify$3$2$1;->this$2:Lcom/heitao/request/HTBaseLoginVerify$3$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 414
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 415
    iget-object v0, p0, Lcom/heitao/request/HTBaseLoginVerify$3$2$1;->this$2:Lcom/heitao/request/HTBaseLoginVerify$3$2;

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$3$2;->this$1:Lcom/heitao/request/HTBaseLoginVerify$3;

    iget-object v0, v0, Lcom/heitao/request/HTBaseLoginVerify$3;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v1, p0, Lcom/heitao/request/HTBaseLoginVerify$3$2$1;->this$2:Lcom/heitao/request/HTBaseLoginVerify$3$2;

    iget-object v1, v1, Lcom/heitao/request/HTBaseLoginVerify$3$2;->this$1:Lcom/heitao/request/HTBaseLoginVerify$3;

    iget-object v1, v1, Lcom/heitao/request/HTBaseLoginVerify$3;->val$title:Ljava/lang/String;

    iget-object v2, p0, Lcom/heitao/request/HTBaseLoginVerify$3$2$1;->this$2:Lcom/heitao/request/HTBaseLoginVerify$3$2;

    iget-object v2, v2, Lcom/heitao/request/HTBaseLoginVerify$3$2;->this$1:Lcom/heitao/request/HTBaseLoginVerify$3;

    iget-object v2, v2, Lcom/heitao/request/HTBaseLoginVerify$3;->val$message:Ljava/lang/String;

    iget-object v3, p0, Lcom/heitao/request/HTBaseLoginVerify$3$2$1;->this$2:Lcom/heitao/request/HTBaseLoginVerify$3$2;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify$3$2;->this$1:Lcom/heitao/request/HTBaseLoginVerify$3;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify$3;->val$confirm:Ljava/lang/String;

    iget-object v4, p0, Lcom/heitao/request/HTBaseLoginVerify$3$2$1;->this$2:Lcom/heitao/request/HTBaseLoginVerify$3$2;

    iget-object v4, v4, Lcom/heitao/request/HTBaseLoginVerify$3$2;->this$1:Lcom/heitao/request/HTBaseLoginVerify$3;

    iget-object v4, v4, Lcom/heitao/request/HTBaseLoginVerify$3;->val$otherButton:Ljava/lang/String;

    iget-object v5, p0, Lcom/heitao/request/HTBaseLoginVerify$3$2$1;->this$2:Lcom/heitao/request/HTBaseLoginVerify$3$2;

    iget-object v5, v5, Lcom/heitao/request/HTBaseLoginVerify$3$2;->this$1:Lcom/heitao/request/HTBaseLoginVerify$3;

    iget-object v5, v5, Lcom/heitao/request/HTBaseLoginVerify$3;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v5}, Lcom/heitao/request/HTBaseLoginVerify;->access$1200(Lcom/heitao/request/HTBaseLoginVerify;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v5

    invoke-static/range {v0 .. v5}, Lcom/heitao/request/HTBaseLoginVerify;->access$1300(Lcom/heitao/request/HTBaseLoginVerify;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V

    .line 416
    return-void
.end method
