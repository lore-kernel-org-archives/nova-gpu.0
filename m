Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3153955CC
	for <nova-gpu@lists.linux.dev>; Sat, 27 Jun 2026 10:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782557985; cv=pass; b=dSeNSG9E+SikKHErsptFVx7sIYQNi2PXd27k1BTe7IMjGrW8Zk2nCAHEYS25UnJURdOfP6JpnYDksLwRhYmLwgk0Hcl05lRQAB3ExpT97ZZh+HaGKhb6UoViHlUe4LyBIfc5NEMpDxWe6ZATqNZKNH1DL+EqfF1H27n7YbusMXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782557985; c=relaxed/simple;
	bh=n+nDLLPZ6wEr/4dq0uqyhXXPZoefpLj+VqCWxHyZNrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mUAmr4T8TPfR6gUQM3/oBKwd3va9y/I5lv1MWyqJBObgSl8It138+s+Uj0Pj00dGLO3gEbMru49MG4cZ74TZBWdzgClEO1rhrehTOkweGcghdYY5Gml5/+BsxLNWsIfaQSNq4K9+TMys++A1eQnhY4hj4K7aLvZrSSlUkdPIMAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAuTLoM0; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAuTLoM0"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30df5822465so13771eec.2
        for <nova-gpu@lists.linux.dev>; Sat, 27 Jun 2026 03:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782557982; cv=none;
        d=google.com; s=arc-20260327;
        b=bbRlhSWFcpN8iyC/S4HqEkBZU7WLUXR2txo7xr7m78AvWo5NWKy8VH9SzwVGTQXWrB
         uqRwvwkzLX3Z2qyO98zayhFu70QMrNZrx4dgd3pwGzPUFpSr2DITDo+EbsygjjkO94Fp
         YD55FGANPr1gL2W7o0phNCYKINrzFSZwl9ffh00LMLX8Tw+IDfZz8nHIZ/Pzo4xoqPrL
         tpE+E9Ae8FbOurZ0ZMsTePMyM7W2lOFTNldkIFeIxV4os84rm7meWK2bzzZ1LYBRh9vN
         f99JMz98fccZUv9WmckIRKU6gvgKKIWPR3D2B0S/jBqu8ULjXAUmjjuHRAsw0BP7UzLV
         I2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n+nDLLPZ6wEr/4dq0uqyhXXPZoefpLj+VqCWxHyZNrQ=;
        fh=S12UWytGs1qyoymfW7TIii569vu1L78fHdk+bO1sDlQ=;
        b=tAR9Vg6manHMuvfZbdACVGi+riWMwHLaIoACtW5giTsXkbB3JyYNkZzselxkGJ8FHD
         R3Yx5qpeGSQzITzn1SvsrKhB0Y/07b6yjCls8AkQshoIGN964sZwi7tTUkPdyBNcr3RU
         0g1Ec9sy3cnN1ruUwLlE0YGPTOoBbP3e5xpU4PWQHUhitr8sf3BloNe9vLwPldypS9IR
         4r9eYJTFGCfTuKIHXBVl+uLB5BXfdPdhX+ekUl7PWktvnRrq0c5hZlpTe0T7od0NQtUt
         u8aBJ0jIax3I7dVx5y5SYPfoX7lve3/IjAeu7aPg9w+cVou6/2pWlLM8IrsVmCYLEm8v
         iJww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782557982; x=1783162782; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n+nDLLPZ6wEr/4dq0uqyhXXPZoefpLj+VqCWxHyZNrQ=;
        b=nAuTLoM0W6BQ+MppY+cKbyUqImfoVTVrghNAM136EQfRaLez2PPpI/74qrRtaVZO1y
         cSB4LnpeI+ZQ5vfTx3FL/sfkB53Tv2HSPuqXjVGa1CY/pY/iII5JCSUXkOFAnBmxlQM/
         kzCVr1+/D920tJhvmb3ZG/Y485XY090ffOwRuRYqn2lOpzYRJr+w8mLPeKI6B1/gKcrX
         BdfHWqO2C54UcuwhJ5uompA6u7bRpIr0EZ7RTo42ia7Oz2fvodI7tgKaoyVKbBEE1/U6
         Ac6tC48swLipcNgwNTezeNi0xnnpDp/VHINoHRkV3VJZQn1rOtq8xNFfdWEFrlkJGd1p
         oj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782557982; x=1783162782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+nDLLPZ6wEr/4dq0uqyhXXPZoefpLj+VqCWxHyZNrQ=;
        b=YPl9r5YKD0ekdbAj55bSweyYCvGnpkugziJy9TYCOXGwXn1oWzrID2jh3Xd03b+bK+
         0HhH9KdXplKSyCI3+OY4Q/wTWYXhsdl193i5YYqmINlPAM56RgVRprEkCa7Ghl0ICOaM
         FHr4L1E6CmjkXGfq+9ycmFzqlkYxUzX/z6Faj2VVTGpFtujTU9CUlUuvXzH+gwJnKY1H
         4wx+hqi3+MyRaUhWV2Rfiuug6t9F49FiAWEe4Mox6gIiB4jMzy88g4WDdqJ0VVwwSStm
         P2KB6rCF/PKZZ0dnxTu5J+Vu5boZUTF77m/xONA/xjhD0ergJT3TGrFa1pdRWP2Hjwwq
         OGfA==
X-Forwarded-Encrypted: i=1; AHgh+RpmWnk3eBVG+cSCB6S0bIU2PAQjo6Gv9cMFT75IAgsqwzTTjHT+dg9o0dPWtRBtw2JghsWQ9Jkghg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDXhQMwpb16EGetus0q6cZVce39/qCYBnPvthJPsM5IMUBMS/3
	ATFvU4OJWtsEquHFAufRAj7aE1QJ0f3+9nl/C96p57pBhGsTWc3bra5Xu5sJVuyDonAn0zieL1t
	Q74LxWdTf5Odti028B+gu3ZfPtv0Vay0=
X-Gm-Gg: AfdE7cmka9FBomUxGML4t8LXcbp4gHV5MHoMzRV7lRKaZpeIRRCrzmrUzkfFriehOEZ
	IUh1W5HYs6gVo2ns6kGWqWpnpdN+1WB14EI7VQUHfHaR2jHDslBg4v2zYI+Hfr+yh2SzCXbJtEe
	RWm4DFN0Kh6Ws3j8MKGcmdHGBWyBVYhqHmU2vT1vCkjVnst/+JmnJ0HTAyjLg0qb2QwYHjYIXHv
	8S/aesAgMcPT1/rq9wKGXy6+LRuDy89prNM2dbbBGOH8MoKJ3CRliiP2Dh9rAcruZ1LB5na35Vq
	F39JJb7IbS9HkM2/mmx09uPxIuDj+vlO6kkhgIpwmHF2pzaNr6IW3IYGuQpz7y1MzGuCVOfTbvC
	aPJP2qWCDU0cS
X-Received: by 2002:a05:7300:6144:b0:30b:c021:5045 with SMTP id
 5a478bee46e88-30c84ce60f7mr4014070eec.5.1782557982397; Sat, 27 Jun 2026
 03:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626183630.2585057-1-dakr@kernel.org> <20260626183630.2585057-2-dakr@kernel.org>
In-Reply-To: <20260626183630.2585057-2-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Jun 2026 12:59:30 +0200
X-Gm-Features: AVVi8Ce3MkIh0ONlyKuy1KTbQ-yG1BEWeg6mkrKBipEfxJFXZQzFaNA4SZvKL0c
Message-ID: <CANiq72mT0sAUX0Ob0RHzqS3QOzRxkc9=UoOuPTTyH=nAa8D40w@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] rust: types: rename ForLt to CovariantForLt
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, acourbot@nvidia.com, ecourtney@nvidia.com, 
	m.wilczynski@samsung.com, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, daniel.almeida@collabora.com, bhelgaas@google.com, 
	kwilczynski@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 8:36=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Rename ForLt to CovariantForLt to prepare for the introduction of a new
> ForLt base trait that does not require covariance.
>
> The existing ForLt trait requires covariance, which enables the safe
> cast_ref() method. This rename preserves the same semantics under a more
> precise name, making room for a weaker ForLt trait in a subsequent
> commit.
>
> No functional change.
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

I don't see anyone else in linux-next using it, so this is likely fine
-- if we expect others this cycle, they may need a merge.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
