.class Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$1;
.super Ljava/util/TimerTask;
.source "HTPFloatMenuWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->startTimer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$1;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    .line 98
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 102
    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$1;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v1, v1, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$1;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v1, v1, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    invoke-virtual {v1}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 108
    :goto_0
    return-void

    .line 105
    :cond_0
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 106
    .local v0, "sss":Landroid/os/Message;
    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$1;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$19(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v1

    iput v1, v0, Landroid/os/Message;->what:I

    .line 107
    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$1;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$2(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;

    move-result-object v1

    iget v2, v0, Landroid/os/Message;->what:I

    const-wide/16 v4, 0x64

    invoke-virtual {v1, v2, v4, v5}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0
.end method
