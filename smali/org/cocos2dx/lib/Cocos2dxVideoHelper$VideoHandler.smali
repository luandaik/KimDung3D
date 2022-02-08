.class Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;
.super Landroid/os/Handler;
.source "Cocos2dxVideoHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "VideoHandler"
.end annotation


# instance fields
.field mReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lorg/cocos2dx/lib/Cocos2dxVideoHelper;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;)V
    .locals 1
    .param p1, "helper"    # Lorg/cocos2dx/lib/Cocos2dxVideoHelper;

    .prologue
    .line 74
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 75
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->mReference:Ljava/lang/ref/WeakReference;

    .line 76
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 80
    const-string v1, "cocos2d-x debug info"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handleMessage  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 155
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 156
    return-void

    .line 83
    :pswitch_0
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->mReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;

    .line 84
    .local v0, "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->access$000(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;I)V

    goto :goto_0

    .line 88
    .end local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    :pswitch_1
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->mReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;

    .line 89
    .restart local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->access$100(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;I)V

    goto :goto_0

    .line 93
    .end local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    :pswitch_2
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->mReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;

    .line 94
    .restart local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    iget v2, p1, Landroid/os/Message;->arg1:I

    iget v3, p1, Landroid/os/Message;->arg2:I

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-static {v0, v2, v3, v1}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->access$200(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;IILjava/lang/String;)V

    goto :goto_0

    .line 98
    .end local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    :pswitch_3
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->mReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;

    .line 99
    .restart local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->access$300(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;I)V

    goto :goto_0

    .line 103
    .end local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    :pswitch_4
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->mReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;

    .line 104
    .restart local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    iget-object v6, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v6, Landroid/graphics/Rect;

    .line 105
    .local v6, "rect":Landroid/graphics/Rect;
    iget v1, p1, Landroid/os/Message;->arg1:I

    iget v2, v6, Landroid/graphics/Rect;->left:I

    iget v3, v6, Landroid/graphics/Rect;->top:I

    iget v4, v6, Landroid/graphics/Rect;->right:I

    iget v5, v6, Landroid/graphics/Rect;->bottom:I

    invoke-static/range {v0 .. v5}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->access$400(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;IIIII)V

    goto :goto_0

    .line 109
    .end local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    .end local v6    # "rect":Landroid/graphics/Rect;
    :pswitch_5
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->mReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;

    .line 110
    .restart local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->access$500(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;I)V

    goto :goto_0

    .line 114
    .end local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    :pswitch_6
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->mReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;

    .line 115
    .restart local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->access$600(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;I)V

    goto :goto_0

    .line 119
    .end local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    :pswitch_7
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->mReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;

    .line 120
    .restart local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->access$700(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;I)V

    goto/16 :goto_0

    .line 124
    .end local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    :pswitch_8
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->mReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;

    .line 125
    .restart local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    iget v1, p1, Landroid/os/Message;->arg1:I

    iget v2, p1, Landroid/os/Message;->arg2:I

    invoke-static {v0, v1, v2}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->access$800(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;II)V

    goto/16 :goto_0

    .line 129
    .end local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    :pswitch_9
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->mReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;

    .line 130
    .restart local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    iget v1, p1, Landroid/os/Message;->arg2:I

    if-ne v1, v4, :cond_0

    .line 131
    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, v1, v4}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->access$900(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;IZ)V

    goto/16 :goto_0

    .line 133
    :cond_0
    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, v1, v5}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->access$900(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;IZ)V

    goto/16 :goto_0

    .line 138
    .end local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    :pswitch_a
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->mReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;

    .line 139
    .restart local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->access$1000(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;I)V

    goto/16 :goto_0

    .line 143
    .end local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    :pswitch_b
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->mReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;

    .line 144
    .restart local v0    # "helper":Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    iget v1, p1, Landroid/os/Message;->arg2:I

    if-ne v1, v4, :cond_1

    .line 145
    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, v1, v4}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->access$1100(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;IZ)V

    goto/16 :goto_0

    .line 147
    :cond_1
    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, v1, v5}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->access$1100(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;IZ)V

    goto/16 :goto_0

    .line 81
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_4
        :pswitch_3
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
    .end packed-switch
.end method
