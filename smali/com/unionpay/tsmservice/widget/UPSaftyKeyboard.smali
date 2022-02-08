.class public Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;,
        Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$b;,
        Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnEditorListener;,
        Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnHideListener;,
        Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnShowListener;
    }
.end annotation


# static fields
.field private static ab:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private A:I

.field private B:I

.field private C:I

.field private D:I

.field private E:I

.field private F:I

.field private G:I

.field private H:I

.field private I:I

.field private J:I

.field private K:I

.field private L:I

.field private M:I

.field private N:I

.field private O:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnShowListener;

.field private P:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnHideListener;

.field private Q:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnEditorListener;

.field private R:Lcom/unionpay/tsmservice/UPTsmAddon$UPTsmConnectionListener;

.field private S:Landroid/media/AudioManager;

.field private T:Landroid/os/Vibrator;

.field private U:Z

.field private V:Z

.field private W:Z

.field private X:Z

.field private Y:Z

.field private Z:Lcom/unionpay/tsmservice/UPTsmAddon;

.field final a:Landroid/view/View$OnClickListener;

.field private aa:Ljava/lang/String;

.field private ac:Landroid/widget/PopupWindow$OnDismissListener;

.field private b:Landroid/content/Context;

.field private c:Landroid/widget/LinearLayout;

.field private d:Landroid/widget/RelativeLayout;

.field private e:Landroid/widget/ImageView;

.field private f:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;

.field private g:Landroid/widget/PopupWindow;

.field private h:Landroid/widget/TextView;

.field private i:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$b;

.field private j:Z

.field private k:Landroid/graphics/drawable/Drawable;

.field private l:[Landroid/graphics/drawable/Drawable;

.field private m:[Landroid/graphics/drawable/Drawable;

.field private n:Landroid/graphics/drawable/Drawable;

.field private o:Landroid/graphics/drawable/Drawable;

.field private p:Landroid/graphics/drawable/Drawable;

.field private q:Landroid/graphics/drawable/Drawable;

.field private r:Landroid/graphics/drawable/Drawable;

.field private s:Landroid/graphics/drawable/Drawable;

.field private t:I

.field private u:I

.field private v:I

.field private w:I

.field private x:I

.field private y:I

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/16 v3, 0xa

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    sput-object v0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->ab:Ljava/util/List;

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v3, :cond_0

    sget-object v1, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->ab:Ljava/util/List;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    const/4 v0, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->b:Landroid/content/Context;

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->f:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;

    iput-boolean v2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->j:Z

    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->t:I

    const/16 v0, 0x28

    iput v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->u:I

    iput v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->N:I

    iput-boolean v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->U:Z

    iput-boolean v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->V:Z

    iput-boolean v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->W:Z

    iput-boolean v2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->X:Z

    iput-boolean v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->Y:Z

    new-instance v0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$3;

    invoke-direct {v0, p0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$3;-><init>(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)V

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->ac:Landroid/widget/PopupWindow$OnDismissListener;

    new-instance v0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$4;

    invoke-direct {v0, p0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$4;-><init>(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)V

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->a:Landroid/view/View$OnClickListener;

    iput-object p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->b:Landroid/content/Context;

    invoke-direct {p0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->c()V

    invoke-direct {p0, p1}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->a(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->d()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)V
    .locals 3

    const/4 v0, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->b:Landroid/content/Context;

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->f:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;

    iput-boolean v2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->j:Z

    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->t:I

    const/16 v0, 0x28

    iput v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->u:I

    iput v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->N:I

    iput-boolean v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->U:Z

    iput-boolean v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->V:Z

    iput-boolean v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->W:Z

    iput-boolean v2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->X:Z

    iput-boolean v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->Y:Z

    new-instance v0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$3;

    invoke-direct {v0, p0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$3;-><init>(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)V

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->ac:Landroid/widget/PopupWindow$OnDismissListener;

    new-instance v0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$4;

    invoke-direct {v0, p0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$4;-><init>(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)V

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->a:Landroid/view/View$OnClickListener;

    iput-object p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->b:Landroid/content/Context;

    iput-object p2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->k:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->c()V

    invoke-direct {p0, p1}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->a(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->d()V

    return-void
.end method

.method static synthetic A(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->u:I

    return v0
.end method

.method static synthetic B(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->U:Z

    return v0
.end method

.method static synthetic C(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->n:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic D(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->p:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic E(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->X:Z

    return v0
.end method

.method static synthetic F(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->o:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic G(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->q:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic H(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)[Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->l:[Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic I(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->s:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic J(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)[Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->m:[Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic a(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;I)I
    .locals 0

    iput p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->K:I

    return p1
.end method

.method static synthetic a(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/StateListDrawable;
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    if-eqz p1, :cond_0

    new-array v1, v4, [I

    const v2, 0x10100a7

    aput v2, v1, v3

    invoke-virtual {v0, v1, p1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    :cond_0
    if-eqz p0, :cond_1

    new-array v1, v4, [I

    const v2, 0x101009e

    aput v2, v1, v3

    invoke-virtual {v0, v1, p0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    :cond_1
    return-object v0
.end method

.method static synthetic a(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)Lcom/unionpay/tsmservice/UPTsmAddon;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->Z:Lcom/unionpay/tsmservice/UPTsmAddon;

    return-object v0
.end method

.method static synthetic a(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->aa:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic a()V
    .locals 1

    :try_start_0
    invoke-static {}, Lcom/unionpay/tsmservice/utils/IUPJniInterface;->dOPD()V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/UnsatisfiedLinkError;->printStackTrace()V

    goto :goto_0
.end method

.method private a(Landroid/content/Context;)V
    .locals 6

    const/4 v4, -0x1

    const/4 v5, 0x1

    const/4 v3, -0x2

    const/4 v2, 0x0

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->c:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->c:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->k:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->c:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->k:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_0
    new-instance v0, Landroid/widget/RelativeLayout;

    invoke-direct {v0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->d:Landroid/widget/RelativeLayout;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->e()I

    move-result v1

    div-int/lit8 v1, v1, 0x10

    invoke-direct {v0, v4, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->d:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->h:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->h:Landroid/widget/TextView;

    const-string v1, "Secure Mode"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->h:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->h:Landroid/widget/TextView;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->h:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->e:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->e:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v1, 0x78

    invoke-direct {v0, v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->e:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->e:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->d:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->h:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->d:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->e:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    new-instance v0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;

    invoke-direct {v0, p0, p1, v2}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;-><init>(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;Landroid/content/Context;B)V

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->f:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->f:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;

    invoke-virtual {v0, v2}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;->setHorizontalScrollBarEnabled(Z)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->f:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;

    invoke-virtual {v0, v2}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;->setVerticalScrollBarEnabled(Z)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->f:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;

    invoke-virtual {v0, v2}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;->setEnabled(Z)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->f:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;->setNumColumns(I)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->f:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;

    iget v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->B:I

    invoke-virtual {v0, v1}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;->setVerticalSpacing(I)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->f:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;

    iget v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->A:I

    invoke-virtual {v0, v1}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;->setHorizontalSpacing(I)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->f:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->i:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$b;

    invoke-virtual {v0, v1}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->f:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;

    iget v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->G:I

    iget v2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->H:I

    iget v3, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->I:I

    iget v4, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->J:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;->setPadding(IIII)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->c:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->d:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->c:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->f:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->c:Landroid/widget/LinearLayout;

    iget v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->C:I

    iget v2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->D:I

    iget v3, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->E:I

    iget v4, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->F:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v0, Landroid/widget/PopupWindow;

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->c:Landroid/widget/LinearLayout;

    iget v2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->x:I

    iget v3, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->y:I

    invoke-direct {v0, v1, v2, v3}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g:Landroid/widget/PopupWindow;

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g:Landroid/widget/PopupWindow;

    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g:Landroid/widget/PopupWindow;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setSoftInputMode(I)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v5}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v5}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g:Landroid/widget/PopupWindow;

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->ac:Landroid/widget/PopupWindow$OnDismissListener;

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->c:Landroid/widget/LinearLayout;

    const v1, -0x777778

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    goto/16 :goto_0
.end method

.method static synthetic a(Ljava/lang/String;)V
    .locals 1

    :try_start_0
    invoke-static {p0}, Lcom/unionpay/tsmservice/utils/IUPJniInterface;->aPD(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/UnsatisfiedLinkError;->printStackTrace()V

    goto :goto_0
.end method

.method static synthetic b(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;I)I
    .locals 0

    iput p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->L:I

    return p1
.end method

.method static synthetic b(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnHideListener;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->P:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnHideListener;

    return-object v0
.end method

.method private static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    :try_start_0
    invoke-static {p0}, Lcom/unionpay/tsmservice/utils/IUPJniInterface;->rEFP(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/UnsatisfiedLinkError;->printStackTrace()V

    const-string v0, ""

    goto :goto_0
.end method

.method static synthetic b()Ljava/util/List;
    .locals 1

    sget-object v0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->ab:Ljava/util/List;

    return-object v0
.end method

.method private static c(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    :try_start_0
    invoke-static {p0}, Lcom/unionpay/tsmservice/utils/IUPJniInterface;->ePB(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/UnsatisfiedLinkError;->printStackTrace()V

    const-string v0, ""

    goto :goto_0
.end method

.method private c()V
    .locals 4

    const/4 v3, -0x1

    const/16 v1, 0xa

    const/4 v2, 0x0

    iput v2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->v:I

    iput v2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->w:I

    iput v3, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->K:I

    invoke-direct {p0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->e()I

    move-result v0

    div-int/lit8 v0, v0, 0xe

    iput v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->L:I

    invoke-direct {p0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->e()I

    move-result v0

    div-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->z:I

    iput v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->A:I

    iput v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->B:I

    iput v2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->C:I

    iput v2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->D:I

    iput v2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->E:I

    iput v2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->F:I

    iput v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->G:I

    const/4 v0, 0x5

    iput v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->H:I

    iput v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->I:I

    iput v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->J:I

    iput v3, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->x:I

    invoke-direct {p0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->e()I

    move-result v0

    div-int/lit8 v0, v0, 0xe

    invoke-direct {p0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->e()I

    move-result v1

    div-int/lit8 v1, v1, 0x10

    mul-int/lit8 v0, v0, 0x4

    add-int/2addr v0, v1

    iget v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->B:I

    mul-int/lit8 v1, v1, 0x3

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0xa

    add-int/lit8 v0, v0, 0x5

    iput v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->y:I

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->b:Landroid/content/Context;

    const-string v1, "vibrator"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->T:Landroid/os/Vibrator;

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->b:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->S:Landroid/media/AudioManager;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->W:Z

    new-instance v0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$b;

    invoke-direct {v0, p0, v2}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$b;-><init>(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;B)V

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->i:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$b;

    return-void
.end method

.method static synthetic c(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->V:Z

    return v0
.end method

.method static synthetic d(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)Landroid/os/Vibrator;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->T:Landroid/os/Vibrator;

    return-object v0
.end method

.method private d()V
    .locals 3

    invoke-virtual {p0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->clearPwd()V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->b:Landroid/content/Context;

    invoke-static {v0}, Lcom/unionpay/tsmservice/UPTsmAddon;->getInstance(Landroid/content/Context;)Lcom/unionpay/tsmservice/UPTsmAddon;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->Z:Lcom/unionpay/tsmservice/UPTsmAddon;

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->Z:Lcom/unionpay/tsmservice/UPTsmAddon;

    invoke-virtual {v0}, Lcom/unionpay/tsmservice/UPTsmAddon;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$1;

    invoke-direct {v0, p0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$1;-><init>(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)V

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->R:Lcom/unionpay/tsmservice/UPTsmAddon$UPTsmConnectionListener;

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->Z:Lcom/unionpay/tsmservice/UPTsmAddon;

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->R:Lcom/unionpay/tsmservice/UPTsmAddon$UPTsmConnectionListener;

    invoke-virtual {v0, v1}, Lcom/unionpay/tsmservice/UPTsmAddon;->addConnectionListener(Lcom/unionpay/tsmservice/UPTsmAddon$UPTsmConnectionListener;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->Z:Lcom/unionpay/tsmservice/UPTsmAddon;

    invoke-virtual {v0}, Lcom/unionpay/tsmservice/UPTsmAddon;->bind()V

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x1

    :try_start_0
    new-array v0, v0, [Ljava/lang/String;

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->Z:Lcom/unionpay/tsmservice/UPTsmAddon;

    const/16 v2, 0x3e9

    invoke-virtual {v1, v2, v0}, Lcom/unionpay/tsmservice/UPTsmAddon;->getPubKey(I[Ljava/lang/String;)I

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->aa:Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method private e()I
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->b:Landroid/content/Context;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic e(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->N:I

    return v0
.end method

.method static synthetic f(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 2

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->N:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->N:I

    return v0
.end method

.method static synthetic g(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 2

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->N:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->N:I

    return v0
.end method

.method static synthetic h(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnEditorListener;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->Q:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnEditorListener;

    return-object v0
.end method

.method static synthetic i(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->Y:Z

    return v0
.end method

.method static synthetic j(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->x:I

    return v0
.end method

.method static synthetic k(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->A:I

    return v0
.end method

.method static synthetic l(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->C:I

    return v0
.end method

.method static synthetic m(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->E:I

    return v0
.end method

.method static synthetic n(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->G:I

    return v0
.end method

.method static synthetic o(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->I:I

    return v0
.end method

.method static synthetic p(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->y:I

    return v0
.end method

.method static synthetic q(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->z:I

    return v0
.end method

.method static synthetic r(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->D:I

    return v0
.end method

.method static synthetic s(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->F:I

    return v0
.end method

.method static synthetic t(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->H:I

    return v0
.end method

.method static synthetic u(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->J:I

    return v0
.end method

.method static synthetic v(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->B:I

    return v0
.end method

.method static synthetic w(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->b:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic x(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->K:I

    return v0
.end method

.method static synthetic y(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->L:I

    return v0
.end method

.method static synthetic z(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->t:I

    return v0
.end method


# virtual methods
.method public clearPwd()V
    .locals 1

    :try_start_0
    invoke-static {}, Lcom/unionpay/tsmservice/utils/IUPJniInterface;->cPD()V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->N:I

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/UnsatisfiedLinkError;->printStackTrace()V

    goto :goto_0
.end method

.method public getCurrentPinLength()I
    .locals 1

    iget v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->N:I

    return v0
.end method

.method public getEncryptPin()Ljava/lang/String;
    .locals 2

    const-string v0, ""

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->aa:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->aa:Ljava/lang/String;

    invoke-static {v0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getEncryptPin(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const-string v0, ""

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p1}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public hide()V
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    :cond_0
    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->P:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnHideListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->P:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnHideListener;

    invoke-interface {v0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnHideListener;->onHide()V

    :cond_1
    return-void
.end method

.method public setAnimationStyle(I)V
    .locals 0

    iput p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->M:I

    return-void
.end method

.method public setDelKeyDrawableSelector(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->o:Landroid/graphics/drawable/Drawable;

    iput-object p2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->q:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public setDoneKeyDrawableSelector(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->n:Landroid/graphics/drawable/Drawable;

    iput-object p2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->p:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public setDoneKeyEnable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->X:Z

    return-void
.end method

.method public setDoneKeyRightMode(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->Y:Z

    return-void
.end method

.method public setKeyAreaPadding(IIII)V
    .locals 1

    iput p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->G:I

    iput p2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->H:I

    iput p3, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->I:I

    iput p4, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->J:I

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->f:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;->setPadding(IIII)V

    return-void
.end method

.method public setKeyBoardSize(II)V
    .locals 4

    if-ltz p1, :cond_0

    iput p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->x:I

    :cond_0
    if-ltz p2, :cond_1

    iput p2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->y:I

    :cond_1
    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->c:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    iget v2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->x:I

    iget v3, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->y:I

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public setKeyboardAudio(Z)V
    .locals 3

    const/4 v2, 0x0

    const/4 v0, -0x1

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->S:Landroid/media/AudioManager;

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->S:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v0

    :cond_0
    if-eqz p1, :cond_1

    iget-boolean v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->W:Z

    if-eqz v1, :cond_2

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->U:Z

    :goto_0
    if-nez v0, :cond_1

    iput-boolean v2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->U:Z

    :cond_1
    return-void

    :cond_2
    iput-boolean v2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->U:Z

    goto :goto_0
.end method

.method public setKeyboardBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->k:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->c:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->k:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method

.method public setKeyboardPadding(IIII)V
    .locals 1

    iput p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->C:I

    iput p2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->D:I

    iput p3, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->E:I

    iput p4, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->F:I

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->c:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    return-void
.end method

.method public setKeyboardStartPosition(II)V
    .locals 1

    if-ltz p1, :cond_0

    if-ltz p2, :cond_0

    iput p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->v:I

    iput p2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->w:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->j:Z

    :cond_0
    return-void
.end method

.method public setKeyboardVibrate(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->V:Z

    return-void
.end method

.method public setNumKeyBackgroud(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->s:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public setNumKeyMargin(II)V
    .locals 1

    if-ltz p1, :cond_0

    iput p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->B:I

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->f:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;

    invoke-virtual {v0, p1}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;->setVerticalSpacing(I)V

    :cond_0
    if-ltz p2, :cond_1

    iput p2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->A:I

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->f:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;

    invoke-virtual {v0, p2}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;->setHorizontalSpacing(I)V

    :cond_1
    return-void
.end method

.method public setNumberKeyColor(I)V
    .locals 0

    iput p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->t:I

    return-void
.end method

.method public setNumberKeyDrawableSelector([Landroid/graphics/drawable/Drawable;[Landroid/graphics/drawable/Drawable;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->l:[Landroid/graphics/drawable/Drawable;

    iput-object p2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->m:[Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public setNumberKeySize(I)V
    .locals 0

    if-ltz p1, :cond_0

    iput p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->u:I

    :cond_0
    return-void
.end method

.method public setOnEditorListener(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnEditorListener;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->Q:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnEditorListener;

    return-void
.end method

.method public setOnHideListener(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnHideListener;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->P:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnHideListener;

    return-void
.end method

.method public setOnShowListener(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnShowListener;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->O:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnShowListener;

    return-void
.end method

.method public setTitleBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->d:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, p1}, Landroid/widget/RelativeLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method

.method public setTitleColor(I)V
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->h:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method public setTitleConfirmDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->e:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->e:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->e:Landroid/widget/ImageView;

    new-instance v1, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$2;

    invoke-direct {v1, p0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$2;-><init>(Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-void
.end method

.method public setTitleDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    const/4 v1, 0x0

    iput-object p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->r:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->h:Landroid/widget/TextView;

    invoke-virtual {v0, p1, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->h:Landroid/widget/TextView;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    return-void
.end method

.method public setTitleDrawablePadding(I)V
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->h:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    return-void
.end method

.method public setTitleDrawableSize(II)V
    .locals 3

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->r:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->r:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1, v1, p1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->h:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->r:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1, v2, v2, v2}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method

.method public setTitleFont(Landroid/graphics/Typeface;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->h:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_0
    return-void
.end method

.method public setTitleHeight(I)V
    .locals 2

    if-gtz p1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->z:I

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->c:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->d:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g:Landroid/widget/PopupWindow;

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->c:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    :goto_0
    return-void

    :cond_0
    iput p1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->z:I

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->d:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method

.method public setTitleSize(I)V
    .locals 3

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->h:Landroid/widget/TextView;

    const/4 v1, 0x0

    int-to-float v2, p1

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    :cond_0
    return-void
.end method

.method public setTitleText(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->h:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public show(Landroid/view/View;)V
    .locals 4

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->i:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->i:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$b;

    invoke-static {}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$b;->a()V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->i:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$b;

    invoke-virtual {v0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$b;->notifyDataSetChanged()V

    :cond_0
    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->f:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;

    invoke-virtual {v0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$a;->requestLayout()V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->c:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->invalidate()V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g:Landroid/widget/PopupWindow;

    iget v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->x:I

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setWidth(I)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g:Landroid/widget/PopupWindow;

    iget v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->y:I

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setHeight(I)V

    :cond_1
    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g:Landroid/widget/PopupWindow;

    iget v1, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->M:I

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->O:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnShowListener;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->O:Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnShowListener;

    invoke-interface {v0}, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard$OnShowListener;->onShow()V

    :cond_2
    iget-boolean v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->j:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g:Landroid/widget/PopupWindow;

    const/16 v1, 0x33

    iget v2, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->v:I

    iget v3, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->w:I

    invoke-virtual {v0, p1, v1, v2, v3}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    :goto_0
    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->update()V

    :cond_3
    return-void

    :cond_4
    iget-object v0, p0, Lcom/unionpay/tsmservice/widget/UPSaftyKeyboard;->g:Landroid/widget/PopupWindow;

    const/16 v1, 0x50

    invoke-virtual {v0, p1, v1, v2, v2}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    goto :goto_0
.end method
