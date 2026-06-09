Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4BC43DA2C
	for <nova-gpu@lists.linux.dev>; Tue,  9 Jun 2026 17:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781025579; cv=pass; b=EF3nXQ4a9Gnk/VERoEX6uCJlAbAJmEy/IIb9RKMuLx3aYHCdsbU7/uYrlqz6eDHHYBB0tdmWayk91la0ggzJLX8vTAOx9bT/3K/n6MTnapRxwLuz65BGPKTi3DgDlvl5fhYinfdGObAZQmlALNQUKiK811XVV8sAu0TEQs6inSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781025579; c=relaxed/simple;
	bh=i9E6g7FrTHJuH/KM/L2YDGTx0q9lRs2Xj+Q3YKzpptI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAS+cydgH1XVFpz05MR/mCM8OsNcFZnXxKHdZYLKpu/lAuB0FqwHsnWjitROiPh4RFOuii1xh8dwxqSkTtEXS6nDZKMw4/KUjP9hummJpWkhV4VHc2nqP6U03w88hPVOYn3lvv7kLz4uP6erzRr8F20WAhqfZ02HXwlZZx1/690=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6r+nG2X; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6r+nG2X"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304f8e80b7eso425844eec.3
        for <nova-gpu@lists.linux.dev>; Tue, 09 Jun 2026 10:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781025578; cv=none;
        d=google.com; s=arc-20240605;
        b=MrpKgBEW+S6BjCj7eVDH1SBgfqhV/8aj3GKf7o+vC3iuOCDZEBU2Rqgr8RI9F7WFow
         /e/38MOx4aXYDVM6qgxHY1ITfbbwYg53sT6uyB8Mdvv9zs+5vXQsK0f/oUPFITyjNfv4
         7u9MfyX2xxzGQfyD6myEnbAp1980Jf3338iEZb3nJx6582w1Qx9kc6qLrIMXeTikxVGB
         bTZUArZFOs3HzvVtBv71INPhZlCTQlw+tXQlQJYUM6shhu0L6TmfNTfzplGjKh7C1WV8
         7VfNiqeVJnzkrM1FNjalmgI8b+aL/mfEUfnSEozoLj2e3azH3g/IBwzrgyiHWHFDlovv
         vQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qdj1ZDhkK9hVS2s2BU4ZL0QegPmYjb1pgGPh1FYEFmw=;
        fh=C1CRjf1Ovm9s4QuC9q6mcdBmutOXFka/tUjavRUbMgU=;
        b=IeqdHzKy3rZoUQjDgk+mK0+xjF3V3xrmgVRIn1SfmUdl/BrMlwk+GXlriFh0VhrvMH
         ZCfV4qBkan0S2A4Sgdv7yKRRYVYWROJKUmHY2FsnpRLwqApvVdPQ8hi5efQa7v996F5w
         aFdHDiHLkcuc263b4693B9ufvna1XZGk4JxAqmUlqFmPPYLKc5VgHxkm6Og5iXFBPQ25
         pg00TD7/9TGNLHo53oIbOqDj03DbALVQH1F0vKQa3LLNPgxWue6grqasyRneTzrggF5O
         kDbeLdilhhouFIm3jyQd1SaCacm/DFexMzC89GTUy0vYsbZDOFYPuRxs6oHbX4CBku46
         6GiQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781025578; x=1781630378; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qdj1ZDhkK9hVS2s2BU4ZL0QegPmYjb1pgGPh1FYEFmw=;
        b=Y6r+nG2XaeV6xrq7YPi6Ti+D55LZCCn+YEqjBPmcmOWDkqMZKsmqP9vyzyfKuuWdaD
         XAPbmWxV3Y89+BEt3bpNt2LRwr/hxEqiBOk1BvIA22JIVjFscnupS1HWcMO9l2XupfzA
         wMNrpOMPKGHmaUaTJwOEbKsEnpOVn76WVbYQPzk3/BYVAezS/cuSBzEetfkLLhRXWjac
         BqSTiZumoRF6CkpL3YtEy5m5sd3SkOJdQYTeNqEheOYTIEGyeSIsRsHdss0/a9Xxnt6A
         N4FHkf97VsNt9s6jcNFH3EbAJ8I28pJC1JiAdEzKQN2soABwhVtx31emzhEV4EMpmIUf
         ercw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781025578; x=1781630378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qdj1ZDhkK9hVS2s2BU4ZL0QegPmYjb1pgGPh1FYEFmw=;
        b=SV4G/COeM0Yi4kSQspmIsj/QWoKHcNuhRB8zhOyI9zSc43SN1vrHV85a+2Q5grrtyw
         zz5XF6CMOBpZvnzbPENt/Q7q6ZPkwVSa5QMxFRsgnoDcnCZXpzXtZSAUyNyXQNnT4zyg
         RembOra8U5JzwEdCT5gY6h7E9uwzqJdA7zGuJV3zKIGXTM/z4Ky4IaOTQQYWBeOGKpSI
         9OHxRnVMOv4WZLr+Ot6cNJ2C8oj9SKEvwnGdqvEhJcYv1SgXIqQg7y/BfhApK8Cq1m9n
         jCLvGnfzLG/+v23wjMspd4ibE4pPYTUgEqzDvSKALmG1zdyw5Jk54H6zmHmhkeRuHszM
         VDYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8FhNFwVUP0IS/vaJxD/Kyik7BgjL1hoWRtBIKSv/dIpFoYWISw54wSKq76qkkyfKjdmLioHzTEAw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVAGc2bBnaPkutUzMrgHNKpCHTkEgzbvv9cSOFfYJSVJUtbgwI
	geof8aS0KiaNzVzaajt3KyFq424gb59CDNTSrZ33ffPkDa2WhZwbbns3+NJDUWf3a0CwuBDtUZF
	bDuczY1OxSLDjpbsElxkNRcTtfiGiEEg=
X-Gm-Gg: Acq92OFltYeh/SzeWRazub2png/ANbbUjRTt2XH3LLi+OiVRZ+Vwx/SbBTL9VJT34A5
	UrH1iBENiyzXFlDY9UzgQ+8vEPUYchZY0azrBbiOUXlPK6RW39WthDbArRWRNasrheXadF31E/e
	Y8Z5/XdDlAi43pkt1LT6fo3Z9fzDpiFyFaXzgl0eY5XmsjIrQRs8wXmXGYxCj9lVJzzXk0oDuTI
	EG2PhuEwrbxEGIFFofUN9HW1Grx0U61NODpabslhdU36PJWUpVPxToTaGeiFmLFkUa9ZmI+wWG0
	5ipzEXcQlxoU0mAWCr3bG5WmxxGWhnt6K8n698ziz6dDSV5Y5O1F71ZcAKebM6AIle4TMUcmBD7
	x1jPlzlmuXXrM8Quv20zWn+pOLUydwfO2YQ==
X-Received: by 2002:a05:7301:169a:b0:2ff:b29b:87b with SMTP id
 5a478bee46e88-3077b5fe235mr6554986eec.5.1781025577871; Tue, 09 Jun 2026
 10:19:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260609142637.373347-1-gary@kernel.org>
In-Reply-To: <20260609142637.373347-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 19:19:25 +0200
X-Gm-Features: AVVi8CeFkVbj9E3PXx3Az4UAa3Y8O7iOpi-vamCvayZRaQa0QwlC9T9yRU6Twpc
Message-ID: <CANiq72miJLmc2EadxUa+yVZ5T72QuTES4Gz=YVUsNivYvR=wDQ@mail.gmail.com>
Subject: Re: [PATCH v4] rust: make `build_assert` module the home of related macros
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Tamir Duberstein <tamird@kernel.org>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 4:27=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> This is the remaining unapplied patch from
> https://lore.kernel.org/rust-for-linux/20260319121653.2975748-1-gary@kern=
el.org/.

Thanks for rebasing! I had it as "Waiting for apply" in the
spreadsheet, but this saved me a bit of work.

Quick question below about the prelude...

> +#[doc(no_inline)]
> +pub use crate::build_assert::{
> +    build_assert,
> +    build_error,
> +    const_assert,
> +    static_assert, //
> +};

Did you split this for some reason? I moved the file to a single group
per crate when I moved the file to the new formatting style, so I was
wondering if we could keep it non-split. I mean, it may be nicer for
macros since it allows us to group them, but I hope we don't end up
with many `use`s again if we go down that road again...

Or perhaps you did it for the attribute, i.e. it may behave
differently, but I doubt that is the case? i.e. if `no_inline` somehow
behaves differently this way.

> rust/kernel/sync/atomic/predefine.rs

In this one you used the prelude, but in the others not -- which is
fine, we should be using the prelude more (though perhaps it is a
separate change), but I wonder if there was a reason.

Thanks!

Cheers,
Miguel
