.class Lcom/heitao/platform/common/HTPUtils$2$1;
.super Ljava/lang/Object;
.source "HTPUtils.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/common/HTPUtils$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/heitao/platform/common/HTPUtils$2;


# direct methods
.method constructor <init>(Lcom/heitao/platform/common/HTPUtils$2;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/common/HTPUtils$2$1;->this$1:Lcom/heitao/platform/common/HTPUtils$2;

    .line 349
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 355
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 356
    return-void
.end method
