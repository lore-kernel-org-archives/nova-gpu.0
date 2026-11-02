Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793603873;
	b=c3fEGaTHC661nssmu8yEDy+LGJZh6ER8diJkprJRYWqffOuCJYj5b1Pn54ALrGzzKv32
	 gyEHonoW2FRTgGeFp/zmt163Zhz+fYuoimHYiJK/VK55lCNveRUeDWCPQS72z4Ft6qxoE
	 GzTydvrJvgoLyKqVEhT683rjUeicnxB9cCbaNn/SGzh4aVUHvbOYVWed6AfOhl080pSYk
	 YnzFEYUIaDNSQjucOBg0ymQIs3IZigGSip5dxkT9HcvUiOM/EqwqvIohw6Ab5fdo9XyvR
	 zx8FDpxW9P17Nl3Sx0zEafXC2ewTgSjo1InXlnuhgyEr96zZs4IdAbeeB3mM2MgFNZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603873;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CIZwBicKTVVZGS9q/v6H0FbAbpUFwd+2SA14hRFFKAg=;
	b=pQyduWb0U0Erypo3h7B3MZAw4wRx+zv8PbfXKIX9+yOZvgNb2/KnLXxGzkJ4fc5zY7aU
	 dltSX0tgDOjcHwTPEyc1IXK0GUKr5fq7GKnMsocwR4cRsJPPosrVuGPLd0NS/QPzQ8A8Q
	 JIh08Vp4yiriUxk5cykNCa3TmBaqhQzQifBydtAVEJ/1erZmX86UkafI7odEPTBAottFp
	 oxU2xIKIqAeSewvEMGZWZjcFWxbOOmhH9NLPcRPm4Rn9zcqkpGdMSnYuEMvKEROWU01I6
	 ciJeyGd7ewlWR6GudpNNq3y2cWLVBE63gkvdJZz8BAVcmuwjBNz0SCxJngB411zT2iA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrNK0n+Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C0C606A333
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 07:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrNK0n+Y
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793603872;
	b=muFfu54Jz5UPvvaYMUW9MtgbkIz057L1/1AxbnddU9FB6I1yEpZRGF3opaangEnZAwWI
	 874g64x04raoR3XdQJBPcCMskhPrCKgbi2TqkmYPPsN2EUre68ClZr/7NDE9T1D+hnaDv
	 G9hNMvVco1BWWB9KKECzmsCcx9zwmQzlnVFi0Wng8DQQnVNJxbyDkdRxsTUB3pM1ds1x/
	 WyhralMhFhBUec/zQbV4yvRnifvzc0+e6GiY3Lx9zwIPIXMYrUh6pf+g88r2WlGKdVpx+
	 nVcSf3EoEuMuu+IVF0rLvwU3in7AugHM7Q1Oy/VQzPWC8KAsHVlRo8gtQQd5r0RcF1g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793603872;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CIZwBicKTVVZGS9q/v6H0FbAbpUFwd+2SA14hRFFKAg=;
	b=UATK2Nu29DOJyLSqn2ZqtMNS4m4olHEKOrqP5raQq5TRHbCkv/0Lk3V3Jk0tLPsXL0oc
	 ct0E9Ysk20DYhIFBqeIARc3dlTRyfAU8t8dg+vssyuU9NBUVAK6F/YUqVy7fqkC5RSY9Z
	 5kjXfMPdacQy6Cd4/QkWuAPQC9EzcsIX5t+pmPBcw6rT80h20zKJ5Sw65LPVGZKKaKv72
	 GR4wYIJ93DQgXTEItUNv7WGbo+oZgox35f5dtQzgJeCcCIqoYWZ0i25wu/Ouv5WIZ5iaT
	 qwoaIN4KTwpQXMBlL6+80o7gET2PJqyj6yPwick14Y3escIcSCARtP8x9y0DFyRxkKA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A67111F000C1;
	Mon,  2 Nov 2026 07:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793603872;
	bh=CIZwBicKTVVZGS9q/v6H0FbAbpUFwd+2SA14hRFFKAg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TrNK0n+YU+rlsW24+taaQ+ZmcXg7a/Eb9sYTev18p7Ye36VNPdXlyU9nBK49aXEsL
	 H0DEveNZyDHlwQXApJVGbBbg2HwLdBP22nJTBVuaHV5gc/YjgT6tKeBTIHuUJR+vgm
	 A6LKxi+8UkSvynzLl1eu5e11aFKvgF/NaImvDGSbzGtCerUWEtlLRr0e9FvUT2Nj/z
	 V1fRDgg9s3GyBrdXwA7USXvGVg3RPY5VFk3aJK1QsaO2cH3PKeSYi+Pb+Y3Kiy+4Ww
	 u3q7hQz0RcqavvrreT4xDruKT7VwUiK4AtL6Q67E5yOg2K0oqNV11iqE79WhYgdWe3
	 +gEtO6gkLispA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1A7E2463E2;
	Mon,  2 Nov 2026 07:17:51 +0000 (UTC)
From: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>
Date: Mon, 02 Nov 2026 17:17:40 +1000
Subject: [PATCH 1/2] rust: time: expose as_nanos for clock sources.
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261102-nova-timer-v1-1-b347ead64469@redhat.com>
References: <20261102-nova-timer-v1-0-b347ead64469@redhat.com>
In-Reply-To: <20261102-nova-timer-v1-0-b347ead64469@redhat.com>
To: Andreas Hindborg <a.hindborg@kernel.org>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Gary Guo <gary@garyguo.net>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Alexandre Courbot <acourbot@nvidia.com>
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=792; i=airlied@redhat.com;
 h=from:subject:message-id;
 bh=pY3ItZTyRBqrXe1s0swCsV4mLrXTPTHBAc2wQUfEkfs=;
 b=owEBbQKS/ZANAwAKAQx081l5xIa+AcsmYgBq6Dkd4edhhC5d0PBanFuqdPfSRLxn9C0KZMcmq
 R6QvApbHsmJAjMEAAEKAB0WIQQQptkdobBb0p9t66wMdPNZecSGvgUCaug5HQAKCRAMdPNZecSG
 vknnD/9PIRPEaWJ4iBZf/3M0f+Df4OQr8YuCkj7JIwVU2Hnp7HUgZpT96c4YCpNG6vX4IETenYO
 /f0MDQ/so5SHJBFdgge3192sTNTBNcWp6NrHOneIJQ7aVVTlV1uapVKyYkL0PkPKzr9xyvYyy6y
 v1GMlXiEf0z9s60gkdAO6hCUwGTQ5RlpAQE0NnuK6eI6L6jGuSXSIkCKyNhqrSdg2/UQA/szels
 44vV3DRWgbqrrCZyLigaolG7ytwHiT12K48tjrvr7je+qENQwIXBUXQEdqm3+WhCzVCLfzEaMUZ
 cKZXirLWKD16DkvpVbT38zT6lwqC3ptd1lbdcgWff64glQc96qtUZ82YOW1mm6Ji5g3sFqFzUlY
 DOClNG3bZ504qiPe6ZS3upbhtlFz1W/XV6RN0OO4upppvN2RpAWDqAhMDN7gt70iDhcKTHg2QIB
 UM7N0Zb0AjyB/FXvk0sdTrE1QVkFcTaufQX02l7EJb/ifx+Gtzu/UPDsCivHq0fQ9IdXeQuoJG2
 rx6O1Ubz8zrAQD7TXXkg/hd4gUhZywL8FxxYRpFpt5nLxbkb0cjeljOOSdImu+hq/yw0QgSquUp
 5WOvQUrEJ2jJ5A6JKvpTZLST0YrQnx2CCZ5w09+j/wvEEajk4RM9FD3KHMFQoUIIbstIBJ8B1+1
 J7Bqp1pdkqV/lww==
X-Developer-Key: i=airlied@redhat.com; a=openpgp;
 fpr=10A6D91DA1B05BD29F6DEBAC0C74F35979C486BE
X-Endpoint-Received: by B4 Relay for airlied@redhat.com/default with
 auth_id=1321
X-Original-From: Dave Airlie <airlied@redhat.com>
Reply-To: airlied@redhat.com
Content-Transfer-Encoding: 7bit

From: Dave Airlie <airlied@redhat.com>

The nouveau C driver does ktime_to_ns(ktime_get()) to program
the cpu ns into some hw/fw, so allow this method for rust drivers.

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 rust/kernel/time.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 6c0a5e8090d0..a91ddf04785b 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -211,8 +211,9 @@ pub fn elapsed(&self) -> Delta {
         Self::now() - *self
     }
 
+    /// Return the raw nanoseconds values since the epoch of clock `C`.
     #[inline]
-    pub(crate) fn as_nanos(&self) -> i64 {
+    pub fn as_nanos(&self) -> i64 {
         self.inner
     }
 

-- 
2.56.0


