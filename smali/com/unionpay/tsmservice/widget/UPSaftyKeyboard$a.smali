.class final Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;
.super Landroid/widget/GridView;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;


# direct methods
.method private constructor <init>(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;->a:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;

    invoke-direct {p0, p2}, Landroid/widget/GridView;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;Landroid/content/Context;B)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;-><init>(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Landroid/widget/GridView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0
.end method
