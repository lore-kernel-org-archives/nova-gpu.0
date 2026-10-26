Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013387;
	b=f3LhlrOvCdzvgo50Ep+qHKCEtvsm3H97+RWQT5f9EQlhiKiDaNrltfxubiD65VQLfHkH
	 TVAiEdXoEQGmqYSeEr6D0L1i4G6wzCWjGWRkC9inwp5Dm8p4PF/quM0HTKHBZLjPCzlSN
	 xU0tBBcph/h12zgU78UTNLYZH286fq/3XcLup6QnLBWqSVEBnD65mBnn75Vr85WC/otbP
	 kxbe9MiBOGijJhZIkZarNaFzPlPp3B/F4KvzpAJnBBZI4l++5CfirezjZ4iK1DpU1WNm3
	 fBPcXektEx0eRA00IACGED4B9C5nCWIqxsgocNjyMkyE2ekXo8iG9L5M82CemIm8DcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013387;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=clzgYqSXVQLG3at2x8tUVnHhbFljXlxxPxEyRtdtAGo=;
	b=CLdV/N4vx8Ft85XadH4DpwgOWbTg3hfUcobZtU/HISFOhvkg7gcQ/+wBVND4d12Fy+Sm
	 ho5HMlyub3jGAx3WeN1HjRnhhGIF3sTG9ZBigQ/9mZNaIbQZZaadg4m/qM9HjTcX6Yqd+
	 CbxDWZzNMKTn/l20KYieW9c+5bspIxGKIy4qfk00UcPGo04DvDtlqGtaqW9c1tUZKQTFW
	 6mAh8OkYidRiqaGuK86CTp9/33vS5vjXmSfRt+Sju/Sq5rAHBM5cuRWKrA2LlvPkDewiU
	 63T2Lf4P60ARL8NBJt+C7VZRapxBwICtHpAvLw9pgAMzXworwWSAQBDlBHE9P1QK4eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=TOHq44JS;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=n+zycrMu;
	arc=none smtp.remote-ip=103.168.172.145
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C5E606A918
	for <nova-gpu@lists.linux.dev>; Mon, 26 Oct 2026 11:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9C5E606A918
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=TOHq44JS;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=n+zycrMu
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 5D202EC0326
	for <nova-gpu@lists.linux.dev>; Mon, 26 Oct 2026 07:14:22 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 26 Oct 2026 07:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1793013262; x=1793099662; bh=cl
	zgYqSXVQLG3at2x8tUVnHhbFljXlxxPxEyRtdtAGo=; b=TOHq44JSbPvOeFhCGn
	hX+hVmEBOKyGVFxnVqYIJ4tEL2g7hfNGfayPmUEQLcl0TA4F1svHVgm3LU3G6vj0
	xEy8hkMmyXc8G+b3uqVnwOk6/WYMpKB/asBYVoFjw7myJ6Ixg2MmDeBF4kiTipMe
	IaNkpWsdsrTWdYm7Sze/e82/yMfcDjBGEcLPCIRonZveU/AFI32dNlQS3nIaXHcz
	1m7hvmhTByMNK7o3qArI2zmE3VUENflL+yWxBce0x8OQ88WDUgs+LGwkqNrnogN0
	q4VYqbJUy5MmZ/c+5T/+rvk9++Wd0f8tQ53tbMn+4N5Uj6xW6Ub3E4Vmyu+iFNxU
	qUbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1793013262; x=1793099662; bh=clzgYqSXVQLG3at2x8tUVnHhbFlj
	XlxxPxEyRtdtAGo=; b=n+zycrMusTWzxCIpi2nSqZUpn5SvgXaK6GmWLdxK8xKW
	YigJlZ4jhIX0UkPXBW6LzI43M3V0R+CDP+ajiUWpGmclAIlm+v9YK5JCpxU9h7u+
	HaokcptThdQg81E65mefrxw4pU/9daC1Tg7nw2wXRWKc8ihC3HEpjgcLJtie4oFF
	8u3W20EXgQ0Ymy32TR8l2X0HSDs3TeB1MOXmbNG+IgNBa4pF4BufN4Te11Pb4c4a
	MJj6kCLMIhVrt3RbIhKOy3rygIIgV2onE439So99rD/9JxilzEnmnxGb/QM28OZv
	P5jCgFb3511VpmYeJc9UQ7IYbdfn/X9bPq8IwGZEwg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793013262; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PG5vdmEtZ3B1QGxpc3RzLmxpbnV4LmRldj4=;
	s=fm1:rsa-sha256:cy3TpviPyg2ydCR6d6s2miqQiKMeCJbIjZe85QQ4f1Ks9l1
	hyzX0/IUeV7I6SCdy8Qzdv6/q1jq7ee2jxupwWtH2aZpt8nGlkX71nIKgA13i7dh
	z+nUx73Ja+6kH8uZW/hWH8oC/ReVMmm9TyYnVITEQSiSsEakDLsgx3XbAfSfHnHS
	DcPF2y7FxqbNlf7bMCtNw2M7B/KjvKpIBX/E67IMPG1/ItCkaDnw3poTYxhZdEYF
	XLvEjMYKUBoVQbWO1WNhHyDw6vTQULwGLMGztQYI/pkRwsoPKdQLEl9/oQ0eNasV
	K2DFj0DA/ZCA+whDk2Pum0ExQNtDm/XH26yUolw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:lz+m8lbgMpMAl98624me9BGYUOyDJ9+3DVD9KDFEE0o=:tc0JNhbJEv+YLkcKMJB8dzQje+YSOMOPBx9PO/3eAgA=;
X-ME-Sender: <xms:DTbfai3JXP8QASfHgzymtDx_AVLg6i8pA1QPD-vbVJOUUkUl0dZJ6Q>
    <xme:DTbfapBd5mBDIMh_5os3baUExFiw1uTjGqbITbF96kqHxf81d2k_oJ39JtHAe21DS
    E6Mi0OJdOK6kRLTxMpXcf11uwWUc7VFgQeQ0aVfrhdS95DAfZfoKPRk>
X-ME-Received: <xmr:DTbfajZ2oqOHjs4uRYpIVr6k5wluuskQkqVfCKM4_ZwaLGZDLAVtmxTXZto6Ja5WfnsnKqdnfKdbwypvwaYGG1DDpF86XWViRG8>
X-ME-Proxy-Cause: dmFkZTE6oQ5h5XRSw4+vD9WrOXLZuJyselaKPSfXQRbuWV77QBYt2EQ9tGCIZCCfI+m/Qa
    n1uq+aW9E9Plcmh5Wsv53mR3Wfq/LD6EENm7YTAEFUrz7L+d6txwtv/3nX1t2prik/j6tu
    yXxNz7uqmkWpSSQeynxMGSf2mSIlZo8vtuvDvwG6n00wrFR6ggPRsGAFH+8sPhQSQDDeC5
    2ljVt1H99p8IGY9SHE8DxIzwt08oVWef+BIPgXkdo8gDC3konj3WvEsUCIeCIMfWKrPIz9
    QBjQ1nEEkNbjgv4/z18Wsq/1xq+Bsn/ewUoOcAk6sYBlaAnokTQqQm9IA/x0DUS/OiEqTk
    4KamfMcNHHpe9IAMLuzC0SqQvwFB5W0+CcZYGKu359DoiAjA1THa+H9Or46BFr2mgJwMp/
    MunMX8Fl2wAT4yGbiNBkOX4I0SBopsE4fElnl5gqvAWSm+9DnI+RUWFEgMwmPB/46+XMOT
    VBaHEfdmi6FucDyoo5v7aU7mGngkL5mm1ZodfJXn9Khqx60gYGrc4V0yLYVEXV+wf02A+D
    sUZLU/eh5ok3UJmjCoZHrqa5jdS9aKGhvMNLxwCYdDDJ17p+Cq0QlsD1N1LejmPQKehm+y
    wO+wir2R3mQ/jKbPavM7LEox1cQZBGrHzgqlnGxxfIWr5barEjCG+FSvRxJA
X-ME-Proxy: <xmx:DTbfatbpBOLTTcsQrpU9xVaOUrP-qmVGwCke4getTh7AvSZZsGiZAw>
    <xmx:DTbfaskmPpqN1MVqTNlG39zXi5mXDMhz-p0FNpsKgUOxFXCi-_tpGw>
    <xmx:DTbfanQr5JE76MsiSWwHQOVXRjlVzdyYLABXHliiyBDMWwnDeH_VZQ>
    <xmx:DTbfapXeERQWotN_C_NAdgqdsz-X5EJvAm8jH02tEVhGF1nhfld5vg>
    <xmx:Djbfapje4HVWSQEEhWYyBHbIYBwrkTN9r40W9TxBOHMGMLJQW8LwUFts>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Oct 2026 07:14:20 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH 0/3] Fix import of dma-buf buffers as DRM GEM shmem objects
Date: Mon, 26 Oct 2026 12:14:07 +0100
Message-Id: <20261026-rust-drm-gem-shmem-imported-sgt-v1-0-36f15ace04b1@jannau.net>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqEMAxFryJZGxirDuJVxEXHxppFVZIqA+LdD
 S7eh7f57wIlYVLoiwuETlbeVpOqLGBa/BoJOZiD+7hvZaAcmjFIwkgJdUm2nPZNMgXUmLFrp8Y
 37Y9cV4O97EIz/9/CMN73A0rLLmVxAAAA
X-Change-ID: 20261026-rust-drm-gem-shmem-imported-sgt-85c4a45be283
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
 Janne Grunau <j@jananu.net>, Sami Tolvanen <samitolvanen@google.com>, 
 Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, stable+noautosel@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2228; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=tc0JNhbJEv+YLkcKMJB8dzQje+YSOMOPBx9PO/3eAgA=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqz7ZlzBhslsCmq2btH9vH57s5XmhjUcXBB4neNf0YZ5Z
 w7ZvzrYUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCL+nIwMezyFGx8bXfu1bmu8
 RGozS8ViV7G3ztdNXzV8U1+7bJf1eUaGvmcZzFEGi01dfWfyzKwu1u5aL5VTfsQ5ct3hBwn1WQ+
 YAQ==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Hej,

this is triggered by the discussion of gem/shmem.rs SGTableMap issues
in [1] which has an additional issue with imported object.
Imported objects are supported since GEM shmem's AllocOps use
drm_gem_shmem_prime_import_sg_table() as gem_prime_import_sg_table which
sets the same function pointer field in struct drm_driver.

The code is broken in two ways. SGTableMap::drop() calls
__drm_gem_shmem_free_sgt_locked() uncondiftionally which it must not do
for imported objects as the object does not own `sgt`.
The second issue is that the imported object is allocated by
__drm_gem_shmem_create() with sizeof(struct drm_gem_shmem_object) as
size instead of the size of Rust's Object<T>.

The second issue is already fixed in tyr's downstream driver by adding a
`gem_create_object` callback which is used instead of the minimal
allocation in the C helper.
The first issue is fixed in the Asahi downstream driver together with a
drm_gem_is_imported() wrapper change taken from the tyr downstream
driver.

All three patches are tested in the Asahi downstream driver. As this is
unused code in-tree I marked the fixes as not suitable for stable
backports. The known downstream users of the code are aware of the
issues and carry fixes downstream. I don't expect new Rust DRM drivers
to be based on the (old) stable trees.

Link: https://lore.kernel.org/rust-for-linux/20261019-rust-shmem-fixes-v1-1-3f7f6de5b5e7@google.com/ [1]
Signed-off-by: Janne Grunau <j@jannau.net>
---
Janne Grunau (1):
      rust: drm: gem: shmem: Do not free SG table of imported objects

Sami Tolvanen (2):
      rust: drm: gem: shmem: implement gem_create_object for prime imports
      rust: drm: gem: add an is_imported() accessor

 drivers/gpu/drm/nova/gem.rs  |  4 +++
 drivers/gpu/drm/tyr/gem.rs   |  4 +++
 rust/helpers/drm.c           |  6 +++++
 rust/kernel/drm/gem/mod.rs   | 16 ++++++++++++
 rust/kernel/drm/gem/shmem.rs | 62 +++++++++++++++++++++++++++++++++++++++++++-
 5 files changed, 91 insertions(+), 1 deletion(-)
---
base-commit: 3497a403264b094ebd61b8b755165d56e7d9dc37
change-id: 20261026-rust-drm-gem-shmem-imported-sgt-85c4a45be283

Best regards,
-- 
Janne Grunau <j@jannau.net>

