Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE12941737E
	for <nova-gpu@lists.linux.dev>; Tue,  7 Jul 2026 13:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431139; cv=pass; b=shOBl12Mm8LR53woEDzOZirhdjUuApRGcs2v/aYRZ7as1DLtNf5Ufzd/CsGXCZ3qtEqelltF94/o1ma/2vrIXzrYp2Czuhe54S+X/q42TVkkWndx5987M0K7HEKkUbeEmujW3okWsFHv9MIZVCdirVzqGprH4fDjp4KsrEH77aQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431139; c=relaxed/simple;
	bh=GUFsCk/2NzYF0/une/bLFGZZu5KrtRApK/yrChMm6zs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a8USXgS+do+Y+nkmAhYpFSMxgTa+xIg4Q1zIg4RBZ5ug9p7w9wDOIEwRcwwb6SkPNBKrR7HRyUM63XWSH1w4cHhj5shFXRXqa5MGfJ34fsNjGSDzy0J8635E/9kebP9x6bwt/VevHINdL5WUc7Qc0Lo50yxVsTLAgLwqBvlyF60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=smdDSnKv; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="smdDSnKv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47122683cf3so2724934f8f.0
        for <nova-gpu@lists.linux.dev>; Tue, 07 Jul 2026 06:32:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783431136; cv=none;
        d=google.com; s=arc-20260327;
        b=cye4777AfwKckblPvl1X3H+XnQZB9ETjnyadewTQGoOQFySuyymHRaTWEAVKdpn0yw
         en/wEl/3/kgjAiUwQIy29UxJAAYaqSB2jR3Sb2TNwLwiXdjjPwTdXDpa+pVBPSe06pg5
         SF5EIM5E8TnvkmsP7gRWUGnX/Cv6IPt3ALjRVY6Sx581K3kUCdCwc5cz31DbkrYgi0xj
         NU9zgTJH6RNASkZoVbjxmEIeIC51oI6l76H7R5+RK5HHxQXQ6sIJqJLwuq78RFK5wEZS
         e9qbILap/INflYIFPwlTbrAh+/0dD053+ugHRSpkkFUsPkKDUNNXOu5JPR+Pfi7sbxcR
         XYLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YbvH0rz9v2LuEGavTdE4vxLt1YV7PzWsO2f3mHG+f40=;
        fh=MCfbGrfAxohbr5TKN0eqmz8a2BUvxFDlLYjjbHJQKGM=;
        b=fPYPFuhMybwIyPpTm3ZG4XQt41RgQH0inPEUqknczvmZSZklV+EzPrKFghIKhSzAyW
         mcOFClxjZd/y1X96w/Y0jmIgMpv8eDnuOcKQZ3XfDhM6DTnbXBIQCzb/YwNOOyuYqTA2
         E64M7f2RjeSrAupWpyl/KDmZiu4s5C8tNQEwK/p2zXmSbZolljrll/zrOpdPtfRpdS4w
         cYd7vCQ5EZLVdjPBEOmdmUcuvep/ZrhlyRcuKYfW3Dqjqip9kj6defF5TfTosDEBI3mB
         iGVyArpluY4tQ1qUVRw/4m8MWHAozfgamXpfDcYKJb6YGhXFFgpgyxBWUd7gregxNYqw
         i5yg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783431136; x=1784035936; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbvH0rz9v2LuEGavTdE4vxLt1YV7PzWsO2f3mHG+f40=;
        b=smdDSnKvZbd2pqBg71qAXfUgdLQJS3Jyxh6FISI7bXk038woUwMklgup5XO/DPsUxf
         RMG9sBeVlaEXidjrxZkTKlKx5+hY8J8wrsXtxaw6c2Tca6Ii+wdlN6aBDoI6mFRhVqNk
         vfyoSrJ35suS9u8Kct4qd4bmpGFbglOmDdhWsnHZXWPBqp5Dw+BFoArwpUSqlzWwytEZ
         F0av1Ia6zfpJpJtoKS6+dZ/o2alYh/RI5ZGjYI4QxGBdP5hvO04yG7t7TUUNYt8hCBaQ
         Kx7r19bfvmhQJ1YYKQNNTgnf226BLVvn3rk2edXrJvVi0PkL1EMj255uH4CW7L4fLNRG
         6WUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431136; x=1784035936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YbvH0rz9v2LuEGavTdE4vxLt1YV7PzWsO2f3mHG+f40=;
        b=oofBELwvNOmC01sPmSuP+Qt6be3hLzVsKujmjieZHkrvNOYlg6hGqSqE0lgXfmUzAC
         WfYkUs0AzQOOJeApCjMWVg5Q+CqH2d71h933gMpMwq8XmkkZ75K8N7S4tPNGzS2ng71K
         Hhzf1hHQigT4yL8XOAgwo/HEbvX6WlMyJFpTxE7M/8d0Ku8m95nbYDKjZy66NKWLtC7j
         jOFgKyCwuG73nDdxmlcTh+cHL1OsbXDYdzTfRmACGh3KiKk7UEaNDQLL3Y/3/G4S4dys
         0ewsfrc20kNP5l8XQe35AKpzVRLJuodohoaPcY0X/J+fk3npAdzICAdZRHrjrh9JdNwV
         mUBA==
X-Forwarded-Encrypted: i=1; AHgh+Rpzx3h7D/MARlmg6jzUGOmoERqYmLNj2jj/rv+6/7xDDSBpK4mIaZeitTrbgunhDcEZVr8tzQGAuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHwK06WnuGxilY+Zk/8jccckXN032SblMUk6jjJblsTc2oIsJZ
	z9otINopaNWduWGzWJAincUnKj9NyQHanImvEaw+gNWWHyYJLo6yMMjGyl0aGdaWH/pv23JTnMb
	WyIxiGVaVGonKpkqhoCYezzWZij8/swXab+Qc1fXU
X-Gm-Gg: AfdE7cnPPo9HQziFa2w1xS1abTpukZu17hFnbsav8HRfaImXC/p17w6bxpZ3CviqoNt
	3TtVNDsjAJ9FEAIN4YoypIjByg5LlqcRld0V3soNp5nKbKITzCT4JLOq7nn78u180F8Ys+itj5G
	YMYWLs9Ofm7BUBBEZ/5svMunEZFHLWhtdwllz3DtPMZMazGV8ygaXOFYADKEjSHz+5/yEkeSSm3
	+DxlCl9HIu91QsjzIDDX3VXGNHM7Egwx8rNEBFxHsi8c2p/SAiueTqzq8DXWxsFve/3qkhsft2b
	J8/PbxxTD/Aos+HkLNWbmgWx139P2mZiOqVH5g==
X-Received: by 2002:a05:600c:3115:b0:492:3e66:6c84 with SMTP id
 5b1f17b1804b1-493df095172mr60789075e9.30.1783431135794; Tue, 07 Jul 2026
 06:32:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com> <akuV_GRAM4QPqf-o@google.com>
 <DJSDG3RE8MDB.135TG7FX4Z1G1@nvidia.com>
In-Reply-To: <DJSDG3RE8MDB.135TG7FX4Z1G1@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 7 Jul 2026 15:32:03 +0200
X-Gm-Features: AVVi8CeuDxVjaDzyUQSDcYcmcH9Nnk9YtXJ9KbqPE51Mhk7CXpF1V1tW2Dtgja0
Message-ID: <CAH5fLgidT1MFYp8Qc70yeYmKBSi-LFKQWw+M_kjR6b2N1ypMEA@mail.gmail.com>
Subject: Re: [PATCH 0/4] rust: Add support for reserving of ranges of IDs
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Burak Emir <bqe@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 3:26=E2=80=AFPM Eliot Courtney <ecourtney@nvidia.com=
> wrote:
>
> On Mon Jul 6, 2026 at 8:48 PM JST, Alice Ryhl wrote:
> > On Fri, Jul 03, 2026 at 07:16:03PM +0900, Eliot Courtney wrote:
> >> Add support for reserving of ranges of IDs, with a usage in nova-core
> >> for channel IDs. This entails adding the helpers+users of the C bitmap
> >> API for ranges of bits, then users of that in `IdPool`, and finally a
> >> user of `IdPool` in nova-core, `ChannelIdPool`.
> >
> > If you need ranges of IDs, perhaps you want the maple tree instead?
> >
> > Alice
>
> I think maple tree would work, but it looked like not as good a fit to
> me because:
> - the number of channel IDs is small (limited to 2048)
> - allocation of a contiguous sequence of channel IDs is sometimes
>   aligned to its size (which should be a power of two, AFAICT) - I
>   realise patch 4 doesn't reflect this (yet). The bitmap APIs natively
>   support this.
> - maple tree's alloc_range stores a value: T for the range which isn't
>   necessary for ID alloc

The limited number of channel IDs (2048) is a good reason to use a
bitmap. Please include this context in the commit message for the next
version.

Alice
