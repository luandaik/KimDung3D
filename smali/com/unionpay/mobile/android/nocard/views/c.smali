.class final Lcom/unionpay/mobile/android/nocard/views/c;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/nocard/views/b;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/nocard/views/b;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/nocard/views/c;->a:Lcom/unionpay/mobile/android/nocard/views/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onPreDraw()Z
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/c;->a:Lcom/unionpay/mobile/android/nocard/views/b;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/b;->a(Lcom/unionpay/mobile/android/nocard/views/b;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/c;->a:Lcom/unionpay/mobile/android/nocard/views/b;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/c;->a:Lcom/unionpay/mobile/android/nocard/views/b;

    invoke-static {v1}, Lcom/unionpay/mobile/android/nocard/views/b;->a(Lcom/unionpay/mobile/android/nocard/views/b;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/b;->a(Lcom/unionpay/mobile/android/nocard/views/b;I)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/c;->a:Lcom/unionpay/mobile/android/nocard/views/b;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/c;->a:Lcom/unionpay/mobile/android/nocard/views/b;

    invoke-static {v1}, Lcom/unionpay/mobile/android/nocard/views/b;->a(Lcom/unionpay/mobile/android/nocard/views/b;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getTop()I

    move-result v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/b;->b(Lcom/unionpay/mobile/android/nocard/views/b;I)I

    const/4 v0, 0x1

    return v0
.end method
