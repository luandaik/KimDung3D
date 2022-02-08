.class public interface abstract Lcom/heitao/listener/HTLogoutListener;
.super Ljava/lang/Object;
.source "HTLogoutListener.java"


# virtual methods
.method public abstract onHTLogoutCompleted(Lcom/heitao/model/HTUser;Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/heitao/model/HTUser;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onHTLogoutFailed(Lcom/heitao/model/HTError;)V
.end method
