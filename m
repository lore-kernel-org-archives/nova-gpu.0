Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9507A4A8A30
	for <nova-gpu@lists.linux.dev>; Tue,  8 Sep 2026 08:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857386; cv=pass; b=a45d7EzkxjpT9DcPwWcXoxJDwCaNznU1M14XjjVXwCbbIn9mNmebD1bP2K0MYLiVhqtuM4BbCqmUiLllA6me8pC9mMkCg+BNwC7DnjtPvWzOan+BdHclEpMv9RP0YVc6sEbI+FfZGvcPaT3VqPYvXw/3MK7hl1S5bJgxjZ00fDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857386; c=relaxed/simple;
	bh=VlUILLLz6j/ItrW8OiGkI/9S62d/o220tqGa9E3WryY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwhm1NTIyhtS0o7YPd4Q39aERMkZ3tKbj7S9J24gt/0jkm8+WKMvr7FFxcCLPaZkp8+OLmus0Nu7g3kRIms8abLxYENkNRZ22n+K0Vv89vkkU0wLcixnhxiKW7uYH26vbp7bhBhAIpIM67/Bnu3uB0qE24opkwXq1OcHnWXJlQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EQcQq+R8; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EQcQq+R8"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-485888b3c3dso4460196f8f.2
        for <nova-gpu@lists.linux.dev>; Tue, 08 Sep 2026 01:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788857378; cv=none;
        d=google.com; s=arc-20260327;
        b=ehUDiXnRsogzAGwy/OjRnHkpnmxulFfw/x73fTRSz6UPFcWWiYrowy68WWZS/ckDTg
         A/OZblBFEZ+cO3TavN4EzuUA7xyIh65eCZdF0vciLKoZr+oS/ag0hLhKUCpNsarvhisC
         JmL08CzoRjN32gQ4LNZwmonMp/wELP71tF+3i/114FgmRLw9wHv8odwoPKzk6aX4y2ic
         xTbjQDjTve1QMuYyIzE1R1lYhBa0BgKft+/7+plQB6S/u53WAO0+mlC6ZkjCRf/rgRRO
         i4UMACRng/chXBNVnmcvDVTN+YRaj+LyHU/6OLE9Jf/3bW5zmxMt32qRA0ZugGaoDr2j
         Ss4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VlUILLLz6j/ItrW8OiGkI/9S62d/o220tqGa9E3WryY=;
        fh=hcBTPnXpQCgaQ3l6Gv9F/4iGqN+zPv5jPK9WRPrf374=;
        b=bZ5yQDVdzB4gg3M0dfQitjrZ1g/+HGwxtnslZWYcO2KmtNwRsfkx7/HZApyqdocbr8
         SGl4+pXBu2A1kvRgXoluV6bPQG4ypMmHdMUzrCorQGanamtqhhaTm5+f0xUuWkIoeWv2
         96+HGHhgH6IW2bQ7vC0IpN2GpPKmtoeVJ4y+fSjssf8CcXg1c6QT/rpiDagcieS4ITNt
         0O/yPFYioCVmBQMPCVwcVWnWlS139KRLPWLypjZkR7t2dW90xjkalr5gnlquKbkfu9h9
         QS4LpaUY3lWayH1uckTZmlgYwweC6YsM1a7wlSX5Xyf0HN7OP8CsYzUgniWuBY23sgJy
         pYQg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788857378; x=1789462178; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VlUILLLz6j/ItrW8OiGkI/9S62d/o220tqGa9E3WryY=;
        b=EQcQq+R8toHm9oIMmBaDvQfJKO4LYTtHB3i8ffSEBiiBde2fIe8a4IaeAa0vIXR6N9
         yJLLB3JBqq3UDecOSQOy6ihNXds6FRrrOT+ccM4DPg70VOhXKj2F0Z8vIDTOkPBzydtd
         GTraMFltTGcth8DTLqauoYOBQLpbP1ridUMgJDmOHTBTBVssnvxduDhGxi9XBelp3xLW
         S126uUcwGWBc2krwNp1HsU+j5Y22trvFjTrmydW/YVKTo+eZbMk/slhBL1TYmo59fOvc
         9v8fPZ0iP5KyAn/QBinmln94WfFgkmSNw6nFhJqwSK1lYk7wxs5unKfxmKZ4ELLdnn1v
         d2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857378; x=1789462178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VlUILLLz6j/ItrW8OiGkI/9S62d/o220tqGa9E3WryY=;
        b=lW1+TRJohNPQZpfn9mxzaNmqw6Fi3NcRQMwbk74pR/vP3Cg0uigOp+Q18anA8sqOyR
         im4Xheh6q8NbYLNViHP6V0A1tLb2fj80SSYLEgZUEHKHYjqGc27FQwUt3jCYUZ9AgQIE
         reVTn++bdUXM3boC7GLgTgfgL3PVJvsUNQoJTqkjJ5sftjZg5CBzdTCPJGjp3THpgsiF
         1eDBovLopq2zx63EDmt1bk35Lc3E/Fq01/Mc3/qiF2TyQOnmxKazZ9p1l64PKeW7faOG
         S1Gmp1Y/6bH+Wor+2iUgD+DPaSS80rSZYf4QpFkE4KBt9CENN0E1MSA/mcrvXUhMvRsJ
         qCRw==
X-Forwarded-Encrypted: i=1; AKwUvBwNRzes9BN5DEirp1KceQuXKssKLDmS7LTlKC4Uvmto0F3hJg6YIMc9aWWmXZceO8SwWIx8WGtQwg==@lists.linux.dev
X-Gm-Message-State: AFuF++nQh/HGZKW6UU1BgluR4m76RlTSD6+CSS64BxonnCv6OWrcQ/VE
	1sqBlMAajvPNEp2VBv6DZqiPNHZnfKe4T13IQXJ0KuuIq5ksJ4B2POc3BDjOfDPgVAoWvfu34iR
	TFIEAT8swC/uocKkSmPSLFwIrbCyqMat/AVWPVv52
X-Gm-Gg: AYBFou0jacXP0srZjGuu7J92Im3vCbLggh2G6XmmZ/w7bN/F5ge4Es3l1m4Rr2P3XT8
	xvFV7AdVy3+nWzLMT1DmQUhu5mJlhteLzNzBOGdkJ2/7WY6XOqztnKeEInXUF5JGOFN8yy+VZry
	/5gl86ruwiJmZlp1kMsAtrwloMzxYJbW45wUuPageP2b6IYv96LbxRVcNN7IUpLT3TgOXF2YPtH
	llnuR9fo9Fm0s65q2jpIxooVOn+v3xkjOMKQ1qpLxcinodMW3q6MkyMddS5hlyXE5xwIzP+dOF1
	O9lE5f/89GE4w6kOk/xdHStg2qhiExTWawGQZzp0eJ1EEC4d+G2hygt+HxgaBNCPP+K0ba9HvhW
	nLpZWF8fayUMsSoVOHM6ZplpVsmARanQ3alY1SAfP
X-Received: by 2002:a5d:6f1e:0:b0:485:8c16:5ef0 with SMTP id
 ffacd0b85a97d-4858c166129mr26214143f8f.42.1788857377473; Tue, 08 Sep 2026
 01:49:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-maple-tree-send-sync-v1-1-43adcd4a16e8@nvidia.com>
In-Reply-To: <20260908-maple-tree-send-sync-v1-1-43adcd4a16e8@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 8 Sep 2026 10:49:25 +0200
X-Gm-Features: AcwNN1UnrR9dkVHvDMvsysJouh6r2YnSm2JySmMBpuB4OQ_lYYOQ4OyEmCZHEfw
Message-ID: <CAH5fLgh_TQiqKxXsz_DVcQxkCaEw+q0JyTh4e4Tnp28V0JDmYg@mail.gmail.com>
Subject: Re: [PATCH] rust: maple_tree: implement Send and Sync for MapleTree
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: "Liam R. Howlett" <liam@infradead.org>, Andrew Ballance <andrewjballance@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, maple-tree@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 9:51=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.com=
> wrote:
> +// SAFETY: `&MapleTree<T>` never hands out `&T`; all entry access is ser=
ialized
> +// by `ma_lock` or `&mut Guard`, so `T: Send` suffices (`T: Sync` not re=
quired).
> +unsafe impl<T: ForeignOwnable + Send> Sync for MapleTree<T> {}

This is true now, but will change if load_rcu() from
https://lore.kernel.org/all/20260116-rcu-box-v1-2-38ebfbcd53f0@google.com/
got merged.

It might be better to just pre-emptively require T: Sync now?

Alice
