Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520296;
	b=QA/fOAEFcg3NWMsmO6IGdEByxdSZ2KCJVkzItukq/JvuVbN473nrRK0TJeDDGzfZQ+Yq
	 9CTsDsrYuMHtKUCkq4VpF3hiSyiwL4ucwqn4McqAXo/meJAEEPDWnGu/1qG3bo31ypGqD
	 1e/thI7SGDEW0UyUgkUEqjxkzsQIeCXFpAp268otg+8QFNYWreZkHRVjET0qasCpxrWKa
	 3pZKArxtiDQ44DmpejS6giwVShocynTes42C0vzD+5ais3yygXBuTXVLa3zRHwtZkiQ/d
	 5qRcu0pTa/fHi8ZK+fJJYa6vm3qIUJN111/hB7fsg2Z3fMlAZHuemDeKJEubnDOjVFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520296;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LBS6RLC7nr5rY+9EC1CBYV3oWXOpIUvumoRNMJiBILE=;
	b=qwLVUOmhs639U/xt1VwYz23dnM33OI8JJ9A1zicBYcZgwa2wdmw3OBmEwyFFDGpdyukw
	 M7HfF6BIL72MvZw7LLLbqz3ZmPV4uUAWEHuRvZVLzjRsYilp/8E+b6nbBNr1p4WXSj/Xi
	 reQS+Eg6OxUQvUi8gdUk6IS+ux6mQzf4nD6Y2uYJbLus46SEoYOSvYXiLItuUX9D9tNKQ
	 4F+duw2Kq75Ck9xjFiI4y7cJBjfElEI6PGYIzAso9OggMNgIdh/xhJaEtH7/yiLmtnu5M
	 Q/YMBFECMo5kfObV4FXG7tpsO55866KGa6Ee54jjQvSf+9Syyd9c5eBlRE/YoAkoDZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=Ml2HHjIV;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yRlToY6r;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AD3606A683
	for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 11:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47AD3606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=Ml2HHjIV;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yRlToY6r
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id A1380EC0D29
	for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 06:38:15 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 24 Nov 2026 06:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795520295;
	 x=1795606695; bh=LBS6RLC7nr5rY+9EC1CBYV3oWXOpIUvumoRNMJiBILE=; b=
	Ml2HHjIVLBmi22/cQDI2PU6Tpq2FEdQKpw3kauuTJM5FBoD8AV3ZXLBJVA16EKAg
	UpSFCJci6HvS+QYL0Nh9Cn9563Yr67tiZXwYLVzQVdM9Zyl1Qmgco7K2LAhjZ9vG
	I1zOXLGL9ZDty1f3UnF/rOibRsEsjvBnrBZJR5khZUnVlbiHFP3fBb+5D2OhWbOt
	z/5iOuexMKNqngPWOxu+E8OTeIWWoqvv4CR3UIizAbUiuFQrIJdE2jZq7EVNJsQb
	HWXzQsJBKL+SYcGmOJNVq7HN9L9zc1+XbCwv3fAquB3Sbx/EueJ+2yQZahlC1hR1
	WZnlEXNPSQA5EduZUsA8Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795520295; x=
	1795606695; bh=LBS6RLC7nr5rY+9EC1CBYV3oWXOpIUvumoRNMJiBILE=; b=y
	RlToY6r9RVKdw3T0oHPku3hnFba/+xHI26C3lL6YknlOsXrRy9qNyxmzmA9SUcKn
	hTr30fQh/UnClOVsFIXrwGMjGzIxCeD9peY1KCYVeTLIHg7mP91MBM6HGnMZBIk6
	6dyZR/CFFTQ0EeCJIfvHU4zYuZL+mA/xUWjT1ogoVgTt6qYcK/uI8+ITiZwftS0m
	OcWQbWIBft0ZXD7tyjp5jY+InE+7HvqRAIQ/JDGCIp8qMD1UD+1ceVFjIG7wx3Gz
	3iEOVMrcApMfe2Tl7YyNmitJJfq8xFL8ESrcp7Wm6cwZI3skbzsb7uYOgtC0Axoq
	qlZT0oTmKlxzIMPiVyTVg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795520295; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PG5vdmEtZ3B1QGxpc3RzLmxpbnV4LmRldj4=;
	s=fm2:rsa-sha256:T92UaIGLUyGW8ABSXBW2yuj6A8FTMe6/HANrfvY+oF1U++J
	fxpoHx+EY4QpslLG0oQruV/bgqxorkKJoMYDjmheRFQeyR2Phk9C7YOmvQwdByan
	gdgGh6NY/tHk1l9O5DrHr4FY2Cem+bFDdJ+T231ms0ZmbeGcHr1sdGChT3MxyjuZ
	Zg6EwYWwIltFf0OZynaivxjCtxF9SZl56iSIETl17l/M24n4389JyrOfhwdaauw4
	RUeWCxVGtnTcAc1y8ea1ypY4XyGvErT6T9FJGKf5Lv8Aj7nZY+N1GKn7nQoIqwSi
	bo8P3VwEDSAs245K4EPqwpaREkEQAl7Pu2XWcqg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:p1f7ejuhjRxJdgmNxQxQXaN7NqyiljR/JdO1ok1Uhn8=:LQel8x6QtVyh/7CIDEVkPyteoYgugqgpOlb8FoB6o2k=;
X-ME-Sender: <xms:JncFa8apghQkp6cv5WRydIpQSnXdx2pRYRbtCS5XwPatW6G8QEzYWA>
    <xme:JncFa4fkYj7Z8w7A3Q3LZwo6kLg7Yu4tEgakiRzKk2wWtTFIsXoaZ97Gb3EZLDp9c
    yaOWPplJT1Ilh1seLQv84e9rdBw7vsZfnWO7Y0CBg_MPHzDyDwsIg0>
X-ME-Received: <xmr:JncFa55saF6nPYWtTR7cPJqCZ_UapqLvb5FX23Tv3afNWrz8bjwrsqMUn-sulpIikRXCJ4YNaTVS8v75GIzhTSSml7zc55Op23hl9w>
X-ME-Proxy-Cause: dmFkZTEi1u8ZMwVyqOiTzaB5nCgQcMSKjrx2d8uxxaZVl2DDoMbectsBXLn1EPTO3E1O/O
    K4nOoNpYML5hUgCFInvffe60Gbw2e3155wRkpnYBsWVK36LeQEWj6rHA4TjwwV3W05Wlnc
    v3iXUk56hHbGe/bPS/wVWMHL5dS6ObItRFggCiA5xVLRjV31YVX7em8YkRNv/H2DvA69is
    zRCzcZ9lIiCv/o1/PdqCcFGNyU0DjuMrllWRGVTahiHlwQySUlP9qHvPzBbSZBk2OyDCSn
    EaXOnzefw4JMsq8ZHTzWueE+oVLNCozuLarSAdSMJhJYFDkycjqzbqRNET9y1X7hwJ00pS
    Z6d0Y/Ndj/BNGBx8tSvwOt8sf2YpEHAiN/FW1ceaGqVmmoZTCghnWYqskUV8WRL6+ttn2V
    DrKW7m5dGHZuf9ZM6F3NNYC56fiDx2ocTHh33LGJow5AV6vLCC6Wcd7fpFWQIcEfqLMTLg
    FCadx28S3oZyORQr6VSstrOKdnis/CNv321UmREt/VhF0jNPh+QHR8ab5ViepNhieBh6XC
    TGGAjmmQt71QfDVYBzo8TmQuvmHFGOelLGFqgWMIio7Xq0x1jkecJ10Bnz5iPWqfuT7K7w
    7FbDt37+ERFpDNQ/enh3FW0I08KbxTuI2alifz2nUtj0OJ21hcynDFexzRhg
X-ME-Proxy: <xmx:JncFa0V5jnwh5zLXJNPGuNmQt_Bjf6pTxKSkgdKqGWUTxCaYk7ER7Q>
    <xmx:JncFawZciskPwj9K_2wARH3KDKNW20IPs8OMlUW3_4RGTgTaLStBng>
    <xmx:JncFazwrY5IgW9enruc4Zo9PjB0lRV--hDELAy_wya2loQRUC-hvYg>
    <xmx:JncFa9KoJXvMausp7xB3nftvFu0BrAw2uql98pfHcc-hgVZxFDDixA>
    <xmx:J3cFa2arXdMTeICI8KvrzyDY2NWV-Qgx5Qh1J6cd0PcZPPPOvsdkQF30>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 06:38:14 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Tue, 24 Nov 2026 12:37:47 +0100
Subject: [PATCH v2 5/5] rust: drm: gem: shmem: Do not free SG table of
 imported objects
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-rust-drm-gem-shmem-imported-sgt-v2-5-000f7a9ccb8d@jannau.net>
References: <20261124-rust-drm-gem-shmem-imported-sgt-v2-0-000f7a9ccb8d@jannau.net>
In-Reply-To: <20261124-rust-drm-gem-shmem-imported-sgt-v2-0-000f7a9ccb8d@jannau.net>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sami Tolvanen <samitolvanen@google.com>, Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, stable+noautosel@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=LQel8x6QtVyh/7CIDEVkPyteoYgugqgpOlb8FoB6o2k=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhmzWcvGaDf592rKZU7iPZvXFLdZ8umHys6ltrtOfPe1+O
 slYM+JLRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIm06DP8s79kwhC2jXuWoL5F
 +ekXoq/vnjr2yrvVu+5O2l9vbWmFB4wMU1svndvcvv05l/Frx7XX+hjly4/u/1XyVu6VLl/r0RY
 rHgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

GEM shmem objects imported through gem_prime_import_sg_table wrapping
drm_gem_shmem_prime_import_sg_table() do not own their SG table.
SGTableMap::drop() must not free it since it will be freed on exporter
side once the DMAbuf is not used anymore.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Fixes: 616c229ab010 ("rust: drm: gem: Introduce shmem::Object::sg_table()")
Cc: <stable+noautosel@kernel.org> # no in-tree users
Signed-off-by: Janne Grunau <j@jannau.net>
---
 rust/kernel/drm/gem/shmem.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index d6977673e21a..d935384f5c1e 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -611,9 +611,13 @@ impl<T: DriverObject> Drop for SGTableMap<T> {
     fn drop(&mut self) {
         // SAFETY: `obj` is always valid via our type invariants
         let obj = unsafe { self.obj.as_ref() };
+        if obj.is_imported() {
+            return;
+        }
         let _lock = DmaResvGuard::new(obj);
 
         // SAFETY: We acquired the lock needed for calling this function above
+        // and the GEM object is not imported.
         unsafe { bindings::__drm_gem_shmem_free_sgt_locked(obj.as_raw_shmem()) };
     }
 }

-- 
2.56.1

