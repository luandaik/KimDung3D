.class final Lcom/unionpay/mobile/android/nocard/views/bg;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:I

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Lcom/unionpay/mobile/android/nocard/views/bd$a;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/nocard/views/bd$a;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/nocard/views/bg;->d:Lcom/unionpay/mobile/android/nocard/views/bd$a;

    iput p2, p0, Lcom/unionpay/mobile/android/nocard/views/bg;->a:I

    iput-object p3, p0, Lcom/unionpay/mobile/android/nocard/views/bg;->b:Ljava/lang/String;

    iput-object p4, p0, Lcom/unionpay/mobile/android/nocard/views/bg;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bg;->d:Lcom/unionpay/mobile/android/nocard/views/bd$a;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/bd$a;->a:Lcom/unionpay/mobile/android/nocard/views/bd;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bg;->d:Lcom/unionpay/mobile/android/nocard/views/bd$a;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/bd$a;->a:Lcom/unionpay/mobile/android/nocard/views/bd;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    const-string v1, "pay_success_click_activity"

    sget-object v2, Lcom/unionpay/mobile/android/utils/o;->i:[Ljava/lang/String;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/unionpay/mobile/android/nocard/views/bg;->a:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/unionpay/mobile/android/nocard/views/bg;->b:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-static {v0, v1, v2, v3}, Lcom/unionpay/mobile/android/nocard/views/bd;->a(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bg;->d:Lcom/unionpay/mobile/android/nocard/views/bd$a;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/bd$a;->a:Lcom/unionpay/mobile/android/nocard/views/bd;

    const-string v1, ""

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bg;->c:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/mobile/android/nocard/views/bd;->a(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
