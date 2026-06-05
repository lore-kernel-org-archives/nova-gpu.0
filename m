Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E236F30F803
	for <nova-gpu@lists.linux.dev>; Fri,  5 Jun 2026 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780647830; cv=pass; b=iB8rAEpxFAGS5Cy4oWmrLAZhXpH2rciqcUxGSCQr2WBM3ukI10vuPelmQSU8LiNoLJwWETed2GHNIKrKroMkTWxpsriBjDQud2htkpeTwTQm22zXpv5ICSpsLXCl4bqJ1YIbxiUpZdsdzQKagdhqvXELwqIPXYaZk+/ad8pmmoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780647830; c=relaxed/simple;
	bh=ztvFAQnPcWQQLPxoeTzlegVkk4Ybko5X4UCIpwXzV6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kb4qvk1HRalbF1QxSHte69sXs6M3Wj46rxcI0gs5uHuVOZZ7oRU2yledOBjWNmjPL7bIyEEWA8sgRJlpFaod+WiAs1HNpsxcBlE/R3RpoLsFXj6gniwwU60wNMk/1r2UCwZf6rhIWfmZ6aOXRpuEeWbTEa4NjGiAoYrloQsKWQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQ06F+Kh; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQ06F+Kh"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-304d4e57d33so48381eec.3
        for <nova-gpu@lists.linux.dev>; Fri, 05 Jun 2026 01:23:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780647828; cv=none;
        d=google.com; s=arc-20240605;
        b=iM2KFVMuLf6IzOBEq+ysRm+zAf58XAbkiy8L4ncnRNy5hSmOZR/QMGZxtvSpzc6Ffj
         W6Zrx0Wa9LYi8POsoghNee89jf8cbCA8Sd4zeiqn1RGxtS8MwCXRTARygVacGuWEb9Pt
         SM0O21eXG9R9Adnts0K1MzpPYa1u043O9ucjazjNU8C7PZVAHk/vMQW4ayK2JChZoSTp
         dH1kq3pDfqAo62yAFY9COt5YceRTrnErP/RU+bSyFJyxGpllGJWCFRvkS9cHmW6IdMGU
         6vs0J/SNakxcrnMTWX7uPSaYGbh5Xn+SRwTWNaIf8PdD9a981bXluD8oh08EDQSiy/VG
         xhOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Sd19hW4Zhi7QaeR4Q5YXb6X/rEi4eqFLIxE0KT8DhQ=;
        fh=BZ0YJDCgB8NZ+9SgIC/ZipDwSty7Px/+O2U+VENoEbc=;
        b=lklGqHxnoBUCIA9PlU7ETSo8Ug8KAYrm81q6oGdHeZ+OZea+IqK8+MGKYSymWN6cLv
         H88gSHlUKXVfcukRAM1RmqgEbzXu8Kpg7BkfhIMzzL5ih8Z5ngOgs1vvCDxXk7JU/3RQ
         yKrj7qTbhrAeCIPsan7zbvUcFLDFSwDAH5l8GW9ErN4TIas9hzhml1YASx5JO273rYaO
         /uPeRlMSmcbGgIdcYU/LcNxH6dTIElXOaGZoKCQTxN9haXCJHhdrtI/VP9wrSTw24aUP
         ETxi6McYb5wJoN1GbAIovSvaw8jfBXWpUTZVbZK1mM2gt4n/qwM/P9+PkgA8dMzMy5OC
         Rtpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780647828; x=1781252628; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Sd19hW4Zhi7QaeR4Q5YXb6X/rEi4eqFLIxE0KT8DhQ=;
        b=AQ06F+Kh6UkDaQz8b+1y4rFn+XukIIGAtXn/AABX38lGWGDYPH8ESAJNdZsYAdUAQu
         EDwjvB16kF9zoFrvUD34ICwxEe0mztUAEuVCpdlfq4dNmzrTrWfPzmX22NEkxwgs0S5+
         2BHroABJWgl0g6k714ilaW9glrne2tDtQNru1i9I0EBUJlJRpy73blEl4v62/OT9y4Po
         O+/emRlKhNRFdlE9Abf454UFy0CXuqeDmz0VoLCF6rLfBxj1c2yNXCwqX6Sy9oUFDqEq
         ejiNN/mdRC6eq+QHMKY6I4083yFXbLkSF/CiqzaOSV3magkKOnqHT+RoJamBGJ4jTvwO
         ShIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780647828; x=1781252628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Sd19hW4Zhi7QaeR4Q5YXb6X/rEi4eqFLIxE0KT8DhQ=;
        b=Q+4G97M5zN6wCbckNG5ZOSTQ7J+m35a22nIDdR59vsQicqMgdHwnxzaHR48QUihQax
         9u+Qjy0bNpWu09/a3OT6ix21y+xvKAHeJjZK6XGqEABKLavSeLi2lEmSxAlzTUHEPuJH
         Q4r2yxC4KrADRhSWR9nQe9iWGu8+e3WebJtj+o55QUTczFIYWUqYjlUpzMOFGYvU7UMy
         ynA9rUjVhJUKK8ED+k0svZLcOmJBu99SWbHMWEeEPTdoJAWcdR+XYDTCdYq7oQD1z15X
         EhhN6oX0wiPvjotHNlufRLwNSuyK79b/E8KVVJpv227fffx+aNH+nNHVQ61yfun6yr+n
         6Haw==
X-Forwarded-Encrypted: i=1; AFNElJ/OBKfpEzxEhrwwPiA25LXieCRKbvM98H1uNuzP2o3K8zEEHUfl2RS3nkW+HBxQ4RZEbt65LmFW5w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxX9OZyKPxOKs7Bkc3fGgcDvBd52AfANQC5EFr1PcEDmdWdSj4Z
	CmAHrFUdnRNIFiKxHyExAPA4NpZCan+PSv+M2GVO6TsXTqpXnRIFlts/1MCSKjUkKGZ7hpidaXN
	c5NBOQ/w/h2WcuaHnoWwaobzQ6ercxJY=
X-Gm-Gg: Acq92OHIWmzF4tTJHWPeUeWIhj4xUX7x1X++mTwNGNYkhn510nvQA33tQx5JQv5ZG4m
	e3/z13LfvuQmlm5kWB1PXHQ4xsaimt1YhcNdb1Anu0QbYlhHf5Aa2goDU5o4ckqvxCajhPg3Bqa
	haWpnKnEV3fA7reFWMTrvKmnlpCHzjrFc7dDXjRBZWbX+mtbYq4kGZjM3MLbL64fFs38LefduIL
	Vz/mzcl74Oeit5maojJ5RnooghwrhIl7yyjrgDhGn9BgjJPcIGNoHDlONXl1yeSryDwKlog/EBV
	/m6AM8yMrBMZJHcE2/sESsm4v4I9OtfSaIuz7oHL3impS8ly/CpSH2/hGfdM11491AP7h6qOa/U
	bQGkljU5m+SbNeoC+xiPOqmHMxaiVATa2nQ==
X-Received: by 2002:a05:693c:3749:b0:304:c73b:79fd with SMTP id
 5a478bee46e88-3077b21905fmr565626eec.5.1780647827968; Fri, 05 Jun 2026
 01:23:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260602-projection-syntax-rework-v2-0-6989470f5440@garyguo.net>
In-Reply-To: <20260602-projection-syntax-rework-v2-0-6989470f5440@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Jun 2026 10:23:34 +0200
X-Gm-Features: AVVi8Cc0V_mPWbgZwqJ5GOMV5Xx3qEWLtYtwsW8Dxd-NGXwfyyP5qAGAP7_StUw
Message-ID: <CANiq72=87b1heSP3ssk4+9E4+1Vy_Zk9eSC_9EF9Cs_mUT=hpQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Rework index projection syntax
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 4:18=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This series reworks the index projection syntax in the pointer
> projection infrastructure to use the keyworded syntax to be more explicit=
.
>
> Doing this allows adding a new panicking variant of index projection,
> just like the normal index operator. This is useful for cases where
> compiler cannot prove (or cannot reliably prove) access is inbounds.
>
> The new syntax looks like this:
> - `[try: index]`: Fallible indexing (replaces `[index]?`).
> - `[build: index]`: Build-time checked indexing (replaces `[index]`).
> - `[panic: index]`: Runtime panicking indexing (newly added).
>
> DMA sample driver and nova core is updated.
>
> Danilo, we previously discussed merging this series with I/O projection f=
or
> patch logistics. However, I'll need more time for next version of I/O
> projection (implementing view types that have original container type
> erased) which won't make it this cycle. This new version for projection
> syntax rework is minor changes only comparde to v1, so I think it's worth
> sending out so it can still land this cycle and get out of the way.

Applied to `rust-next` -- thanks everyone!

    [ Reworded docs slightly. - Miguel ]

    [ Fixed broken intra-doc link. Added a few extra intra-doc links. Rewor=
ded
      some docs slightly. - Miguel ]

Cheers,
Miguel
