.class public Lcom/heitao/platform/activity/view/MyCountDownBt;
.super Landroid/os/CountDownTimer;
.source "MyCountDownBt.java"


# instance fields
.field private mTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/widget/TextView;JJ)V
    .locals 0
    .param p1, "textView"    # Landroid/widget/TextView;
    .param p2, "millisInFuture"    # J
    .param p4, "countDownInterval"    # J

    .prologue
    .line 10
    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    .line 11
    iput-object p1, p0, Lcom/heitao/platform/activity/view/MyCountDownBt;->mTextView:Landroid/widget/TextView;

    .line 12
    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 2

    .prologue
    .line 26
    iget-object v0, p0, Lcom/heitao/platform/activity/view/MyCountDownBt;->mTextView:Landroid/widget/TextView;

    const-string v1, "\u91cd\u65b0\u83b7\u53d6"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    iget-object v0, p0, Lcom/heitao/platform/activity/view/MyCountDownBt;->mTextView:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setClickable(Z)V

    .line 29
    return-void
.end method

.method public onTick(J)V
    .locals 5
    .param p1, "millisUntilFinished"    # J

    .prologue
    .line 16
    iget-object v0, p0, Lcom/heitao/platform/activity/view/MyCountDownBt;->mTextView:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setClickable(Z)V

    .line 17
    iget-object v0, p0, Lcom/heitao/platform/activity/view/MyCountDownBt;->mTextView:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    const-wide/16 v2, 0x3e8

    div-long v2, p1, v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    return-void
.end method
