.class final Lcom/tencent/bugly/proguard/m$2;
.super Ljava/lang/Object;
.source "BUGLY"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/bugly/proguard/m;->a(I)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic a:I

.field private synthetic b:Lcom/tencent/bugly/proguard/m;


# direct methods
.method constructor <init>(Lcom/tencent/bugly/proguard/m;I)V
    .locals 0

    .prologue
    .line 255
    iput-object p1, p0, Lcom/tencent/bugly/proguard/m$2;->b:Lcom/tencent/bugly/proguard/m;

    iput p2, p0, Lcom/tencent/bugly/proguard/m$2;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .prologue
    .line 258
    iget-object v0, p0, Lcom/tencent/bugly/proguard/m$2;->b:Lcom/tencent/bugly/proguard/m;

    iget v1, p0, Lcom/tencent/bugly/proguard/m$2;->a:I

    invoke-static {v0, v1}, Lcom/tencent/bugly/proguard/m;->b(Lcom/tencent/bugly/proguard/m;I)Z

    move-result v0

    .line 259
    iget-object v1, p0, Lcom/tencent/bugly/proguard/m$2;->b:Lcom/tencent/bugly/proguard/m;

    invoke-static {v1}, Lcom/tencent/bugly/proguard/m;->c(Lcom/tencent/bugly/proguard/m;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/tencent/bugly/proguard/m$2;->a:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/tencent/bugly/proguard/m$2;->b:Lcom/tencent/bugly/proguard/m;

    invoke-static {v3}, Lcom/tencent/bugly/proguard/m;->a(Lcom/tencent/bugly/proguard/m;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 260
    return-void

    .line 259
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
