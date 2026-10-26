Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013386;
	b=cNnIMQFwAPnjlKkGFxT8QJUiPbO0SFUjb79+YCyldPFc1glOMIdXtyBT9rmpgEAVmZVa
	 CwYHUiWJNYPVP08r9WCafhQYiF3osTchJJqM3/alcxT0TCKQ0NL4xYv7LMip8xPA/KAxu
	 0KX01XuKwTvusHWDV+xNtpPo1r/M/AQwxBVbUH9RZvsKmASfJfzllWvig2m4VsE4Syh4A
	 GIZUt69Uz2YnGd6C2KF9J6sC7hGtaFLZn1PQSvAmRYoPOM9nALS4EGuCqzGh8K5NA5b5P
	 xMddMxZgzuq05Co4gW5jRhcdxaSug1M25igwhXrRLdOTdX8c4hNGTXkhWNubQcVZJlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013386;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wMWk2QBzc/k11mU8+J7Vc+JEj/manwM7jfMzKktKbQ4=;
	b=rRzzfZX4u885jXdjCddsiIDabe5F0WAqvnPf5B7tqrOzCXNMFlUhA+hEsMv4YNaDLU6h
	 UCi7d7X+uJSkKooAT1FFYkYC1MZJeoT17Lm7hbjDShriMRLyCyBUIhSiPdkryczYjFk7V
	 SD1H+wleARWXVAB8TWSHY8VSaQ+BgsLJwQxIQFSDufxvQmFuqdifsDhV3QuottH2f7KjV
	 sYcB3mZiZg0Lm3z2TbDjIFMUqPCRTAPCu/AEbd/qYPhSoiznkHh5EWtfWwq2zO4bgHviT
	 FTrU4k7JXDSbq9SuNz2vE+a2nc8QXYzMalqP3922DBkDQIJAQQY/fHj5WKya65cE/Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=gl7BUZ7Y;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=SIh40PWD;
	arc=none smtp.remote-ip=103.168.172.145
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DB7606A924
	for <nova-gpu@lists.linux.dev>; Mon, 26 Oct 2026 11:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9DB7606A924
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=gl7BUZ7Y;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=SIh40PWD
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id D0BADEC03CC
	for <nova-gpu@lists.linux.dev>; Mon, 26 Oct 2026 07:14:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 26 Oct 2026 07:14:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793013268;
	 x=1793099668; bh=wMWk2QBzc/k11mU8+J7Vc+JEj/manwM7jfMzKktKbQ4=; b=
	gl7BUZ7YPVhNB5rq+prprPpBsDenOoqh4kiFqlAMGFsIM7F7TnXppoyZI9kKJ03j
	7rxyKBSEdx28Gz95I7apnEQnjqXhvUij0Htx8lIpZq4LvH9gBAC+s0Ms6gLVBxBl
	+cEenbHG0jMhl86zEnVRusTrzsgGgN9R4ycg9snF8kL/YxZFgzxGbbKN20kx+xF4
	jADG+dyqQrRfIihi3ON5gH50Z741vfJtqkfRXGOKq4X7ZurQ8Yt6Xip5MBOuhIsM
	fQJqafMXjhjriOUfvT9KFsWm7Zj4XcurZXkoLGllNC3Ey7RI7gl632M39+uHjkN0
	SpyPcBFVBvaa1BfCRfYLQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793013268; x=
	1793099668; bh=wMWk2QBzc/k11mU8+J7Vc+JEj/manwM7jfMzKktKbQ4=; b=S
	Ih40PWDTSCSWv6Ewhhc+NrXfe+/njL7SxOSIUoT5ZOx8Z6dYRc0xFvPy1Yd9oTBt
	tElYD1hUvZo9u4ARh5Bna/8kUD/4qW3p3/DNfKtc+XaU0PbOt20HneJ2ia8mS5rY
	IN2ReEUu1srxhHRC1e6Q7SBkWXcZGn4bRpequOaHNoVAA9XnIIX0R2Da2eVsjmnL
	PEJcFIk4hJPMV8AnLscAWBmEhar1iGr/iQaFaO5Wky3/fkwYMtXDN3mlYhcs6sFy
	hNhsXE7+907Zvczz7qSfs8U3gpkyEieV0vtK/EIEBSQhgivqWVOK/E399VnCbUBW
	WJR7pXDvqFSFRP6Fb9k1g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793013268; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PG5vdmEtZ3B1QGxpc3RzLmxpbnV4LmRldj4=;
	s=fm1:rsa-sha256:uf+p8WeMcmc2pIJevp5ilkv3MS93B53yrJBYwKDWMO0Kps4
	h6WPqK4ILOcL6a4a39lMrt+TXLAgLQ2AHAmVf+RQlS3fQrXtsnn4nBZsDW6Yopkf
	EWfex+aI0RiNLXHk3WDiMQ9GZLHpRimOSmsGWNQl+3CwUjBBxtJ8T9kCNPtH5VKC
	TEGtSYLQVYF2fKsvT2Sh9etX4gyvG7VDQp8uFJDj+trNyJdjbXqlDKocd3oJ4/zc
	QnNTv9Ra7ivzSkq3ExyH56FmzJdeudbfK8Km1YBcBwXsnEkQtIJHr/2ERrjA2AbD
	ze6M5HxqrJ+Q/wWRjPkddVQUXsPYxktC7aY6wRw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:jhkHhppJqQtpvIORZ0m7bw5Zchtarf+6FInu/L/t1u4=:MlSvXvPWcJt+BaFTASaZQoR1XXvhfb0wshpk6x749as=;
X-ME-Sender: <xms:FDbfar-ZsKnRPw_c9VSs8r2L7yrftKZkrbzWvDQX0H01AnkjmYV-Bw>
    <xme:FDbfarpXkRaWIPQs9P9xbqTIhL865cG8C0851RHgzOnX6TFhL3ptUUFxEurUnrT3i
    JC1yA-CvBjS4y69am1t7PGApaRLv_2aixyHvughO5c4aqRj0VPHny8>
X-ME-Received: <xmr:FDbfahi26KTtqsKyoSTezOxnvwQsrQOK5pErbSfOV4z8rSfYB5GQuZ6qD_OFPYLA9pyCrglXA3wlhXKJGC3MVYyWrfPAL6_dwt0>
X-ME-Proxy-Cause: dmFkZTEJEe4lYJFZf35sqXvTkf/+FJZOVL5vXl5n8ZkihoXFI0gO4o4MNvWHnv9OUtdI0k
    qKYYtghlgaPjzVLzakzYFMYlDoscvLZaDmH9JgnVB6TEajVdPQBP0iPSjovFVToShdfnos
    iJnVSxPDvCOuXl0afcTiVCdPwUzFvTPs3hT8qjZioPFfrV4Bh64zX13y85ih6zKswmpdg5
    PlyULiSwNtP11my2lmQ/1bbf01CxjDrro/uhf2m2QTjp1ou/m3DRj5UJg6RDgO0gDNEo0H
    fUYT/WoU96E/gGZwZ62GDjD/jxuD5zWv08TEK7s1Yu62eUghpHJQh37M2hFyYSC6ijk+WK
    lZXPmrtF11UT6M2zBcv7gopzN2Jjw1qvCs3pPtjNGVPcgqNnIYfeVC9N7DeeAKxVjWzn51
    LXtWgtWoxkKGUzDcoAt+xWE0xF+B8tOx3YIR5hVgLt0SrMBX1jKxVnDf7yUx+bVWUeKpja
    WQXguDFJ8Ikhr2o1Yf7cFCp0vU8aEdAyASVXjyripGlDwKM53sQL23gbpl+NQWbekDBW9M
    /iL6e2Qwl5hx+zS0MMYH0R1NDGeashJjpZhw1jXMiLejM/k0HF3ksZbwLCPjLeAA+tnuz4
    uzArSZ3ImQdYHs/8VaGWWlOtjkpJmv/cGIPrargDa9BcOpBno6EfnM0niVxA
X-ME-Proxy: <xmx:FDbfahApq2oWKRPtuZBTEYZOVlFLx5J0vNONg-Qld5fB83XSFFrLlg>
    <xmx:FDbfansuTbszqlrYxQFC_JiYH1F4Go1U-Igjs3GvsYpAT43MXXp2yg>
    <xmx:FDbfaj5eTJohKiY_Ezaaaw9avA2QCGb7umaWm3z5QYVMs6bZuanAJA>
    <xmx:FDbfapf6SEQOCifjiG1AOTKGZ5LNzPY_ljUSVzbSQnkGGaRevNO28g>
    <xmx:FDbfajKmlwGbbT7tKCb4iSQkDi-WqvS6yGSzOYG8r2nFjLyAE10Et4YX>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Oct 2026 07:14:27 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 26 Oct 2026 12:14:10 +0100
Subject: [PATCH 3/3] rust: drm: gem: shmem: Do not free SG table of
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
Message-Id: <20261026-rust-drm-gem-shmem-imported-sgt-v1-3-36f15ace04b1@jannau.net>
References: <20261026-rust-drm-gem-shmem-imported-sgt-v1-0-36f15ace04b1@jannau.net>
In-Reply-To: <20261026-rust-drm-gem-shmem-imported-sgt-v1-0-36f15ace04b1@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=MlSvXvPWcJt+BaFTASaZQoR1XXvhfb0wshpk6x749as=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqz7ZlyiDtycLs3yq1w2/WWVvK61VvMJY5nt0poj+WXec
 jWS9792lLIwiHExyIopsiRpv+xgWF2jGFP7IAxmDisTyBAGLk4BmEhBAyPDj7dPJvrqTV/BHTr5
 lG1olJatfHKz4K4VXcYfVd3sHhubMzLsvSi6wyb3l+RFqUlBV3MdOn691vvwrm45462/6czNbSf
 ZAQ==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

GEM shmem objects imported through gem_prime_import_sg_table wrapping
drm_gem_shmem_prime_import_sg_table() do not own their SG table.
SGTableMap::drop() must not free it since it will be freed on exporter
side once the DMAbuf is not used anymore.

Fixes: 616c229ab010 ("rust: drm: gem: Introduce shmem::Object::sg_table()")
Cc: <stable+noautosel@kernel.org> # no in-tree users
Signed-off-by: Janne Grunau <j@jannau.net>
---
 rust/kernel/drm/gem/shmem.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 1df3554893cc..d0f89ad2202f 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -596,9 +596,13 @@ impl<T: DriverObject> Drop for SGTableMap<T> {
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
2.56.0

