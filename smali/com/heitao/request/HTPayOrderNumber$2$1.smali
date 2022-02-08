.class Lcom/heitao/request/HTPayOrderNumber$2$1;
.super Ljava/lang/Object;
.source "HTPayOrderNumber.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/request/HTPayOrderNumber$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/heitao/request/HTPayOrderNumber$2;


# direct methods
.method constructor <init>(Lcom/heitao/request/HTPayOrderNumber$2;)V
    .locals 0

    .prologue
    .line 159
    iput-object p1, p0, Lcom/heitao/request/HTPayOrderNumber$2$1;->this$1:Lcom/heitao/request/HTPayOrderNumber$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 164
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 166
    iget-object v0, p0, Lcom/heitao/request/HTPayOrderNumber$2$1;->this$1:Lcom/heitao/request/HTPayOrderNumber$2;

    iget v0, v0, Lcom/heitao/request/HTPayOrderNumber$2;->val$code:I

    const/16 v1, 0x753a

    if-ne v0, v1, :cond_0

    .line 174
    :goto_0
    return-void

    .line 172
    :cond_0
    iget-object v0, p0, Lcom/heitao/request/HTPayOrderNumber$2$1;->this$1:Lcom/heitao/request/HTPayOrderNumber$2;

    iget-object v0, v0, Lcom/heitao/request/HTPayOrderNumber$2;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    iget-object v1, p0, Lcom/heitao/request/HTPayOrderNumber$2$1;->this$1:Lcom/heitao/request/HTPayOrderNumber$2;

    iget-object v1, v1, Lcom/heitao/request/HTPayOrderNumber$2;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    invoke-static {v1}, Lcom/heitao/request/HTPayOrderNumber;->access$400(Lcom/heitao/request/HTPayOrderNumber;)Ljava/util/Map;

    move-result-object v1

    iget-object v2, p0, Lcom/heitao/request/HTPayOrderNumber$2$1;->this$1:Lcom/heitao/request/HTPayOrderNumber$2;

    iget-object v2, v2, Lcom/heitao/request/HTPayOrderNumber$2;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    iget-object v2, v2, Lcom/heitao/request/HTPayOrderNumber;->mPayOrderNumberLisener:Lcom/heitao/listener/HTPayOrderListener;

    invoke-virtual {v0, v1, v2}, Lcom/heitao/request/HTPayOrderNumber;->doCreatePayOrderNumber(Ljava/util/Map;Lcom/heitao/listener/HTPayOrderListener;)V

    goto :goto_0
.end method
