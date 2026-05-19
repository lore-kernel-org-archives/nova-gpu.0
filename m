Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FA6348C47
	for <nova-gpu@lists.linux.dev>; Tue, 19 May 2026 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197670; cv=pass; b=qOxMM8v5dFfykM0vXewTI6zEJWgxrM6aCtc79Vd3uzFU8L9geLaWy+zAcsCI3nF+LGYQhhH5BnFnCzlgG9ZWpuDqwnDb5EOY0rWUKRO/LIYMy+mYD17IXnSTuFObY0eG8bQeugT4OGHqT04JkpkQf03YfcPDBt8l3AObi/EgDno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197670; c=relaxed/simple;
	bh=naF+eFIBVaPQxxaOGNrVUV2zt+dbyRkLeG9JHqTunLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghcEnogt2OitBNsYdXMz627IpPLM8JyuYs4aw95Q4JBM8Qxz2aaMYmWckKXkyAQcqpDHy9Iu0dk0sN0dnc+1Q1MHj/akkZ+rsbP1voJxjSfUcTM0wY6WvsVQjc1aOty9fkoBxnYfpNshm6PaO9xFLVnHpt5p/MQdM5SguOYduQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gF8WuwN7; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gF8WuwN7"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-303bbf3f16dso117977eec.3
        for <nova-gpu@lists.linux.dev>; Tue, 19 May 2026 06:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779197668; cv=none;
        d=google.com; s=arc-20240605;
        b=VWmsT4MSGJNQ+4uSsPkPvcC45vapvlk250U/JnZVCSFtVSWS6/FGcZfwBEZpxWCYzX
         l1Q/ctMQQwJnf1Vf7EhtsSoTpMd8eAbWrsr4YiGxi1P0rpHWXJQT1PfnrZTTrAeRNtKy
         v6gmXPutcFipcHbWwLKe4aMRfMnt5xUYsEzoOtn9ceEANNzCmWCG0u6M+mM4Gbnq/MyK
         Ah5NNduf7JAQTCeOj5nRi2GN7wngSdq6aoKc4ByQP83C/8Jrs1OMhbk5Gr162e90UVrC
         B+PfBnOmd7c3sf3tvSB7/UZMVO2QHCQwg3UBcLfc0Slc5zVUsCgCPc1UzEXnFxkibdOn
         WM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dH/8yGMfRsmeb4Ra/l98WpGBn5pzwNsIBkPePz8iHO0=;
        fh=29o7A20cpT6iG5vjtngw3SUYNNN9CBgjD9LsDbbSbhc=;
        b=dT7zONdUkQfjnrOANjBmBeqpwzeeQzoL6Cp6X3VFK8Zca2ZkPXgXsAGCZAnjGyIVcu
         wPuyK4M6b54gvbnQOfoO+v+NOMjbxMoD+jxr8XD12BUW4UNGiE49StvN5iBucBZvig6Y
         f9A7kU0IZ/Uode7a1P0psg9c+g7ESUH60/cVW63nVa7w2n3bI8j1GDJg6TOkAkTYR4Ut
         1LggpuxBk35LV+gc1esIUt3QDVCFSaDbNSYWRpXnwA6EUx7RdsCAHiba+EaAFAb4jTfu
         w/nv1W+ZRo/3bBr4zPfCDOnFZVnnyWU5unTbFf7MrpQ5PhaUMPgNm+JexIYtHrhL9xdp
         5iQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779197668; x=1779802468; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dH/8yGMfRsmeb4Ra/l98WpGBn5pzwNsIBkPePz8iHO0=;
        b=gF8WuwN7mWD8m/vETmLt4t1ewScdBsX72ZlZkTAZSYtQDaT2Et5FMQfAK6c0rDtZZE
         fPaeukeGTmZ6VWJEeun/Gr7IszQBrAtepA1th5Kavg/N++2rHkm3gdPOr2UHNVnWecFx
         LrRA9TbG1OQKdWKUhhhFIt3SuQIlTuthUQg4z/4I0zsIPtpFgPPYfpr9ics6I3zaNkir
         CSTbUEHZzBk12PK/JGr3TaAQTJwau4ay69z5Codm6OGAkz+hJLU7ozG53oNXQOt8Grpo
         ewg3Y1ZF33bC7h3bOj4pRbQIt7FudNXx9hhznA/GCaYab8WhmnfFI3djvBLsQZfPHXyI
         xHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197668; x=1779802468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dH/8yGMfRsmeb4Ra/l98WpGBn5pzwNsIBkPePz8iHO0=;
        b=LJyJIxh6QGpelI4mP6Fa76msNaIR5u64tUhSdhrqSi7S5VVMSHlqyb9n9RNJ0Jw7fh
         gvCDw84d4jIFU7YjuteDpD+iixTelxnptyc5BtIcd91IUhgOCzU3S1jJE6kMzFYKSeyi
         WJ3bK+c5/fQAnCuzIMNZ0iRlVGEIhF+xZ5dvnPeTj7k1LZL8RHRX/NXEn9dgdoO92DIU
         aC/T/RM0P/27lXFXu/MbF+Jc6ObViMuSW3ezp7ymXLqeeQ8jWGlDOJxpvP3eZaM2g1KP
         HlbbB9ElHx56mczVychw6js63VT3ziikuRb17NZDUZKKNsGBoK7RAe/Q6EHw/6ypoDUt
         AQdw==
X-Forwarded-Encrypted: i=1; AFNElJ9FPjWgWtrqie2lU78w618mvN8lyZsd0yd0p83vrgfdxyg44Zn6O6gVsprs52m5Gkm+qYiMHW8QdA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy50ozwg2THg5LkND9Y0hbafpzqG7SpdH59y2Tpvfnu8xOL3fCE
	8Rc7AKOcEhcO9FbjxVEBsYI0dokIArTSu2D5WJS40zmm34O8Vs5C7gkVCalGDOu81lxG0VGokaS
	zI0G008gBWBDKKhgNf7thaJtWdDiCK1xulx0uLkg=
X-Gm-Gg: Acq92OF5nL/ILi36Ez0u9zuXFPgTf44huhGBDTVvQrwJPgOz8O78PfFJmvt6nmXzwaH
	J8TsqsKegAhNnbE7JadW+ZFKhl0Zr9Wm0b0KF4WQsGHycOEmjoWbr7g9mBi9Vzr3W8gTPJFbGH4
	OahJekroGiklAT9ci2WH3K56gddDya3WKNfe1W8pyMf7TkD1upSkXW1RuDDc5g/zzCCtqHEsRhh
	ZQE71aD4WWmGOmqrvZ/ZVSondOpre7/+VEE2hTePOtQ3VkC8OxCZjvvTk1zZEWLrhxeV6+Jm5v4
	84z/UCYwsZrP9ve+c8s1QF2ASim6yyAyQ61yzwExCIFM2nS/D6eC1QTrnwng9j4XHZEANtNjCJD
	0/KpESQTthrKiUs1v0pxOV0c=
X-Received: by 2002:a05:7300:dc14:b0:2e6:b55a:76ca with SMTP id
 5a478bee46e88-30397b88952mr3989391eec.0.1779197667973; Tue, 19 May 2026
 06:34:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260517000149.3226762-1-dakr@kernel.org> <20260517000149.3226762-17-dakr@kernel.org>
 <DIMLSVG1IO07.28UMFL4GTCQG4@nvidia.com> <DIMMHPLUV2LK.39WF9SGO8TLK5@garyguo.net>
 <DIMO9MW468B5.2KSIVYEMY31YF@kernel.org>
In-Reply-To: <DIMO9MW468B5.2KSIVYEMY31YF@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 19 May 2026 15:34:12 +0200
X-Gm-Features: AVHnY4K5vpbJGhCh2fM0bDGLH-gDIENRDMeBQsxYOoXtqTcl9WixZ1bWmTIZnkI
Message-ID: <CANiq72myVDq9oLyyZqUf3Se9-JLDp=qGhBJy01nOxMaZBRxADA@mail.gmail.com>
Subject: Re: [PATCH v3 16/27] rust: types: add `ForLt` trait for higher-ranked
 lifetime support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, gregkh@linuxfoundation.org, 
	rafael@kernel.org, aliceryhl@google.com, david.m.ertman@intel.com, 
	ira.weiny@intel.com, leon@kernel.org, viresh.kumar@linaro.org, 
	m.wilczynski@samsung.com, ukleinek@kernel.org, bhelgaas@google.com, 
	kwilczynski@kernel.org, abdiel.janulgue@gmail.com, robin.murphy@arm.com, 
	markus.probst@posteo.de, ojeda@kernel.org, boqun@kernel.org, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, igor.korotin@linux.dev, daniel.almeida@collabora.com, 
	pcolberg@redhat.com, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 3:03=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
>       That said, I expect LLMs to be (heavily) used to write drivers, and=
 LLMs
>       are typically trained to be compliant. So, I could imagine that a p=
rompt
>       along the lines of "Can't we make this work without unsafe somehow?=
" leads
>       to an LLM abusing this, while going unnoticed for the user.

Could we steer LLMs to avoid that? e.g. adding a line about `Unsafe*`
items to Sashiko's prompts.

Also, a `checkpatch.pl` (or similar) warning may be doable too, since
false positives are OK there.

It could go to the ASH (Acknowledged Soundness Holes) list we
discussed some times if we end up adding it.

Cheers,
Miguel
