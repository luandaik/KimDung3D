.class public Lorg/cocos2dx/TerransForce/TFNotificationMessage;
.super Ljava/lang/Object;
.source "TFNotificationMessage.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x61fae8156e60bc61L


# instance fields
.field private id:I

.field private mark:J

.field private message:Ljava/lang/String;

.field private repeatTimes:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JI)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "mark"    # J
    .param p4, "id"    # I

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->message:Ljava/lang/String;

    .line 38
    iput-wide p2, p0, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->mark:J

    .line 39
    iput p4, p0, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->id:I

    .line 40
    return-void
.end method


# virtual methods
.method public getId()I
    .locals 1

    .prologue
    .line 30
    iget v0, p0, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->id:I

    return v0
.end method

.method public getMark()J
    .locals 2

    .prologue
    .line 23
    iget-wide v0, p0, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->mark:J

    return-wide v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getRepeatTimes()I
    .locals 1

    .prologue
    .line 49
    iget v0, p0, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->repeatTimes:I

    return v0
.end method

.method public setId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 33
    iput p1, p0, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->id:I

    .line 34
    return-void
.end method

.method public setMark(J)V
    .locals 1
    .param p1, "mark"    # J

    .prologue
    .line 27
    iput-wide p1, p0, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->mark:J

    .line 28
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 20
    iput-object p1, p0, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->message:Ljava/lang/String;

    .line 21
    return-void
.end method

.method public setRepeatTimes(I)V
    .locals 0
    .param p1, "times"    # I

    .prologue
    .line 46
    iput p1, p0, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->repeatTimes:I

    .line 47
    return-void
.end method
