.class public Lcom/switfpass/pay/utils/DialogInfoSdk;
.super Landroid/app/Dialog;


# static fields
.field public static final EXITAUTH:I = 0x3

.field public static final EXITAUTHLOGIN:I = 0x4

.field public static final FLAG:I = 0x0

.field public static final NETWORKSTATUE:I = 0x8

.field public static final PAY_SCAN_MICRO:I = 0x9

.field public static final PAY_SDK:I = 0xc

.field public static final REGISTFLAG:I = 0x2

.field public static final REVERS:I = 0xa

.field public static final SCAN_PAY:I = 0xb

.field public static final SUBMIT:I = 0x1

.field public static final SUBMITSHOPINFO:I = 0x5

.field public static final SUBMIT_COUPON_INFO:I = 0x7

.field public static final SUBMIT_FINISH:I = 0x6

.field public static final SUBMIT_NO_CANLE:I = 0x8


# instance fields
.field private T:Ljava/lang/String;

.field private bh:Landroid/content/Context;

.field private db:Landroid/widget/TextView;

.field private dc:Landroid/widget/TextView;

.field private dd:Landroid/widget/TextView;

.field private de:Landroid/widget/TextView;

.field private df:Landroid/widget/TextView;

.field private dg:Landroid/widget/TextView;

.field private dh:Landroid/view/ViewGroup;

.field private di:Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;

.field private dj:Landroid/view/View;

.field private dk:Landroid/view/View;

.field private dl:Landroid/widget/EditText;

.field private dm:Landroid/widget/LinearLayout;

.field private dn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;)V
    .locals 3

    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->requestWindowFeature(I)Z

    invoke-virtual {p0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_dialog_info()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dh:Landroid/view/ViewGroup;

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dh:Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->setContentView(Landroid/view/View;)V

    invoke-virtual {p0, p5}, Lcom/switfpass/pay/utils/DialogInfoSdk;->setTradeNo(Ljava/lang/String;)V

    invoke-virtual {p0, p6}, Lcom/switfpass/pay/utils/DialogInfoSdk;->setMoney(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->bh:Landroid/content/Context;

    iput-object p7, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->di:Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;

    invoke-direct {p0, p3, p4, p2}, Lcom/switfpass/pay/utils/DialogInfoSdk;->a(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-direct {p0, p2}, Lcom/switfpass/pay/utils/DialogInfoSdk;->a(I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;)V
    .locals 3

    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->requestWindowFeature(I)Z

    invoke-virtual {p0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_dialog_info()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dh:Landroid/view/ViewGroup;

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dh:Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->setContentView(Landroid/view/View;)V

    iput-object p1, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->bh:Landroid/content/Context;

    iput-object p6, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->di:Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;

    invoke-direct {p0, p2, p3, p5}, Lcom/switfpass/pay/utils/DialogInfoSdk;->a(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-direct {p0, p5}, Lcom/switfpass/pay/utils/DialogInfoSdk;->a(I)V

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/utils/DialogInfoSdk;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->bh:Landroid/content/Context;

    return-object v0
.end method

.method private a(I)V
    .locals 2

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dg:Landroid/widget/TextView;

    new-instance v1, Lcom/switfpass/pay/utils/g;

    invoke-direct {v1, p0, p1}, Lcom/switfpass/pay/utils/g;-><init>(Lcom/switfpass/pay/utils/DialogInfoSdk;I)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->df:Landroid/widget/TextView;

    new-instance v1, Lcom/switfpass/pay/utils/h;

    invoke-direct {v1, p0, p1}, Lcom/switfpass/pay/utils/h;-><init>(Lcom/switfpass/pay/utils/DialogInfoSdk;I)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 4

    const v1, -0xffff01

    const/4 v3, 0x0

    const/16 v2, 0x8

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_title()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->db:Landroid/widget/TextView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_content()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dc:Landroid/widget/TextView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_btnOk()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->df:Landroid/widget/TextView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_btnCancel()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dg:Landroid/widget/TextView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_line_img()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dj:Landroid/view/View;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_et_content()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dl:Landroid/widget/EditText;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_pay_lay_revers()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dm:Landroid/widget/LinearLayout;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_pay_money()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dd:Landroid/widget/TextView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_pay_order_no()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->de:Landroid/widget/TextView;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_pay_img()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dk:Landroid/view/View;

    packed-switch p3, :pswitch_data_0

    :goto_0
    :pswitch_0
    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->db:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dc:Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_1
    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->df:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->df:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dg:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dj:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->df:Landroid/widget/TextView;

    const-string v1, "\u786e\u5b9a"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :pswitch_4
    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dl:Landroid/widget/EditText;

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setVisibility(I)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dc:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dg:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dj:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :pswitch_5
    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dg:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dj:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->df:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dk:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dm:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0

    :pswitch_6
    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->de:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->getTradeNo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dd:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->getMoney()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dm:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dc:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->df:Landroid/widget/TextView;

    const-string v1, "\u51b2\u6b63"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dg:Landroid/widget/TextView;

    const-string v1, "\u7ee7\u7eed\u67e5\u8be2"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    :pswitch_7
    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->df:Landroid/widget/TextView;

    const-string v1, "\u7ee7\u7eed\u652f\u4ed8"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_6
        :pswitch_5
        :pswitch_7
    .end packed-switch
.end method

.method static synthetic b(Lcom/switfpass/pay/utils/DialogInfoSdk;)Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->di:Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;

    return-object v0
.end method

.method static synthetic c(Lcom/switfpass/pay/utils/DialogInfoSdk;)Landroid/widget/EditText;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dl:Landroid/widget/EditText;

    return-object v0
.end method


# virtual methods
.method public getMoney()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->T:Ljava/lang/String;

    return-object v0
.end method

.method public getTradeNo()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dn:Ljava/lang/String;

    return-object v0
.end method

.method public setBtnOkText(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->df:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->df:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dc:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setMoney(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->T:Ljava/lang/String;

    return-void
.end method

.method public setTradeNo(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->dn:Ljava/lang/String;

    return-void
.end method

.method public setmDelListener(Lcom/switfpass/pay/utils/DialogInfoSdk$OnItemLongDelListener;I)V
    .locals 0

    return-void
.end method

.method public setmOnSubmitCouponListener(Lcom/switfpass/pay/utils/DialogInfoSdk$OnSubmitCouponListener;)V
    .locals 0

    return-void
.end method

.method public showPage(Ljava/lang/Class;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->bh:Landroid/content/Context;

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/switfpass/pay/utils/DialogInfoSdk;->bh:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
