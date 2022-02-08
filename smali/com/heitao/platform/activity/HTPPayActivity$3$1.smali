.class Lcom/heitao/platform/activity/HTPPayActivity$3$1;
.super Ljava/lang/Object;
.source "HTPPayActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPPayActivity$3;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/heitao/platform/activity/HTPPayActivity$3;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPPayActivity$3;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3$1;->this$1:Lcom/heitao/platform/activity/HTPPayActivity$3;

    .line 593
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 598
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$3$1;->this$1:Lcom/heitao/platform/activity/HTPPayActivity$3;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPPayActivity$3;->access$1(Lcom/heitao/platform/activity/HTPPayActivity$3;)Lcom/heitao/platform/activity/HTPPayActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTPPayActivity;->finish()V

    .line 599
    return-void
.end method
