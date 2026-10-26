Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792983420;
	b=NB6E4es2+OtPHKXiJ5uLwGgpS8hj8eC4L4S57YRvg9+xL6xc4m+v05dQbGwsSnJX9Tit
	 ryHgPlC+NHmbQFuzYl0MPlXVvaMY65NNvoWktpNiylqJdOHxdZzj6dVjSM6By1GsFRCb0
	 zA+fUGcR8xQ5eHpwy++wyrtCY0f6A6mvq2Mn5IiMMxAWeXpymH1PEJAK4aX3iNs9t5HJX
	 h9v1IKeXR9AF3+uztxT7EE0E0clPUWNwYWYFdR6c3lDRUtohpFEt57hflpo2Gw+LU+cRc
	 zHoaT1ARRGp2fTDb6O39uB5kB5gm0NKQvZhKIPkCiDdog58EEmXSRZEaRQ8VFSo2G5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792983420;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tVrzdR8sdXpnt9eXbPVSfxEJoSMAljVeXKQP9XXOyM8=;
	b=N+ZpRnQbm17galr/dl7GEtC4G5WBS7DnWn/2A4SROcOYs1pLvYcPKmpcfCnFfVNU68AE
	 VaiVjpk3WZRcAXMFY04a85rRfo1aD/HseWuy0hy4/QZ49fZlt4m2X8r3yxubbBcrMLePz
	 Iyqz81RqC2skYMzYCLrzH2QrjFO4QH0jfRWtkLDprZzMEATtVk9dFOmYnNtA+lGB2DIxp
	 kWy0B7cZExGXPhm+/RXXIfHUhzmai23mthZQohYFzdczg74APTdwvlaDcORby3nHxZEDg
	 M8FXyAYr2mGwyT+CPwzCvAl1IpJR74OerNUAfFYfEAq6rxPRrjBLEbuAAcrwAgHgNPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hA5mhTTy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3984A606A31A;
	Mon, 26 Oct 2026 02:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hA5mhTTy
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792983419;
	b=qJAa/eLhZDiZYwqI98JjhwUbWjZ2aevb6KcUN+4inTjrL8yaSg5Nki5rYCar0tYcvUzc
	 NopzixwRXhL1lPBXjKpXsPWkjy58eIlM8y5Y3Qyhzl0cbhVobEkZ0A3byUnZbDiZyG7LG
	 QPTV66a6ySn6ozr1gNZU7xkbdlSGyGm6z8M90nEdZtQi6yjKRyt/MFGVZKYmV6tcEnOAi
	 AKKMeeGn9gZgIEKoaG7nD0TVVESpffB7JdfRr5VNVPkDuvjrUz7csW7xillJ3tY3+VeN0
	 SeOuRbv5TWFlUuv6fI35Ktz4XPoSa/PavQ5wr+oWPgI4BbCfqFU7T1sVPcjEhRyO9qQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792983419;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tVrzdR8sdXpnt9eXbPVSfxEJoSMAljVeXKQP9XXOyM8=;
	b=mDbgQEEO+VFBDuY7PAuGmXR8tpvq6se+tLHI4fSwS1JWLEl8BXasgWu09+XAb0wl6e8A
	 tk82hmuN0QtUryQsyy1fbBktzKoU2FarKZ3vT7YvhrqsxWkk9ezZrkGjzC8KeAvgyDMcf
	 cyBSKz8I6+HCYqv+WN34jTf/R9LPtdlzTkezsigrvsCSYth9WA/NpnVu9FT4kAr2mQQLX
	 gDfvHgrOwQ5GQLIsT3piCs5hC/1HgQxVj2DZVzgb8Q2FLn82b4eIWjQPf9Sb4MxSIcLxg
	 /7pLHxFsMSBSMx5vRIQpgqEmkMRCuGY3B0u2B7vXPGHLIfKgM4yS06itkiPQbsfhb4w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3BA431F01829;
	Mon, 26 Oct 2026 02:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792983419;
	bh=tVrzdR8sdXpnt9eXbPVSfxEJoSMAljVeXKQP9XXOyM8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hA5mhTTySM4Dc7fjeOeHzYj7XUgZD9w7uCJRY0XEpfLEZ824FSzgWRokYpDPEXOIE
	 eZTbYj7iya9CWMGFVE0hVwNvnOYEGiWVi4RVzDXoh75VAHSlf2GvbP0XxDhzFBMQC6
	 MJObbTz/N/aSqucpZXLX4r5WySwMIEc4gPjmOcwzq5ehroRdtp5dGpM/Vw83qsIENg
	 9kVc5kH/rMw8Kv9iEyknCvBpzdW/BHo9tkYWvPy4svJqPajZkQEoNbwlFfOMpfVWyu
	 USNi6mixLjwj1MfeNPHll4UTLeG6Fy3MjW7xTrtgtMSNeq63nDNLLnTJ9m5SjvNE8u
	 F4H4VtOHKcHvQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A115E44BBB;
	Mon, 26 Oct 2026 02:56:58 +0000 (UTC)
From: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>
Date: Mon, 26 Oct 2026 12:56:48 +1000
Subject: [PATCH 1/2] rust/timer: expose as_nanos for clock sources.
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
Message-Id: <20261026-drm-rust-next-v1-1-14a4ae469175@redhat.com>
References: <20261026-drm-rust-next-v1-0-14a4ae469175@redhat.com>
In-Reply-To: <20261026-drm-rust-next-v1-0-14a4ae469175@redhat.com>
To: Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Lyude Paul <lyude@redhat.com>, 
 Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=728; i=airlied@redhat.com;
 h=from:subject:message-id;
 bh=FaDhVNX1ZRVIPh01nVKyHlUNaG65BCt2llMd3Ejbhi8=;
 b=owEBbQKS/ZANAwAKAQx081l5xIa+AcsmYgBq3sF5ffu6oD8lkLuacynLoQPYjFNgwsV2/dErZ
 N1B6yWSwx+JAjMEAAEKAB0WIQQQptkdobBb0p9t66wMdPNZecSGvgUCat7BeQAKCRAMdPNZecSG
 vvXKD/0Q7saaW3jlDG9yPONZZPG5DR8FZ2JihdC/yNTM/84Jp4yGr0+Qr5X7xA4M3Sj5ubF1qTW
 aHMQRw0kSM9X1RxbXUjhnJ61ydjL75px08kRuxAzGc//dUk3ABw6RXE38iZNZXav4rLJQ9tBrkx
 SjHmcYd53cMjry8EKtDkei9TIXZr6PS4S6X/oTlBr3HVy/GmND+5f4XujvPanx+3ptkFfxkzzNx
 R0zaXZyNFmabPwXTchL4kleByprmeCpdpAaicn3k05vZYdFynsJ7ieRLFBlw9RmwzxqpX21Q2PV
 ew+hyXfWsjPJy60yO1g27ehIoudf8pp+46EbaCUvURsLuTQ/otQgUjGjHd7ZiEHck+0X7vBjoSW
 jevcUvJ2sHvzEKZNaX55XOy+gja756rmMOkXKddozWKcejAGtfKXmaVZ91NMPJsPVV7tB29QiB/
 9tu7O8IdZnAZD1/VvoDa8kcAs2JA45P90gSo+6Knl/n40xWLP3NrUclhQhcM3pV47YGSZOCAfPJ
 9Hy/urfQ2E69s+YLmZhsubD054IzEL/2SJXuAC5jGBkTvP96pbOUQ01bQAASX9oi+JhdwFLoOBE
 9zQvxPqZxW+8bKW8n++vsR6Oc/kWQFhNlluWdhXhcTsWFSuztnl2spMooA2NJLk1uLP9aGx5Kp5
 I6OPwYhPK/PbmAQ==
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

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 rust/kernel/time.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 6c0a5e8090d0..7fc366842901 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -211,8 +211,9 @@ pub fn elapsed(&self) -> Delta {
         Self::now() - *self
     }
 
+    /// Return the raw nanonseconds values from the clock source.
     #[inline]
-    pub(crate) fn as_nanos(&self) -> i64 {
+    pub fn as_nanos(&self) -> i64 {
         self.inner
     }
 

-- 
2.56.0


