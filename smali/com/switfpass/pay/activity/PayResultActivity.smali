.class public Lcom/switfpass/pay/activity/PayResultActivity;
.super Landroid/app/Activity;


# instance fields
.field private A:Landroid/widget/TextView;

.field private B:Landroid/widget/LinearLayout;

.field private C:Landroid/widget/LinearLayout;

.field private D:Landroid/widget/LinearLayout;

.field private E:Landroid/widget/LinearLayout;

.field private F:Landroid/widget/Button;

.field private G:Lnet/tsz/afinal/FinalBitmap;

.field private H:Landroid/widget/TextView;

.field private n:Landroid/widget/TextView;

.field private o:Landroid/widget/TextView;

.field private p:Landroid/widget/TextView;

.field private q:Landroid/widget/TextView;

.field private r:Landroid/widget/TextView;

.field private s:Lcom/switfpass/pay/bean/OrderBena;

.field private t:Landroid/widget/ImageView;

.field private u:Landroid/widget/ImageView;

.field private v:Landroid/widget/TextView;

.field private w:Landroid/widget/TextView;

.field private x:Landroid/widget/TextView;

.field private y:Landroid/widget/TextView;

.field private z:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/activity/PayResultActivity;)Lcom/switfpass/pay/bean/OrderBena;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    return-object v0
.end method

.method public static startActivity(Lcom/switfpass/pay/bean/OrderBena;Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "order"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-class v1, Lcom/switfpass/pay/activity/PayResultActivity;

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method protected getViewById(I)Landroid/view/View;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/switfpass/pay/activity/PayResultActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9

    const/4 v3, 0x0

    const/16 v8, 0x8

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->requestWindowFeature(I)Z

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_Result()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/switfpass/pay/activity/PayResultActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "order"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/switfpass/pay/bean/OrderBena;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-static {p0}, Lnet/tsz/afinal/FinalBitmap;->create(Landroid/content/Context;)Lnet/tsz/afinal/FinalBitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->G:Lnet/tsz/afinal/FinalBitmap;

    :try_start_0
    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->G:Lnet/tsz/afinal/FinalBitmap;

    invoke-static {}, Lcom/switfpass/pay/utils/Util;->getAppCache()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnet/tsz/afinal/FinalBitmap;->configDiskCachePath(Ljava/lang/String;)Lnet/tsz/afinal/FinalBitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_tv_pay_transNo()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->H:Landroid/widget/TextView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_iv_pay_image()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->u:Landroid/widget/ImageView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_pay_logo_lay()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->C:Landroid/widget/LinearLayout;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_pay_img_lay()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->D:Landroid/widget/LinearLayout;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_pay_logo_title()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->t:Landroid/widget/ImageView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_tv_orderNo()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->n:Landroid/widget/TextView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_tv_order_time()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->o:Landroid/widget/TextView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_tv_order_state()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->p:Landroid/widget/TextView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_tv_tv_bank()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->q:Landroid/widget/TextView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_tv_money()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->r:Landroid/widget/TextView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_iv_payType()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_finsh()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->v:Landroid/widget/TextView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_tv_pay_body()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->w:Landroid/widget/TextView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_tv_pay_mch_order()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->x:Landroid/widget/TextView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_tv_pay_wx_order()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->y:Landroid/widget/TextView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_tx_pay_wx_title()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->z:Landroid/widget/TextView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_rl_pay_mch()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->B:Landroid/widget/LinearLayout;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_tv_pay_mch()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->A:Landroid/widget/TextView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_layBack()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->E:Landroid/widget/LinearLayout;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_pay_complete()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->getViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->F:Landroid/widget/Button;

    const-string v0, ""

    iget-object v1, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v1}, Lcom/switfpass/pay/bean/OrderBena;->getPay_logo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/OrderBena;->getPay_logo()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->D:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->C:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->G:Lnet/tsz/afinal/FinalBitmap;

    iget-object v1, p0, Lcom/switfpass/pay/activity/PayResultActivity;->t:Landroid/widget/ImageView;

    iget-object v2, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v2}, Lcom/switfpass/pay/bean/OrderBena;->getPay_logo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lnet/tsz/afinal/FinalBitmap;->display(Landroid/view/View;Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/OrderBena;->getCashierName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/OrderBena;->getCashierName()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->B:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->x:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v1}, Lcom/switfpass/pay/bean/OrderBena;->getCashierName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_1
    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->n:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v1}, Lcom/switfpass/pay/bean/OrderBena;->getOutTradeNo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->q:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v1}, Lcom/switfpass/pay/bean/OrderBena;->getTradeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/text/NumberFormat;->setMinimumFractionDigits(I)V

    iget-object v1, p0, Lcom/switfpass/pay/activity/PayResultActivity;->r:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\uffe5"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v3}, Lcom/switfpass/pay/bean/OrderBena;->getMoeny()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    const-wide/high16 v6, 0x4059000000000000L    # 100.0

    div-double/2addr v4, v6

    invoke-virtual {v0, v4, v5}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->o:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v1}, Lcom/switfpass/pay/bean/OrderBena;->getTradeTime()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/switfpass/pay/utils/Util;->formatTime(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->w:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v1}, Lcom/switfpass/pay/bean/OrderBena;->getBody()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->H:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v1}, Lcom/switfpass/pay/bean/OrderBena;->getMchOrderNo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->y:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v1}, Lcom/switfpass/pay/bean/OrderBena;->getTransactionId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->A:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v1}, Lcom/switfpass/pay/bean/OrderBena;->getMchName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->p:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/switfpass/pay/activity/PayResultActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getString_pay_success_prompt()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/OrderBena;->getService()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/OrderBena;->getService()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->QQ_SACN_TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/OrderBena;->getService()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->PAY_QQ_MICROPAY:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/OrderBena;->getService()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->PAY_QQ_PROXY_MICROPAY:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_1
    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->u:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/switfpass/pay/activity/PayResultActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_icon_qq_color()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->z:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/switfpass/pay/activity/PayResultActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getString_pay_qq_order_no()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->B:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :cond_2
    :goto_2
    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->v:Landroid/widget/TextView;

    new-instance v1, Lcom/switfpass/pay/activity/g;

    invoke-direct {v1, p0}, Lcom/switfpass/pay/activity/g;-><init>(Lcom/switfpass/pay/activity/PayResultActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->E:Landroid/widget/LinearLayout;

    new-instance v1, Lcom/switfpass/pay/activity/h;

    invoke-direct {v1, p0}, Lcom/switfpass/pay/activity/h;-><init>(Lcom/switfpass/pay/activity/PayResultActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->F:Landroid/widget/Button;

    new-instance v1, Lcom/switfpass/pay/activity/i;

    invoke-direct {v1, p0}, Lcom/switfpass/pay/activity/i;-><init>(Lcom/switfpass/pay/activity/PayResultActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :catch_0
    move-exception v0

    const-string v0, "hehui"

    const-string v1, "configDiskCachePath failed "

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_3
    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->B:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto/16 :goto_1

    :cond_4
    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/OrderBena;->getService()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->ZFB_SCAN_TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/OrderBena;->getService()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->PAY_ZFB_MICROPAY:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_5
    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->u:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/switfpass/pay/activity/PayResultActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_icon_pay_color()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->z:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/switfpass/pay/activity/PayResultActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getString_pay_zfb_order_no()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3

    const/4 v1, 0x0

    const/4 v0, 0x4

    if-ne p1, v0, :cond_2

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/switfpass/pay/activity/PayResultActivity;->s:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/OrderBena;->isMark()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x6

    const/4 v1, 0x7

    const-string v2, "\u652f\u4ed8\u72b6\u6001\uff1a\u8be5\u7b14\u8ba2\u5355\u5df2\u652f\u4ed8"

    invoke-static {v0, v1, v2}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(IILjava/lang/Object;)V

    :goto_0
    invoke-virtual {p0}, Lcom/switfpass/pay/activity/PayResultActivity;->finish()V

    const/4 v0, 0x1

    :goto_1
    return v0

    :cond_0
    invoke-static {v1, v1}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(II)V

    goto :goto_0

    :cond_1
    invoke-static {v1, v1}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(II)V

    goto :goto_0

    :cond_2
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_1
.end method
